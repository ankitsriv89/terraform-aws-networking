resource "aws_vpc_endpoint" "sqs_interface_endpoint" {
  vpc_id = aws_vpc.main.id
  service_name = "com.amazonaws.ap-south-1.sqs"
  subnet_ids        = [aws_subnet.private.id]
  #route_table_ids = [aws_route_table.private.id]
  vpc_endpoint_type = "Interface"

  security_group_ids = [
    aws_security_group.sg_endpoint.id,
  ]

  private_dns_enabled = true
  
  tags = {
    Name = "sg_endpoint"
  }
}

# Route Table Modification for Private Subnet to Route to SQS via Endpoint
resource "aws_route" "sqs_endpoint" {
  depends_on = [
    aws_sqs_queue.sqs,
    aws_vpc_endpoint.sqs_interface_endpoint
  ]
  #depends_on = [ aws_vpc_endpoint.sqs_interface_endpoint ]
  route_table_id         = aws_route_table.private.id
  destination_cidr_block = "0.0.0.0/0"
  vpc_endpoint_id        = aws_vpc_endpoint.sqs_interface_endpoint.id
  
}  
