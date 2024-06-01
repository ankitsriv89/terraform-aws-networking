resource "aws_vpc_endpoint" "s3_endpoint" {
  vpc_id = aws_vpc.main.id
  service_name = "com.amazonaws.ap-south-1.s3"
  route_table_ids = [aws_route_table.private.id]
  tags = {
    Name = "s3-endpoint"
  }
}

# Route Table Modification for Private Subnet to Route to S3 via Endpoint
resource "aws_route" "s3" {
  route_table_id         = aws_route_table.private.id
  destination_cidr_block = "0.0.0.0/0"
  vpc_endpoint_id        = aws_vpc_endpoint.s3_endpoint.id
  depends_on = [ aws_vpc_endpoint.s3_endpoint ]
}