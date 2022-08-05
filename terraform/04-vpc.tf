module "vpc" {
    source = "terraform-aws-modules/vpc/aws"
    version = "3.14.2"
    name = "production-vpc"
    cidr = "10.0.0.0/16"
    azs = ["us-east-1a", "us-east-1b", "us-east-1c", "us-east-1d", "us-east-1e", "us-east-1f"]
    private_subnets      = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
    public_subnets       = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
    enable_nat_gateway   = true
    single_nat_gateway   = true
    enable_dns_hostnames = true
    public_subnet_tags = {
        "kubernetes.io/role/elb" = "1"
    }
    private_subnet_tags = {
        "kubernetes.io/role/private-elb" = "1"
    }
}