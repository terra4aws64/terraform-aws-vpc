resource "aws_vpc" "target" {
  cidr_block           = var.vpc_global_cidr
  instance_tenancy     = "default"
  enable_dns_support   = true
  enable_dns_hostnames = true
  enable_classiclink   = false

  tags = {
    name = var.vpc_name
  }

}

resource "aws_subnet" "dmz_a" {
  enable_dns64                                   = false
  enable_resource_name_dns_aaaa_record_on_launch = false
  enable_resource_name_dns_a_record_on_launch    = false
  ipv6_native                                    = false
  map_public_ip_on_launch                        = false
  cidr_block                                     = var.vpc_subnet_dmz_a
  vpc_id                                         = aws_vpc.target.id
  availability_zone                              = data.aws_availability_zones.target.names[0]
}

resource "aws_subnet" "dmz_b" {
  enable_dns64                                   = false
  enable_resource_name_dns_aaaa_record_on_launch = false
  enable_resource_name_dns_a_record_on_launch    = false
  ipv6_native                                    = false
  map_public_ip_on_launch                        = false
  cidr_block                                     = var.vpc_subnet_dmz_b
  vpc_id                                         = aws_vpc.target.id
  availability_zone                              = data.aws_availability_zones.target.names[1]
}

resource "aws_subnet" "app_a" {
  enable_dns64                                   = false
  enable_resource_name_dns_aaaa_record_on_launch = false
  enable_resource_name_dns_a_record_on_launch    = false
  ipv6_native                                    = false
  map_public_ip_on_launch                        = false
  cidr_block                                     = var.vpc_subnet_app_a
  vpc_id                                         = aws_vpc.target.id
  availability_zone                              = data.aws_availability_zones.target.names[0]
}

resource "aws_subnet" "app_b" {
  enable_dns64                                   = false
  enable_resource_name_dns_aaaa_record_on_launch = false
  enable_resource_name_dns_a_record_on_launch    = false
  ipv6_native                                    = false
  map_public_ip_on_launch                        = false
  cidr_block                                     = var.vpc_subnet_app_b
  vpc_id                                         = aws_vpc.target.id
  availability_zone                              = data.aws_availability_zones.target.names[1]
}

resource "aws_subnet" "db_a" {
  enable_dns64                                   = false
  enable_resource_name_dns_aaaa_record_on_launch = false
  enable_resource_name_dns_a_record_on_launch    = false
  ipv6_native                                    = false
  map_public_ip_on_launch                        = false
  cidr_block                                     = var.vpc_subnet_db_a
  vpc_id                                         = aws_vpc.target.id
  availability_zone                              = data.aws_availability_zones.target.names[0]
}

resource "aws_subnet" "db_b" {
  enable_dns64                                   = false
  enable_resource_name_dns_aaaa_record_on_launch = false
  enable_resource_name_dns_a_record_on_launch    = false
  ipv6_native                                    = false
  map_public_ip_on_launch                        = false
  cidr_block                                     = var.vpc_subnet_db_b
  vpc_id                                         = aws_vpc.target.id
  availability_zone                              = data.aws_availability_zones.target.names[1]
}

resource "aws_internet_gateway" "target" {
  vpc_id = aws_vpc.target.id
}

resource "aws_route_table" "target" {
  vpc_id = aws_vpc.target.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.target.id
  }

}

resource "aws_route_table_association" "dmz_a" {
  subnet_id      = aws_subnet.dmz_a.id
  route_table_id = aws_route_table.target.id
}

resource "aws_route_table_association" "dmz_b" {
  subnet_id      = aws_subnet.dmz_b.id
  route_table_id = aws_route_table.target.id
}

module "bastion" {
  count         = var.bastion_enabled ? 1 : 0
  source        = "terra4aws64/bastion/aws"
  vpc_subnet_id = aws_subnet.dmz_a.id
  vpc_id        = aws_vpc.target.id
  ec2_key       = var.ec2_key
}
