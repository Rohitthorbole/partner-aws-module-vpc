//Common variables for the VPC module
variable "region" {
    type = string
    default = "us-ease-1"
    description = "The AWS region where the VPC will be created."
}

//variables for the VPC

variable "vpc_name" {
    type = string
    default = "my-vpc"
    description = "The name of the VPC."
}

variable "vpc_cidr" {
  type = string
  description = "The cidr of the vpc. Must be provided"
}

//variables for the subnets
variable "subnet_name" {
    type = string
    description = "The name of the subnet."
}

variable "subnet_cidr" {
    type = string
    description = "The cidr of the subnet. Must be provided"
}

//variables for route tables

variable "route_table_name" {
    type = string
    description = "The name of the route table."
}

variable "create_route" {
  type = object({
    cidr = string
    gateway_id = string
  })
}