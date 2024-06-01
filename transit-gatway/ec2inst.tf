


# EC2 Instance in Public Subnet of VPC A
resource "aws_instance" "ec2_public_vpc_a" {
  ami           = data.aws_ami.amzLinux2.id  # Replace with your desired AMI ID
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.vpc_a_public.id
  security_groups = [aws_security_group.sg_public_vpc_a.id]
  key_name = "tfkey"  # Replace with your key pair name

  tags = {
    Name = "EC2_Public_VPC_A"
  }
}

# EC2 Instances in Private Subnets
resource "aws_instance" "ec2_private_vpc_a" {
  ami           = data.aws_ami.amzLinux2.id  # Replace with your desired AMI ID
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.vpc_a_private.id
  security_groups = [aws_security_group.sg_private_a.id]
  key_name = "tfkey"  # Replace with your key pair name

  tags = {
    Name = "EC2_Private_VPC_A"
  }
}

resource "aws_instance" "ec2_private_vpc_b" {
  ami           = data.aws_ami.amzLinux2.id  # Replace with your desired AMI ID
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.vpc_b_private.id
  security_groups = [aws_security_group.sg_private_b.id]
  key_name = "tfkey"  # Replace with your key pair name

  tags = {
    Name = "EC2_Private_VPC_B"
  }
}

resource "aws_instance" "ec2_private_vpc_c" {
  ami           = data.aws_ami.amzLinux2.id  # Replace with your desired AMI ID
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.vpc_c_private.id
  security_groups = [aws_security_group.sg_private_c.id]
  key_name = "tfkey"  # Replace with your key pair name

  tags = {
    Name = "EC2_Private_VPC_C"
  }
}

