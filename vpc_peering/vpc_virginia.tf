# vpc_virginia.tf
resource "aws_vpc" "vpc_b" {
  provider = aws.virginia
  cidr_block = "10.20.0.0/16"
}

resource "aws_subnet" "private_subnet_b" {
  provider = aws.virginia
  vpc_id = aws_vpc.vpc_b.id
  cidr_block = "10.20.0.0/24"
  map_public_ip_on_launch = false
}

resource "aws_route_table" "privatert_b" {
  vpc_id = aws_vpc.vpc_b.id 


  tags = {
    Name = "private-rt-vpc-b"
  }
}

# Private Route Table Association
resource "aws_route_table_association" "privatertb" {
  subnet_id      = aws_subnet.private_subnet_b.id
  route_table_id = aws_route_table.privatert_b.id 
}

resource "aws_security_group" "sg_vpc_b" {
  provider = aws.virginia
  vpc_id = aws_vpc.vpc_b.id
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["10.10.0.0/16"]
  }
  ingress {
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = ["10.10.0.0/16"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "ec2_vpc_b" {
  provider = aws.virginia
  ami = "ami-0d94353f7bad10668"
  # replace with the AMI ID you want to use
  instance_type = "t2.micro"
  subnet_id = aws_subnet.private_subnet_b.id
  security_groups = [aws_security_group.sg_vpc_b.id]
  key_name = "tfkey2"  # replace with your key name
}
