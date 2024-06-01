resource "aws_instance" "ec2-instance" {
     ami           = data.aws_ami.amzLinux2.id
     instance_type = "t2.micro"
     user_data = file("${path.module}/appinstall.sh")
     vpc_security_group_ids = [ aws_security_group.allow_ssh.id,aws_security_group.allow_tls.id]
     key_name = var.instance_keypair
  tags = {
    Name = "mini finance app"
  }
}