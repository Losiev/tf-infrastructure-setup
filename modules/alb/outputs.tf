output "alb_dns_name" {
  value       = aws_lb.trainee_alb.dns_name
  description = "DNS name for ALB"
}
