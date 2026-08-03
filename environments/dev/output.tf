output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnet_ids" {
  value = module.vpc.public_subnet_ids
}

output "private_subnet_ids" {
  value = module.vpc.private_subnet_ids
}

output "alb_security_group_id" {
  value = module.security_group.alb_security_group_id
}

output "ec2_security_group_id" {
  value = module.security_group.ec2_security_group_id
}

output "database_security_group_id" {
  value = module.security_group.database_security_group_id
}

output "alb_dns_name" {
  value = module.alb.alb_dns_name
}
