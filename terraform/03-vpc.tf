module "vpc" {
    source = "terraform-aws-modules/vpc/aws"
    version = "3.14.2"
    name = "vpc"
    cidr = "10.0.0.0/16"
    azs = data.aws_availability_zones.available.names
    private_subnets      = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
    public_subnets       = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
    database_subnets     = ["10.0.7.0/24", "10.0.8.0/24", "10.0.9.0/24"]
    create_database_subnet_group       = true
    create_database_subnet_route_table = true
    create_database_internet_gateway_route = true
    enable_nat_gateway   = true
    single_nat_gateway   = true
    enable_dns_hostnames = true
    enable_dns_support   = true
    public_subnet_tags = {
        "kubernetes.io/role/elb" = "1"
    }
    private_subnet_tags = {
        "kubernetes.io/role/private-elb" = "1"
    }
}

