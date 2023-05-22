resource "aws_vpc" "cloud_vpc" {
  cidr_block = var.vpc_cidr_block

  tags = {
    Name = "${var.project_name}PublicVPC"
  }
}

resource "aws_internet_gateway" "cloud_internet_gw" {
  vpc_id = aws_vpc.cloud_vpc.id

  tags = {
    Name = "${var.project_name}PublicGateway"
  }
}

resource "aws_subnet" "cloud_subnet" {
  vpc_id                  = aws_vpc.cloud_vpc.id
  cidr_block              = var.subnet_cidr_block
  availability_zone       = var.availability_zone
  map_public_ip_on_launch = var.map_public_ip_on_launch

  tags = {
    Name = "${var.project_name}PublicSubnet"
  }
}

resource "aws_route_table" "cloud_route_table" {
  vpc_id = aws_vpc.cloud_vpc.id

  tags = {
    Name = "${var.project_name}PublicRouteTable"
  }
}

resource "aws_route_table_association" "cloud_rt_association" {
  subnet_id      = aws_subnet.cloud_subnet.id
  route_table_id = aws_route_table.cloud_route_table.id
}

resource "aws_route" "cloud_public_route" {
  route_table_id         = aws_route_table.cloud_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.cloud_internet_gw.id
}
