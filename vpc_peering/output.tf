# outputs.tf
output "vpc_a_id" {
  value = aws_vpc.vpc_a.id
}

output "vpc_b_id" {
  value = aws_vpc.vpc_b.id
}

output "ec2_vpc_a_public_ip" {
  value = aws_instance.ec2_vpc_a.public_ip
}

output "vpc_peering_connection_id" {
  value = aws_vpc_peering_connection.peer.id
}
