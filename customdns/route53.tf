# Route 53 Private Hosted Zone
resource "aws_route53_zone" "private" {
  name = "corp.ankit"
  vpc {
    vpc_id = aws_vpc.main.id
  }

  tags = {
    Name = "private-hosted-zone"
  }
}

# Route 53 A Record for App Instance
resource "aws_route53_record" "app" {
  zone_id = aws_route53_zone.private.zone_id
  name    = "app.corp.ankit"
  type    = "A"
  ttl     = "300"
  records = [aws_instance.app.private_ip]
}

# Route 53 A Record for DB Instance
resource "aws_route53_record" "db" {
  zone_id = aws_route53_zone.private.zone_id
  name    = "db.corp.ankit"
  type    = "A"
  ttl     = "300"
  records = [aws_instance.db.private_ip]
}