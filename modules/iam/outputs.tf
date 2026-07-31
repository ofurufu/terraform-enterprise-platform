output "instance_profile_name" {
  description = "EC2 Instance Profile name"
  value       = aws_iam_instance_profile.ec2_profile.name
}

output "iam_role_name" {
  description = "IAM Role name"
  value       = aws_iam_role.ec2_role.name

}

output "iam_role_arn" {
  description = "IAM Role ARN"
  value       = aws_iam_role.ec2_role.arn
}