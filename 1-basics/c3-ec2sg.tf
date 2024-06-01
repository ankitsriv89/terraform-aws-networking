resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow ssh inbound traffic and all outbound traffic"
  
  ingress  {
  cidr_blocks =      ["0.0.0.0/0"]
  from_port         = 22
  protocol       = "tcp"
  to_port           = 22
}
    egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_ssh"
  }
}

resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic and all outbound traffic"
  #vpc_id      = aws_vpc.main.id

ingress  {
    description = "allow port 80"
  cidr_blocks =      ["0.0.0.0/0"]
  from_port         = 80
  protocol       = "tcp"
  to_port           = 80
}

ingress  {
    description = "allow port 443"
  cidr_blocks =      ["0.0.0.0/0"]
  from_port         = 443
  protocol       = "tcp"
  to_port           = 443
}
    egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_tls"
  }
}

