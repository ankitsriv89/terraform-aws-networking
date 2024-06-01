resource "aws_instance" "app" {
     ami           = data.aws_ami.amzLinux2.id
     instance_type = "t2.micro"
     subnet_id     = aws_subnet.public.id
     user_data = file("appinstall.sh")
     vpc_security_group_ids = [ aws_security_group.web_sg.id]
     associate_public_ip_address = true

     key_name = var.instance_keypair
  tags = {
    Name = "web-server"
  }
}

# EC2 Instance in Private Subnet
resource "aws_instance" "db" {
  ami           = data.aws_ami.amzLinux2.id  # Change to the desired AMI
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.private.id
  security_groups = [aws_security_group.web_sg.id]

  tags = {
    Name = "db-instance"
  }
}