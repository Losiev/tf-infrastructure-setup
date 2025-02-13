provider "aws" {
  region = "eu-central-1"
}

module "efs" {
  source            = "./modules/efs"
  security_group_id = aws_security_group.ecs_sg.id
  subnet_id         = var.subnet_id
}

module "ecs" {
  source            = "./modules/ecs"
  vpc_id            = var.vpc_id
  subnet_ids        = var.subnet_ids
  security_group_id = aws_security_group.ecs_sg.id
  ecs_cluster_id    = aws_ecs_cluster.main.id
  efs_id            = module.efs.efs_id
}

module "alb" {
  source         = "./modules/alb"
  vpc_id         = var.vpc_id
  subnets        = var.subnet_ids
}
