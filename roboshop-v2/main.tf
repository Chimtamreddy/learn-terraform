resource "aws_instance" "frontend" {
  ami           = "ami-0b4f379183e5706b9"
  instance_type = "t3.small"
  vpc_security_group_ids = [
    "sg-0e3a1d089c9059cfc"
  ]
  tags = {
    Name = "frontend"
  }
}

resource "aws_route53_record" "frontend" {
  zone_id = "Z08590761XW1O9G92270H"
  name    = "frontend-dev.anysite.info"
  type    = "A"
  ttl     = 30
  records = [aws_instance.frontend.private_ip]
}