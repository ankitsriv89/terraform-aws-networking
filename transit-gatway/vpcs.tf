resource "aws_vpc" "vpc_a" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_vpc" "vpc_b" {
  cidr_block = "10.1.0.0/16"
}

resource "aws_vpc" "vpc_c" {
  cidr_block = "10.2.0.0/16"
}

resource "aws_subnet" "vpc_a_public" {
  vpc_id            = aws_vpc.vpc_a.id
  availability_zone = "ap-south-1a"
  cidr_block        = "10.0.1.0/24"
  map_public_ip_on_launch = true
  
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
}

resource "aws_subnet" "vpc_b_private" {
  vpc_id     = aws_vpc.vpc_b.id
  cidr_block = "10.1.1.0/24"
  availability_zone = "ap-south-1a"
}

resource "aws_subnet" "vpc_c_private" {
  vpc_id     = aws_vpc.vpc_c.id
  cidr_block = "10.2.1.0/24"
  availability_zone = "ap-south-1b"
}
