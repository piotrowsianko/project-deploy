terraform {
	backend "s3" {
		bucket = "gl-piotrowsianko-projectapp"
		key = "production/terraform.tfstate"
		region = "us-east-1"
	}
	required_providers {
		aws = {
			source = "hashicorp/aws"
			version = "4.23.0"
		}
		kubernetes = {
			source = "hashicorp/kubernetes"
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
provider "aws" {
	region = "us-east-1"
	}

provider "azurerm"{
	features {}
 
  # Configure a specific Subscription ID (optional)
  subscription_id = "dfcefdc0-4ded-42a0-933b-100fbb1721ed"
	}
data "aws_eks_cluster" "eks" {
  name = module.eks.cluster_id
}

data "aws_eks_cluster_auth" "eks" {
  name = module.eks.cluster_id
}
data "aws_availability_zones" "available" {}

provider "kubernetes" {
  host                   = data.aws_eks_cluster.eks.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.eks.certificate_authority[0].data)
  token                  = data.aws_eks_cluster_auth.eks.token
}
