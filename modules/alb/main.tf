resource "aws_lb" "trainee_alb" {
  name               = "tm-devops-trainee-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb_sg.id]
  subnets            = var.subnets
}

resource "aws_lb_listener" "trainee_alb_listener" {
  load_balancer_arn = aws_lb.trainee_alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.trainee_target_group.arn
  }
}

resource "aws_lb_target_group" "trainee_target_group" {
  name     = "tm-devops-trainee-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    interval            = 30
    path                = "/"
    port                = 80
    protocol            = "HTTP"
    timeout             = 5
    healthy_threshold   = 3
    unhealthy_threshold = 3
  }
}

resource "aws_lb_target_group_attachment" "ecs_target_group_attachment" {
  target_group_arn = aws_lb_target_group.trainee_target_group.arn
  target_id        = aws_ecs_service.trainee_ecs_service.id
  port             = 80
}

resource "aws_security_group" "alb_sg" {
  name        = "alb_sg"
  description = "Allow incoming traffic to the ALB"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "alb_sg"
  }
}