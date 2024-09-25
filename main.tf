module "vpc" {
  source = "./modules/vpc"

  vpc_cidr             = var.vpc_cidr
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
}

module "security" {
  source = "./modules/security"

  vpc_id = module.vpc.vpc_id
}

module "compute" {
  source = "./modules/compute"

  key_name           = var.key_name
  public_subnet_ids  = module.vpc.public_subnet_ids
  private_subnet_ids = module.vpc.private_subnet_ids
  bastion_sg_id      = module.security.bastion_sg_id
  web_sg_id          = module.security.web_sg_id
  app_sg_id          = module.security.app_sg_id
}