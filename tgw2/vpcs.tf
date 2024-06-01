resource "aws_vpc" "vpc_a" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "VPC-A"
  }
}

resource "aws_vpc" "vpc_b" {
  cidr_block = "10.1.0.0/16"
  tags = {
    Name = "VPC-B"
  }
}

resource "aws_vpc" "vpc_c" {
  cidr_block = "10.2.0.0/16"
  tags = {
    Name = "VPC-C"
  }
}

resource "aws_subnet" "vpc_a_public" {
  vpc_id            = aws_vpc.vpc_a.id
  availability_zone = "ap-south-1a"
  cidr_block        = "10.0.1.0/24"
  map_public_ip_on_launch = true
  tags = {
    Name = "VPC-A-public"
  }
  
}
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc_a.id

  tags = {
    Name = "vpcA-igw"
  }
}

resource "aws_subnet" "vpc_a_private" {
  vpc_id     = aws_vpc.vpc_a.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "ap-south-1b"
  tags = {
    Name = "VPC-A-private"
  }
}

resource "aws_subnet" "vpc_b_private" {
  vpc_id     = aws_vpc.vpc_b.id
  cidr_block = "10.1.1.0/24"
  availability_zone = "ap-south-1a"
  tags = {
    Name = "VPC-B-private"
  }
}

resource "aws_subnet" "vpc_c_private" {
  vpc_id     = aws_vpc.vpc_c.id
  cidr_block = "10.2.1.0/24"
  availability_zone = "ap-south-1b"
  tags = {
    Name = "VPC-C-private"
  }
}
