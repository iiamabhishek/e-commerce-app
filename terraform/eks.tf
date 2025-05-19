module "eks" {

  source  = "terraform-aws-modules/eks/aws"
  version = "19.15.1"

  cluster_name                   = var.name
  cluster_endpoint_public_access = true

  cluster_addons = {
    coredns = {
      most_recent = true
    }
    kube-proxy = {
      most_recent = true
    }
    vpc-cni = {
      most_recent = true
    }
  }

  vpc_id                   = module.vpc.vpc_id
  subnet_ids               = module.vpc.public_subnets
  control_plane_subnet_ids = module.vpc.intra_subnets

  # EKS Managed Node Group(s)

  eks_managed_node_group_defaults = {
    instance_types = [var.instance_type]
    attach_cluster_primary_security_group = true
  }

  eks_managed_node_groups = {
    tws-demo-ng = {
      min_size     = 1
      max_size     = 3
      desired_size = 1

      instance_types = [var.instance_type]
      capacity_type  = "SPOT"

      disk_size = var.disk_size
      use_custom_launch_template = false

      tags = {
        Name        = var.name
        Environment = var.environment
        ExtraTag    = "e-commerce-app"
      }
    }
  }
 
  tags = var.tags

}

data "aws_instances" "eks_nodes" {
  instance_tags = {
    "eks:cluster-name" = module.eks.cluster_name
  }

  filter {
    name   = "instance-state-name"
    values = ["running"]
  }

  depends_on = [module.eks]
}