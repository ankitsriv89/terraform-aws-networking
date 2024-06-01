# vpc_peering.tf
resource "aws_vpc_peering_connection" "peer" {
    depends_on = [
    aws_vpc.vpc_a, aws_vpc.vpc_b
  ]
  provider = aws.mumbai
  vpc_id = aws_vpc.vpc_a.id
  peer_vpc_id = aws_vpc.vpc_b.id
  peer_region = "ap-south-1"
  auto_accept = false
  
}

resource "aws_vpc_peering_connection_accepter" "accepter" {
    depends_on = [ aws_vpc.vpc_b ]
  provider = aws.virginia
  vpc_peering_connection_id = aws_vpc_peering_connection.peer.id
  auto_accept = true

  accepter {
    allow_remote_vpc_dns_resolution = true
  }

  requester {
    allow_remote_vpc_dns_resolution = true
  }
  
}

resource "aws_route" "route_vpc_a_to_vpc_b" {
  provider = aws.mumbai
  route_table_id = aws_route_table.publicrt_a.id
  destination_cidr_block = aws_vpc.vpc_b.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.peer.id

  depends_on = [
    aws_vpc_peering_connection_accepter.accepter
  ]
}

resource "aws_route" "route_vpc_b_to_vpc_a" {
  provider = aws.virginia
  route_table_id = aws_route_table.privatert_b.id
  destination_cidr_block = aws_vpc.vpc_a.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.peer.id

  depends_on = [
    aws_vpc_peering_connection_accepter.accepter
  ]
}
