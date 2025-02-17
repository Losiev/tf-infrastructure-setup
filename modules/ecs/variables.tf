variable "ecs_cluster_id" {
  description = "The ID of the ECS cluster"
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs for ECS tasks"
  type        = list(string)
}

variable "security_group_id" {
  description = "The security group ID for the ECS tasks"
  type        = string
}

variable "efs_id" {
  description = "The ID of the EFS file system"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID for ECS"
  type        = string
}

variable "alb_sg_id" {
  description = "The security group ID of ALB"
  type        = string
}

variable "efs_sg_id" {
  description = "Security Group ID for EFS"
  type        = string
}

variable "alb_target_group_arn" {
  description = "Target Group ARN from ALB"
  type        = string
}
