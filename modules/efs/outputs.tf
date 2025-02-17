output "efs_id" {
  value       = aws_efs_file_system.aws_efs.id
  description = "The ID of the created EFS file system"
}

output "efs_sg_id" {
  description = "The ID of the security group for EFS"
  value       = aws_security_group.efs_sg.id
}

output "mount_target_ids" {
  description = "IDs of the EFS mount targets"
  value       = [for mt in aws_efs_mount_target.aws_efs : mt.id]
}
