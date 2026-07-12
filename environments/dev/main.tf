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