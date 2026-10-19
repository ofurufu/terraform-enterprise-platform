variable "project_name" {
  description = "Project name used for resource naming"
  type        = string
}

variable "environment" {
  description = "Deployment environment"
  type        = string
}

variable "autoscaling_group_name" {
  description = "Name of the Auto Scaling Group to attach scaling policies to"
  type        = string
}

variable "scale_out_adjustment" {
  description = "Number of instances to add during scale-out"
  type        = number
  default     = 1
}

variable "scale_in_adjustment" {
  description = "Number of instances to remove during scale-in"
  type        = number
  default     = -1
}

variable "scale_out_cooldown" {
  description = "Cooldown period in seconds after a scale-out activity"
  type        = number
  default     = 300
}

variable "scale_in_cooldown" {
  description = "Cooldown period in seconds after a scale-in activity"
  type        = number
  default     = 300
}