terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }

  backend "remote" {
    hostname = "app.terraform.io"
    organization = "raynaluzier"  ## Update for customer

    workspaces {
      name = "hts-cust-dev"       ## make more dynamic
    }
  }

}

# Configure the AWS Provider
provider "aws" {
  region = var.region
}

module "ec2-linux" {
  source  = "app.terraform.io/RaynaLuzier/ec2-linux/aws"
  version = "0.0.5"

  region           = var.region
  vpc_id           = var.vpc_id
  sec_group_id     = var.sec_group_id
  subnet_id        = var.subnet_id
  instance_type    = var.instance_type
  root_vol_size    = var.root_vol_size
  ssh_key_name     = var.ssh_key_name

  tag_name         = var.tag_name
  tag_costcenter   = var.tag_costcenter
  tag_businessunit = var.tag_businessunit
  tag_product      = var.tag_product
  tag_application  = var.tag_application
  tag_environment  = var.tag_environment
  tag_supportteam  = var.tag_supportteam
  custom_tags      = var.custom_tags
}

/* module "ec2-linux" {
  source  = "app.terraform.io/RaynaLuzier/ec2-linux/aws"
  version = "0.0.5"

  region           = var.region
  vpc_id           = var.vpc_id
  sec_group_id     = var.sec_group_id
  subnet_id        = var.subnet_id
  instance_type    = var.instance_type
  root_vol_size    = var.root_vol_size
  ssh_key_name     = var.ssh_key_name

  tag_name         = "${var.tag_name}-2"
  tag_costcenter   = var.tag_costcenter
  tag_businessunit = var.tag_businessunit
  tag_product      = var.tag_product
  tag_application  = var.tag_application
  tag_environment  = var.tag_environment
  tag_supportteam  = var.tag_supportteam
  custom_tags      = var.custom_tags
} */