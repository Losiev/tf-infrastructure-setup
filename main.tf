provider "aws" {
  region = "eu-central-1"
}

module "efs" {
  source            = "./modules/efs"
  security_group_id = module.ecs.ecs_sg_id
  subnet_id         = var.subnet_id
}

module "ecs" {
  source            = "./modules/ecs"
  vpc_id            = var.vpc_id
  subnet_ids        = var.subnet_ids
  security_group_id = module.ecs.ecs_sg_id
  ecs_cluster_id    = module.ecs.ecs_cluster_id
  efs_id            = module.efs.efs_id
  alb_sg_id         = module.alb.alb_sg_id
  alb_target_group_arn = module.alb.target_group_arn
}

module "alb" {
  source         = "./modules/alb"
  vpc_id         = var.vpc_id
  subnets        = var.subnet_ids
  ecs_service_name = module.ecs.ecs_service_id
}
