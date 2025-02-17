variable "vpc_id" {
  description = "VPC ID for EFS"
  type        = string
}

variable "subnet_ids" {
  description = "A list of subnet IDs for the ECS and ALB"
  type        = list(string)
}
