resource "aws_ecs_task_definition" "nginx_task" {
  family                   = "nginx-task"
  requires_compatibilities  = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = "256"
  memory                   = "512"

  container_definitions = jsonencode([{
    name      = "nginx-container"
    image     = "nginx:latest"  # Nginx public Image
    essential = true

    mountPoints = [{
      sourceVolume  = "efs-volume"
      containerPath = "/usr/share/nginx/html"
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

  network_configuration {
    subnets          = var.subnet_ids
    security_groups = [var.security_group_id]
    assign_public_ip = true
  }
}
