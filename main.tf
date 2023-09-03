terraform {
  required_version = "~> 1.5.6"
  backend "s3" {
    bucket = "olinkbackendbucket"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}


provider "aws" {
  version = "~> 5.10"
  region  = "us-east-1"
}

module "vpc_and_subnets" {
  source = "./modules/vpc_and_subnets"
}

module "ec2" {
  source     = "./modules/ec2"
  subnet_ids = module.vpc_and_subnets.subnet_ids
  depends_on = [module.vpc_and_subnets]
}

