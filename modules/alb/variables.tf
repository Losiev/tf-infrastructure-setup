variable "vpc_id" {
  description = "VPC ID for ALB"
  type        = string
}

variable "subnets" {
  description = "Subnets list for ALB"
  type        = list(string)
}
