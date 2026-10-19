resource "aws_autoscaling_policy" "scale_out" {
  name                   = "${var.project_name}-${var.environment}-scale-out"
  autoscaling_group_name = var.autoscaling_group_name

  adjustment_type    = "ChangeInCapacity"
  scaling_adjustment = var.scale_out_adjustment
  cooldown           = var.scale_out_cooldown
}

resource "aws_autoscaling_policy" "scale_in" {
  name                   = "${var.project_name}-${var.environment}-scale-in"
  autoscaling_group_name = var.autoscaling_group_name

  adjustment_type    = "ChangeInCapacity"
  scaling_adjustment = var.scale_in_adjustment
  cooldown           = var.scale_in_cooldown
}

resource "aws_cloudwatch_metric_alarm" "scale_out" {
  alarm_name          = "${var.project_name}-${var.environment}-scale-out"
  alarm_description   = "Scale out the application ASG when average CPU utilization is high"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 5
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 60
  statistic           = "Average"
  threshold           = 70

  dimensions = {
    AutoScalingGroupName = var.autoscaling_group_name
  }

  alarm_actions = [
    aws_autoscaling_policy.scale_out.arn
  ]

  tags = {
    Name        = "${var.project_name}-${var.environment}-scale-out-alarm"
    Project     = var.project_name
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}

resource "aws_cloudwatch_metric_alarm" "scale_in" {
  alarm_name          = "${var.project_name}-${var.environment}-scale-in"
  alarm_description   = "Scale in the application ASG when average CPU utilization is low"
  comparison_operator = "LessThanOrEqualToThreshold"
  evaluation_periods  = 5
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 60
  statistic           = "Average"
  threshold           = 30

  dimensions = {
    AutoScalingGroupName = var.autoscaling_group_name
  }

  alarm_actions = [
    aws_autoscaling_policy.scale_in.arn
  ]

  tags = {
    Name        = "${var.project_name}-${var.environment}-scale-in-alarm"
    Project     = var.project_name
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}