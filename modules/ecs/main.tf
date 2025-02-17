resource "aws_ecs_cluster" "main" {
  name = "trainee-ecs-cluster"
}

resource "aws_security_group" "ecs_sg" {
  name        = "ecs-sg"
  description = "Allow traffic for ECS"
  vpc_id      = var.vpc_id

  ingress {
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [var.alb_sg_id]
  }

  ingress {
    from_port        = 2049
    to_port          = 2049
    protocol         = "tcp"
    security_groups  = [var.efs_sg_id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}

resource "aws_ecs_task_definition" "nginx_task" {
  family                   = "nginx-task"
  requires_compatibilities  = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = "1024"
  memory                   = "2048"

  container_definitions = jsonencode([{
    name      = "nginx-container"
    image     = "nginx:1.21.6"
    essential = true

    mountPoints = [ {
      sourceVolume  = "efs-volume"
      containerPath = "/usr/share/nginx/html"
    }]

    portMappings = [ {
      containerPort = 80
      hostPort      = 80
      protocol      = "tcp"
    }]
  }])

  volume {
    name = "efs-volume"

    efs_volume_configuration {
      file_system_id = var.efs_id
    }
  }
}

resource "aws_ecs_service" "nginx_service" {
  name            = "nginx-service"
  cluster         = var.ecs_cluster_id
  task_definition = aws_ecs_task_definition.nginx_task.arn
  desired_count   = 1  # Here I configured service to run once
  launch_type     = "FARGATE"

  load_balancer {
    target_group_arn = var.alb_target_group_arn
    container_name   = "nginx-container"
    container_port   = 80
  }

  network_configuration {
    subnets          = var.subnet_ids
    security_groups = [var.security_group_id]
    assign_public_ip = true
  }
}
