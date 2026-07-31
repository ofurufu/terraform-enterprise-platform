output "alb_dns_name" {
  description = "Application Load Balancer DNS name"
  value       = aws_alb.app.dns_name
}

output "alb_arn" {
  description = "Application Load Balancer ARN"
  value       = aws_alb.app.arn
}

output "target_group_arn" {
  description = "Target Group ARN"
  value       = aws_lb_target_group.app.arn
}

output "listener_arn" {
  description = "Listener ARN"
  value       = aws_lb_listener.http.arn
}
