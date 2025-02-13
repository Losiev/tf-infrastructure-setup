variable "subnet_id" {
  description = "The ID of the subnet where EFS will be mounted"
  type        = string
}

variable "security_group_id" {
  description = "The security group ID for the EFS mount target"
  type        = string
}
