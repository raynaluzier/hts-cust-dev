## Environment Info ##
variable "access_key" {
  description = "Access key for AWS account that will be performing the deployment"
  type        = string
  default     = "" 
}

variable "secret_key" {
  description = "Secret key for AWS account that will be performing the deployment"
  type        = string
  default     = ""
  sensitive   = true
}

variable "region" {
  description = "Target region to which the VM will be deployed"
  type        = string
  default     = "us-east-1"
}

/*
variable "vpc_name" {
  description = "Target VPC to which the VM will be deployed"
  type        = string
  default     = "us-east-1"
}

variable "sec_grp_name" {
  description = "Target security group to which the VM will be joined"
  type        = string
  default     = "hts-test-sg"
}
*/

variable "vpc_id" {
  description = "Target VPC to which the VM will be deployed"
  type        = string
  default     = ""
}

variable "sec_group_id" {
  description = "Target security group to which the VM will be joined"
  type        = string
  default     = ""
}

variable "subnet_id" {
  description = "Target subnet to which the VM will be joined"
  type        = string
  default     = ""
}

## Virtual Machine Info ##
variable "instance_type" {
  description = "Size of AWS instance being deployed"
  type        = string
  default     = "m5.large"
}

variable "root_vol_size" {
  description = "Size (GB) of root volume for the AWS instance being deployed"
  type        = number
  default     = 50
}

variable "ssh_key_name" {
  description = "SSH key name to apply to the VM; unique to each account"
  type        = string
  default     = ""
}

## Tag Variable Info ##
variable "tag_name" {
  description = "Name of VM; populates Name tag"
  type        = string
  default     = ""
}

variable "tag_costcenter" {
  description = "Owning cost center of VM; populates CostCenter tag"
  type        = string
  default     = ""
}

variable "tag_businessunit" {
  description = "Owning business unit of VM; populates BusinessUnit tag"
  type        = string
  default     = ""
}

variable "tag_product" {
  description = "Purpose of the resource being deployed; populates Product tag"
  type        = string
  default     = ""
}

variable "tag_application" {
  description = "Type of resource being deployed; populates Application tag"
  type        = string
  default     = "VM"
}

variable "tag_environment" {
  description = "Environment the VM belongs to OR indication of backup; populates Environment tag"
  type        = string
  default     = "Prod"
}

variable "tag_supportteam" {
  description = "Team that supports the VM resource (not app); populates SupportTeam tag"
  type        = string
  default     = "hts.sre@hearst.com"
}

variable "custom_tags" {
  description   = "Additional map of custom tags to add to the machine; if required"
  type          = map(string)
  default       = {}
}