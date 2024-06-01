resource "aws_instance" "ec2_public" {
  ami           = data.aws_ami.amzLinux2.id  # Replace with your desired AMI ID
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.public.id
  security_groups = [aws_security_group.sg_public.id]
  key_name = "tfkey"  # Replace with your key pair name

  tags = {
    Name = "EC2_Public"
  }
}

# EC2 Instances in Private Subnets
resource "aws_instance" "ec2_private" {
  ami           = data.aws_ami.amzLinux2.id  # Replace with your desired AMI ID
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.private.id
  security_groups = [aws_security_group.sg_private.id]
  iam_instance_profile = aws_iam_instance_profile.ec2_s3_access_profile.name

  key_name = "tfkey"  # Replace with your key pair name

  tags = {
    Name = "EC2_Private"
  }

  # Optionally add user_data to install the AWS CLI and configure it
  user_data = <<-EOF
              #!/bin/bash
              sudo yum update -y
              sudo yum install -y aws-cli
              EOF
}
