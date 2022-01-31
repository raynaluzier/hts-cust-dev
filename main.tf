terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = var.region
}

locals {
    # Define the map of mandatory tags
    tags = {
        Name         = var.tag_name
        CostCenter   = var.tag_costcenter
        BusinessUnit = var.tag_businessunit
        Product      = var.tag_product
        Application  = var.tag_application
        Environment  = var.tag_environment
        SupportTeam  = var.tag_supportteam
    }
}

## Lookup the target VPC to place the instance
data "aws_vpc" "target" {
  filter {
      name   = "tag:Name"
      values = [var.vpc_name]
  }
}

## Lookup the target subnet to place the instance
data "aws_subnet" "target" {
    filter {
        name   = "tag:Name"
        values = [var.subnet_name]
    }
}

## Lookup the AMI for the Ubuntu image
data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  owners = ["099720109477"] # Canonical
}

## Define the EC2 Instance resource
resource "aws_instance" "vm" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  subnet_id     = data.aws_subnet.target.id

  tags = local.tags
}