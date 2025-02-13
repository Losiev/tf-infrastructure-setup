variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
}

variable "subnet_ids" {
  description = "A list of subnet IDs for the ECS and ALB"
  type        = list(string)
}

variable "subnet_id" {
  description = "A single subnet ID for EFS"
  type        = string
}

variable "security_group_id" {
  description = "Security group ID for ECS"
  type        = string
}

variable "ecs_cluster_id" {
  description = "ECS cluster ID"
  type        = string
}

variable "efs_id" {
  description = "The ID of the EFS file system"
  type        = string
}

variable "ecs_service_name" {
  description = "The name of the ECS service"
  type        = string
}
