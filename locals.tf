locals {
  common_tags = {
    Owner       = "Rohit Thorbole"
    Email       = "rohitthorbole4@gmail.com"
    Environment = "${var.env}-${var.region}"
  }

  resource_tags = {
    vpc = merge(local.common_tags, {
      Name = var.vpc_name
    })

    subnet = merge(local.common_tags, {
      Name = var.subnet_name
    })

    internet_gateway = merge(local.common_tags, {
      Name = "${var.vpc_name}-igw"
    })

    route_table = merge(local.common_tags, {
      Name = var.route_table_name
    })
  }
}