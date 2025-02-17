resource "aws_lb" "trainee_alb" {
  name               = "tm-devops-trainee-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb_sg.id]
  subnets            = ["subnet-09aa4e507bb466699", "subnet-0599210258b261945"]
}

resource "aws_lb_target_group" "trainee_target_group" {
  name     = "tm-devops-trainee-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  target_type = "ip"

  health_check {
    interval            = 15
    path                = "/"
    port                = 80
    protocol            = "HTTP"
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 3
  }
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

resource "aws_security_group" "alb_sg" {
  name        = "alb_sg"
  description = "Allow incoming traffic to the ALB"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "alb_sg"
  }
}
