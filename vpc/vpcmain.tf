# VPC
resource "aws_vpc" "main" {
  cidr_block = "10.4.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support = true

  tags = {
    Name = "main-vpc"
  }
}

# Internet Gateway
resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "main-igw"
  }
}

# Public Subnet
resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.4.1.0/24"
  map_public_ip_on_launch = true

  tags = {
    Name = "public-subnet"
  }
}

# Private Subnet
resource "aws_subnet" "private" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.4.8.0/24"

  tags = {
    Name = "private-subnet"
  }
}

# Public Route Table
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }

  tags = {
    Name = "public-rt"
  }
}

# Public Route Table Association
resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}



# Private Route Table
resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id


  tags = {
    Name = "private-rt"
  }
}

# Private Route Table Association
resource "aws_route_table_association" "private" {
  subnet_id      = aws_subnet.private.id
  route_table_id = aws_route_table.private.id
}

# DHCP Options Set
resource "aws_vpc_dhcp_options" "corp_dhcp_options" {
  domain_name         = "corp.ankit"
  domain_name_servers = ["AmazonProvidedDNS"]

  tags = {
    Name = "corp-dhcp-options"
  }
}

# Associate DHCP Options Set with VPC
resource "aws_vpc_dhcp_options_association" "main" {
  vpc_id          = aws_vpc.main.id
  dhcp_options_id = aws_vpc_dhcp_options.corp_dhcp_options.id
}

