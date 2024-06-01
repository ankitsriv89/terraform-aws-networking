resource "aws_ec2_transit_gateway_vpc_attachment" "vpc_a_attachment" {
  subnet_ids         = [aws_subnet.vpc_a_private.id]
  transit_gateway_id = aws_ec2_transit_gateway.tgw.id
  vpc_id             = aws_vpc.vpc_a.id
}

resource "aws_ec2_transit_gateway_vpc_attachment" "vpc_b_attachment" {
  subnet_ids         = [aws_subnet.vpc_b_private.id]
  transit_gateway_id = aws_ec2_transit_gateway.tgw.id
  vpc_id             = aws_vpc.vpc_b.id
}

resource "aws_ec2_transit_gateway_vpc_attachment" "vpc_c_attachment" {
  subnet_ids         = [aws_subnet.vpc_c_private.id]
  transit_gateway_id = aws_ec2_transit_gateway.tgw.id
  vpc_id             = aws_vpc.vpc_c.id
}
