//VPC Config
resource "aws_vpc" "my_vpc" {
  cidr_block = var.vpc_cidr
  tags       = local.resource_tags.vpc
}

//Subnet Config
resource "aws_subnet" "my_subnet" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = var.subnet_cidr
  tags       = local.resource_tags.subnet
}

//Internet Gateway Config
resource "aws_internet_gateway" "my_igw" {
  vpc_id     = aws_vpc.my_vpc.id
  depends_on = [aws_vpc.my_vpc]
  tags       = local.resource_tags.internet_gateway
}

//Route Table config
resource "aws_route_table" "my_route_table" {
  vpc_id = aws_vpc.my_vpc.id
  depends_on = [aws_internet_gateway.my_igw]
  tags       = local.resource_tags.route_table
}

//Route config
resource "aws_route" "my_route" {
  route_table_id         = aws_route_table.my_route_table.id
  destination_cidr_block = var.create_route.cidr
  gateway_id             = aws_internet_gateway.my_igw.id
  depends_on             = [aws_route_table.my_route_table]
}

//Route-Subnet association config
resource "aws_route_table_association" "my_route_table_association" {
  subnet_id      = aws_subnet.my_subnet.id
  route_table_id = aws_route_table.my_route_table.id
  depends_on = [aws_route.my_route]
}