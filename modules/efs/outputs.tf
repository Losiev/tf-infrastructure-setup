output "efs_id" {
  value       = aws_efs_file_system.aws_efs.id
  description = "The ID of the created EFS file system"
}

output "mount_target_id" {
  value       = aws_efs_mount_target.aws_efs.id
  description = "The ID of the created EFS mount target"
}
