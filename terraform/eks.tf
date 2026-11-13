#checkov:skip=CKV_TF_1:Terraform Registry module uses version constraints
module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.0"

  cluster_name    = var.cluster_name
  cluster_version = "1.35"

  cluster_endpoint_public_access = false

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.public_subnets

  eks_managed_node_groups = {
    default = {
      subnet_ids = module.vpc.public_subnets

      create_launch_template     = false
      use_custom_launch_template = false

      instance_types = ["t3.small"]
      min_size       = 1
      max_size       = 1
      desired_size   = 1
    }
  }
}