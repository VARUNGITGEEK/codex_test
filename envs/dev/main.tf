module "network" {
  source = "../../modules/network"

  name               = var.name
  vpc_cidr           = var.vpc_cidr
  public_subnet_cidr = var.public_subnet_cidr
  availability_zone  = var.availability_zone
  tags               = var.tags
}

module "security_group" {
  source = "../../modules/security_group"

  name     = var.name
  vpc_id   = module.network.vpc_id
  ssh_cidr = var.ssh_cidr
  app_port = var.app_port
  app_cidr = var.app_cidr
  tags     = var.tags
}

module "ec2" {
  source = "../../modules/ec2_instance"

  name                   = var.name
  ami_id                 = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = module.network.public_subnet_id
  vpc_security_group_ids = [module.security_group.security_group_id]
  key_name               = var.key_name
  user_data              = var.user_data
  tags                   = var.tags
}
