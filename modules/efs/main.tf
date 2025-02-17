# EFS MAIN
resource "aws_security_group" "efs_sg" {
  name        = "efs-sg"
  description = "Allow inbound traffic on port 2049 for EFS"
  
  ingress {
    from_port   = 2049
    to_port     = 2049
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_efs_file_system" "aws_efs" {
  creation_token = "tm-devops-trainee-efs"
  performance_mode = "generalPurpose"
  encrypted = true

  tags = {
    Name = "tm-devops-trainee-efs"
  }
}

resource "aws_efs_mount_target" "aws_efs" {
  for_each       = toset(var.subnet_ids)
  file_system_id = aws_efs_file_system.aws_efs.id
  subnet_id      = each.value
  security_groups = [aws_security_group.efs_sg.id]

  depends_on = [aws_security_group.efs_sg]
}
