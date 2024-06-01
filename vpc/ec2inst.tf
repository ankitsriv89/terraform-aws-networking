resource "aws_instance" "ec2instance" {
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