module "eks" {
    source = "terraform-aws-modules/eks/aws"
    version = "18.27.1"
    cluster_name = "production"
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

#resource "null_resource" "noname" {
#  depends_on = [module.eks]
#  provisioner "local-exec" {
#    command = "aws eks --region us-east-1 update-kubeconfig --kubeconfig .kube --name ${module.eks.cluster_id}"
#    }
#}