resource "aws_route_table" "vpc_a_public_rt" {
  vpc_id = aws_vpc.vpc_a.id
route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
tags = {
    Name = "vpc_a_public_rt"
  }
}

resource "aws_route_table" "vpc_a_private_rt" {
  vpc_id = aws_vpc.vpc_a.id
  tags = {
    Name = "vpc_a_private_rt"
  }
}

resource "aws_route_table" "vpc_b_private_rt" {
  vpc_id = aws_vpc.vpc_b.id

  tags = {
    Name = "vpc_b_private_rt"
  }
}

resource "aws_route_table" "vpc_c_private_rt" {
  vpc_id = aws_vpc.vpc_c.id

  tags = {
    Name = "vpc_c_private_rt"
  }
}

resource "aws_route_table_association" "vpc_a_public_rta" {
  subnet_id      = aws_subnet.vpc_a_public.id
  route_table_id = aws_route_table.vpc_a_public_rt.id
}

resource "aws_route_table_association" "vpc_a_private_rta" {
  subnet_id      = aws_subnet.vpc_a_private.id
  route_table_id = aws_route_table.vpc_a_private_rt.id
}

resource "aws_route_table_association" "vpc_b_private_rta" {
  subnet_id      = aws_subnet.vpc_b_private.id
  route_table_id = aws_route_table.vpc_b_private_rt.id
}

resource "aws_route_table_association" "vpc_c_private_rta" {
  subnet_id      = aws_subnet.vpc_c_private.id
  route_table_id = aws_route_table.vpc_c_private_rt.id
}

