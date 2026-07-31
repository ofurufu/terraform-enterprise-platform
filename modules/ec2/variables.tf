variable "project_name" {
  type = string
}

variable "environment" {
  type = string
}

variable "private_subnet_id" {
  description = "Private subnet for the EC2"
  type        = string
}

variable "ec2_security_group_id" {
  description = "Security group for the EC2"
  type        = string
}

variable "instance_profile_name" {
  description = "IAM Instance Profile"
  type        = string
}

variable "instance_type" {
  description = "EC2 Instance type"
  type        = string
}