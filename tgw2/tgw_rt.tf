# Create Transit Gateway Route Tables
resource "aws_ec2_transit_gateway_route_table" "rt_a" {
  transit_gateway_id = aws_ec2_transit_gateway.tgw.id
}

resource "aws_ec2_transit_gateway_route_table" "rt_b" {
  transit_gateway_id = aws_ec2_transit_gateway.tgw.id
}

resource "aws_ec2_transit_gateway_route_table" "rt_c" {
  transit_gateway_id = aws_ec2_transit_gateway.tgw.id
}

# Associate Route Tables with Attachments
resource "aws_ec2_transit_gateway_route_table_association" "assoc_a" {
  transit_gateway_attachment_id = aws_ec2_transit_gateway_vpc_attachment.att_a.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.rt_a.id
}

resource "aws_ec2_transit_gateway_route_table_association" "assoc_b" {
  transit_gateway_attachment_id = aws_ec2_transit_gateway_vpc_attachment.att_b.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.rt_b.id
}

resource "aws_ec2_transit_gateway_route_table_association" "assoc_c" {
  transit_gateway_attachment_id = aws_ec2_transit_gateway_vpc_attachment.att_c.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.rt_c.id
}

# Route Propagations
resource "aws_ec2_transit_gateway_route_table_propagation" "prop_a_b" {
  transit_gateway_attachment_id = aws_ec2_transit_gateway_vpc_attachment.att_b.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.rt_a.id
}

resource "aws_ec2_transit_gateway_route_table_propagation" "prop_b_a" {
  transit_gateway_attachment_id = aws_ec2_transit_gateway_vpc_attachment.att_a.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.rt_b.id
}

resource "aws_ec2_transit_gateway_route_table_propagation" "prop_b_c" {
  transit_gateway_attachment_id = aws_ec2_transit_gateway_vpc_attachment.att_c.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.rt_b.id
}

resource "aws_ec2_transit_gateway_route_table_propagation" "prop_c_b" {
  transit_gateway_attachment_id = aws_ec2_transit_gateway_vpc_attachment.att_b.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.rt_c.id
}