terraform {
  required_version = "1.2.6"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.25.0"
    }
    cloudinit = {
      source  = "hashicorp/cloudinit"
      version = "2.2.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.12.1"
    }
    null = {
      source  = "hashicorp/null"
      version = "3.1.1"
    }
    tls = {
      source  = "hashicorp/tls"
      version = "3.4.0"
    }
  }
}

//  set the environment type
variable "prod" {
  type    = bool
  default = false
}

//  get the required data values as they're needed
data "aws_availability_zones" "available" {}

data "aws_eks_cluster" "eks" {
  name = module.eks.cluster_id
}

data "aws_eks_cluster_auth" "eks" {
  name = module.eks.cluster_id
}

//  set up providers
provider "aws" {
  region = "us-east-1"
}

provider "kubernetes" {
  host                   = data.aws_eks_cluster.eks.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.eks.certificate_authority[0].data)
  token                  = data.aws_eks_cluster_auth.eks.token
}

//  create VPC, subnets, route tables, gateways & EIP
module "vpc" {
  source               = "terraform-aws-modules/vpc/aws"
  version              = "3.14.2"
  name                 = "vpc"
  cidr                 = "10.0.0.0/16"
  azs                  = data.aws_availability_zones.available.names
  private_subnets      = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets       = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
  enable_nat_gateway   = true
  single_nat_gateway   = true
  enable_dns_hostnames = true
  public_subnet_tags = {
    "kubernetes.io/role/elb" = "1"
  }
  private_subnet_tags = {
    "kubernetes.io/role/internal-elb" = "1"
  }
}

//  create node groups, iam roles, openid provider, cluster & cloudwatch log
module "eks" {
  source                          = "terraform-aws-modules/eks/aws"
  version                         = "18.26.6"
  cluster_name                    = "cluster"
  cluster_version                 = "1.22"
  cluster_endpoint_private_access = true
  cluster_endpoint_public_access  = true
  subnet_ids                      = module.vpc.private_subnets
  vpc_id                          = module.vpc.vpc_id
  eks_managed_node_groups = {
    default = {
      name          = "default"
      instance_type = "t3.small"
      desired_size  = 1
    }
  }
}

//  deploy website on a public endpoint
resource "kubernetes_service" "deploy" {
  metadata {
    name = "deploy"
  }
  spec {
    type = "LoadBalancer"
    selector = {
      app = "website"
    }
    port {
      port        = 80
      target_port = 80
    }
  }
}

resource "local_file" "endpoint" {
  content  = kubernetes_service.deploy.status[0].load_balancer[0].ingress[0].hostname
  filename = ".endpoint"
}

//  create test pod from latest image if PROD environment is unset
resource "kubernetes_pod" "testenv" {
  count = var.prod ? 0 : 1
  metadata {
    name = "testenv"
    labels = {
      app = "website"
    }
  }
  spec {
    container {
      name  = "website"
      image = "piotrowsianko/project:latest"
    }
  }
}

//  create pod from stable image if PROD environnment is set
resource "kubernetes_pod" "prodenv" {
  count = var.prod ? 1 : 0
  metadata {
    name = "prodenv"
    labels = {
      app = "website"
    }
  }
  spec {
    container {
      name  = "website"
      image = "piotrowsianko/project:latest"
    }
  }
}