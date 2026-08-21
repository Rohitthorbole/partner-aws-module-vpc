# partner-aws-module-vpc
This is the repository for the AWS VPC Module using terraform.

## Use the module

Create a separate root directory for the environment that consumes this module:

```hcl
terraform {
	required_providers {
		aws = {
			source  = "hashicorp/aws"
			version = "~> 5.0"
		}
	}
}

provider "aws" {
	region = "us-east-1"
}

module "vpc" {
	source = "../partner-aws-module-vpc/module"

	vpc_cidr        = "10.0.0.0/16"
	subnet_name     = "dev-public-subnet"
	subnet_cidr     = "10.0.1.0/24"
	route_table_name = "dev-public-route-table"

	create_route = {
		cidr = "0.0.0.0/0"
	}
}

output "vpc_id" {
	value = module.vpc.vpc_id
}
```

From the consuming directory, run:

```text
terraform init
terraform plan
terraform apply
```
