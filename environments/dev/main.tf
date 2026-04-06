locals {
  name_prefix = "platform-${var.environment}"

  common_tags = {
    Environment = var.environment
    ManagedBy   = "Terraform"
    Project     = "multi-env-eks"
  }
}

module "network" {
  source = "../../modules/network"

  name                 = local.name_prefix
  vpc_cidr             = var.vpc_cidr
  availability_zones   = var.availability_zones
  private_subnet_cidrs = var.private_subnet_cidrs
  public_subnet_cidrs  = var.public_subnet_cidrs
  tags                 = local.common_tags
}

module "eks" {
  source = "../../modules/eks"

  name                      = local.name_prefix
  cluster_version           = var.cluster_version
  vpc_id                    = module.network.vpc_id
  private_subnet_ids        = module.network.private_subnet_ids
  node_group_instance_types = var.node_group_instance_types
  node_group_min_size       = var.node_group_min_size
  node_group_max_size       = var.node_group_max_size
  node_group_desired_size   = var.node_group_desired_size
  tags                      = local.common_tags
}
