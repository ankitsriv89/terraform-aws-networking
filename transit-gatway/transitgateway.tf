resource "aws_ec2_transit_gateway" "tgw" {
  description = "My TGW"
  amazon_side_asn = 64512
}
