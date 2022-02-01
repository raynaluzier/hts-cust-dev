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

## Get the target VPC to place the instance
data "aws_vpc" "target" {
  filter {
      name   = "tag:Name"
      values = [var.vpc_name]
  }
}

## Get the target subnet to place the instance
data "aws_subnet" "target" {
    filter {
        name   = "tag:Name"
        values = [var.subnet_name]
    }
}

## Get the target key pair to use on the instance
data "aws_key_pair" "target" {
    filter {
        name   = "key-name"
        values = [var.ssh_key_name]
    }
}

## Get the target security group to add the instance
data "aws_security_group" "target" {
    filter {
        name   = "group-name"
        values = [var.sec_grp_name]
    }
}

## Get the AMI for the Ubuntu image
data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  owners = ["099720109477"] # Canonical
}

## Gets randomly selected letter between a-f 
#  This value will be appended to region below to select availability zone
resource "random_shuffle" "zone" {
    input        = ["a", "b", "c", "d", "e", "f"]
    result_count = 1
}

## Define the EC2 Instance resource
resource "aws_instance" "vm" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  subnet_id     = data.aws_subnet.target.id
  
  vpc_security_group_ids               = [data.aws_security_group.target.id]
  associate_public_ip_address          = data.aws_subnet.target.map_public_ip_on_launch
  disable_api_termination              = true
  instance_initiated_shutdown_behavior = "stop"
  
  key_name          = data.aws_key_pair.target.key_name
  availability_zone = "${var.region}join(',', ${random_shuffle.zone.result})"

  root_block_device {
      delete_on_termination = true
      encrypted             = false
      volume_size           = var.root_vol_size
      volume_type           = "gp3"
  }
  
  tags = local.tags
}