variable "ami" {
  default = "ami-0f3c7d07486cad139"
}

variable "instance_type" {
  default = "t3.small"
}

variable "security_groups" {
  default = ["sg-061167548882a91e3"]
}

variable "zone_id" {
  default = "Z05847051QFB84Q2A5JP0"
}

resource "aws_instance" "frontend" {
  ami           = var.ami
  instance_type = var.instance_type
  vpc_security_group_ids = var.security_groups

  tags = {
    Name = "frontend"
  }
}

resource "aws_route53_record" "frontend" {
  zone_id = var.zone_id
  name    = "frontend-dev.kr7348202.online"
  type    = "A"
  ttl     = 30
  records = [aws_instance.frontend.private_ip]
}