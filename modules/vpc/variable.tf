variable "project_name" {
  description = "project name"
  type        = string
}

variable "environment" {
  description = "deployment environment"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for the vpc"
  type        = string
}

variable "public_subnet_1" {
  type = string
}

variable "public_subnet_2" {
  type = string
}

variable "private_subnet_1" {
  type = string
}

variable "private_subnet_2" {
  type = string
}

variable "availability_zone_1" {
  type = string
}

variable "availability_zone_2" {
  type = string
}