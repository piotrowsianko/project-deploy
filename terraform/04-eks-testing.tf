module "eks_testing" {
    source = "terraform-aws-modules/eks/aws"
    version = "18.27.1"
    cluster_name = "testing"
    cluster_version = "1.22"
    cluster_endpoint_private_access = true
    cluster_endpoint_public_access = true
    subnet_ids = module.vpc.public_subnets
    vpc_id = module.vpc.vpc_id
    eks_managed_node_groups = {
        default = {
        name = "default"
        instance_type = "t3.small"
        desired_size  = 1
        }
    }
}