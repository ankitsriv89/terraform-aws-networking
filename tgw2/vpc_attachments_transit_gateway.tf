resource "aws_ec2_transit_gateway_vpc_attachment" "att_a" {
  subnet_ids         = [aws_subnet.vpc_a_private.id]
  transit_gateway_id = aws_ec2_transit_gateway.tgw.id
  vpc_id             = aws_vpc.vpc_a.id
}

resource "aws_ec2_transit_gateway_vpc_attachment" "att_b" {
  subnet_ids         = [aws_subnet.vpc_b_private.id]
  transit_gateway_id = aws_ec2_transit_gateway.tgw.id
  vpc_id             = aws_vpc.vpc_b.id
}

resource "aws_ec2_transit_gateway_vpc_attachment" "att_c" {
  subnet_ids         = [aws_subnet.vpc_c_private.id]
  transit_gateway_id = aws_ec2_transit_gateway.tgw.id
  vpc_id             = aws_vpc.vpc_c.id
}
