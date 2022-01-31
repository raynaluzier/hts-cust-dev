## Environment Info ##
variable "region" {
    description = "Target region to which the VM will be deployed"
    type        = string
    default     = "us-east-1"
}

variable "vpc_name" {
    description = "Target VPC to which the VM will be deployed"
    type        = string
    default     = "us-east-1"
}

variable "subnet_name" {
    description = "Target subnet to which the VM will be deployed"
    type        = string
    default     = "us-east-1"
}

## Virtual Machine Info ##
variable "instance_type" {
    description = "Size of AWS instance being deployed"
    type        = string
    default     = "m5.large"
}

## Tag Variable Info ##
variable "tag_name" {
    description = "Name of virtual machine; populates Name tag"
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