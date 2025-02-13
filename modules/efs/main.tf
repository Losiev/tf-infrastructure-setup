resource "aws_efs_file_system" "aws_efs" {
  creation_token = "tm-devops-trainee-efs"
  performance_mode = "generalPurpose"
  encrypted = true

  tags = {
    Name = "tm-devops-trainee-efs"
  }
}

resource "aws_efs_mount_target" "aws_efs" {
  file_system_id = aws_efs_file_system.aws_efs.id
  subnet_id      = var.subnet_id
  security_groups = [var.security_group_id]

  lifecycle {
    create_before_destroy = true 
  }
}
