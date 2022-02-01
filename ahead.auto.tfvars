## Environment Info ##
region           = "us-east-1"
vpc_name         = "vpc_useast1"  # HNP-NonProduction-VPC-US-East, HNP-Production-VPC-US-East
subnet_name      = "sub_16"
sec_grp_name     = "hts-test-sg"

## Virtual Machine Info ##
instance_type    = "t2.micro"
root_vol_size    = 60
ssh_key_name     = "rel-hts-013122"

tag_name         = "hts-test-1"
tag_costcenter   = "1234567890"
tag_businessunit = "Delivery"
tag_product      = "This is development work"
tag_application  = "VM"
tag_environment  = "Prod"
tag_supportteam  = "hts.sre@hearst.com"