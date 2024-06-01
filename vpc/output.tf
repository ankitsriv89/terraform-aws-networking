output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.main.id
}

output "public_subnet_id" {
  description = "The ID of the public subnet"
  value       = aws_subnet.public.id
}

output "private_subnet_id" {
  description = "The ID of the private subnet"
  value       = aws_subnet.private.id
}

output "dhcp_options_id" {
  description = "The ID of the DHCP Options Set"
  value       = aws_vpc_dhcp_options.corp_dhcp_options.id
}

output "dhcp_options_name" {
  description = "dhcp option name"
  value = aws_vpc_dhcp_options.corp_dhcp_options.domain_name
}

output "ec2sg_id" {
  description = "Id of the security group"
  value = aws_security_group.web_sg.id
}

output "ec2inst_ip" {
  description = "instance ip"
  value = aws_instance.ec2instance.public_ip
}

output "ec2inst_dns" {
    description = "instance public dns"
    value = aws_instance.ec2instance.public_dns
  
}

output "ec2inst_pvt_dns" {
    description = "ec2 instance private dns"
  value = aws_instance.ec2instance.private_dns
}