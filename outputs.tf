output "alb_dns_name" {
  value       = module.alb.alb_dns_name
  description = "The DNS name of the ALB"
}

output "efs_id" {
  value       = module.efs.efs_id
  description = "The ID of the EFS file system"
}

output "ecs_service_name" {
  value       = module.ecs.ecs_service_name
  description = "The name of the ECS service"
}
