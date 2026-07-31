module "vpc" {
  source = "../../modules/vpc"

  project_name = var.project_name
  environment  = var.environment

  vpc_cidr = var.vpc_cidr

  public_subnet_1 = var.public_subnet_1
  public_subnet_2 = var.public_subnet_2

  private_subnet_1 = var.private_subnet_1
  private_subnet_2 = var.private_subnet_2

  availability_zone_1 = var.availability_zone_1
  availability_zone_2 = var.availability_zone_2
}

module "security_group" {
  source = "../../modules/security-group"

  project_name = var.project_name
  environment  = var.environment

  vpc_id = module.vpc.vpc_id
}

module "iam" {

  source = "../../modules/iam"

  project_name = var.project_name
  environment  = var.environment

}

module "ec2" {
  source = "../../modules/ec2"

  project_name = var.project_name
  environment  = var.environment

  private_subnet_id     = module.vpc.private_subnet_ids[0]
  ec2_security_group_id = module.security_group.ec2_security_group_id
  instance_profile_name = module.iam.instance_profile_name
  instance_type         = "t3.micro"
}

module "alb" {
  source = "../../modules/alb"

  project_name = var.project_name
  environment  = var.environment

  vpc_id                 = module.vpc.vpc_id
  public_subnet_ids      = module.vpc.public_subnet_ids
  alb_security_group_ids = module.security_group.alb_security_group_id
  instance_id            = module.ec2.instance_id
}