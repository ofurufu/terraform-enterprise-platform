output "launch_template_id"{
  description = "Launch Template ID"
  value       = aws_launch_template.app.id
}

output "launch_template_latest_version" {
  description = "Launch Template Latest Version"
  value       = aws_launch_template.app.latest_version

}

output "instance_id" {
  description = "EC2 Instance ID"
  value       = aws_instance.app.id
}