variable "region" {
    type = string
    default = "us-ease-1"
    description = "The AWS region where the VPC will be created."
}

variable "vpc_name" {
    type = string
    default = "my-vpc"
    description = "The name of the VPC."
}