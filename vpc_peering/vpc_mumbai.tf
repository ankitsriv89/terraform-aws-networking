# vpc_mumbai.tf
resource "aws_vpc" "vpc_a" {
  provider = aws.mumbai
  cidr_block = "10.10.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support = true
}

resource "aws_internet_gateway" "igw" {
  provider = aws.mumbai
  vpc_id = aws_vpc.vpc_a.id
}

resource "aws_subnet" "public_subnet_a" {
  provider = aws.mumbai
  availability_zone = "ap-south-1a"
  vpc_id = aws_vpc.vpc_a.id
  cidr_block = "10.10.0.0/24"
  map_public_ip_on_launch = true
}

resource "aws_route_table" "publicrt_a" {
  vpc_id = aws_vpc.vpc_a.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

}

# Public Route Table Association
resource "aws_route_table_association" "publicrta" {
  subnet_id      = aws_subnet.public_subnet_a.id
  route_table_id = aws_route_table.publicrt_a.id
}

resource "aws_security_group" "sg_vpc_a" {
  provider = aws.mumbai
  vpc_id = aws_vpc.vpc_a.id
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["171.76.199.222/32"]  # replace with your actual IP
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "ec2_vpc_a" {
  provider = aws.mumbai
  ami = data.aws_ami.amzLinux2.id  # replace with the AMI ID you want to use
  instance_type = "t2.micro"
  subnet_id = aws_subnet.public_subnet_a.id
  security_groups = [aws_security_group.sg_vpc_a.id]
  associate_public_ip_address = true
  key_name = "tfkey"  # replace with your key name
}
