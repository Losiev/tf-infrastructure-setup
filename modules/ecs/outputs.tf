output "ecs_task_definition_arn" {
  value       = aws_ecs_task_definition.nginx_task.arn
  description = "The Amazon Resource Name of the ECS task definition"
}

output "ecs_sg_id" {
  value = aws_security_group.ecs_sg.id
}

output "ecs_service_name" {
  value       = aws_ecs_service.nginx_service.name
  description = "The name of the ECS service"
}
