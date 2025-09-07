terraform {
  required_version = ">= 1.6.0"
}

provider "aws" {
  region = "us-east-2"
}

module "vpc" {
  source = "../../modules/vpc"
}

module "eks" {
  source = "../../modules/eks"

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.subnet_ids
}

module "rds" {
  source = "../../modules/rds"

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.subnet_ids
}

module "kafka" {
  source = "../../modules/kafka"

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.subnet_ids
}

module "s3" {
  source = "../../modules/s3"
}

module "redshift" {
  source = "../../modules/redshift"

  subnet_ids = module.vpc.subnet_ids
}
