output "alb_dns_name" {
  value       = aws_lb.trainee_alb.dns_name
  description = "DNS name for ALB"
}

output "alb_sg_id" {
  description = "Security Group ID for ALB"
  value       = aws_security_group.alb_sg.id
}

output "target_group_arn" {
  value = aws_lb_target_group.trainee_target_group.arn
}
