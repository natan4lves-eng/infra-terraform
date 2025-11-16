provider "aws" {
  region = "us-east-1"
}

module "vpc" {
  source = "./vpc"
}

module "subnets" {
  source = "./subnets"
  vpc_id = module.vpc.vpc_id
}

module "igw" {
  source = "./internet-gateway"
  vpc_id = module.vpc.vpc_id
}

module "rt" {
  source     = "./route-tables"
  vpc_id     = module.vpc.vpc_id
  subnet_id  = module.subnets.public_subnet_id
  igw_id     = module.igw.igw_id
}

module "sg" {
  source = "./security-groups"
  vpc_id = module.vpc.vpc_id
}

module "ec2" {
  source      = "./ec2"
  subnet_id   = module.subnets.public_subnet_id
  sg_id       = module.sg.web_sg_id
}

module "lb" {
  source = "./load-balancer"
  subnet_ids = [module.subnets.public_subnet_id]
  sg_id      = module.sg.web_sg_id
}

module "asg" {
  source = "./auto-scaling"
  subnet_ids = [module.subnets.public_subnet_id]
  sg_id      = module.sg.web_sg_id
}
