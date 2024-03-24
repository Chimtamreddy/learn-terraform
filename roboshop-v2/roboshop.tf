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

variable "components" {
  default = {
    frontend = { name = "frontend-dev" }
    mongodb = { name = "mongodb-dev" }
    catalogue = { name = "catalogue-dev" }
    redis = { name = "redis-dev" }
    user = { name = "user-dev" }
    cart = { name = "cart-dev" }
    mysql = { name = "mysql-dev" }
    shipping = { name = "shipping-dev" }
    rabbitmq = { name = "rabbitmq-dev" }
    payment = { name = "payment-dev" }
  }
}

resource "aws_instance" "instance" {
  for_each = var.components
  ami           = var.ami
  instance_type = var.instance_type
  vpc_security_group_ids = var.security_groups

  tags = {
    Name = lookup(each.value, "name", null)
  }
}

#resource "aws_route53_record" "frontend" {
#  zone_id = var.zone_id
#  name    = "frontend-dev.kr7348202.online"
#  type    = "A"
#  ttl     = 30
#  records = [aws_instance.frontend.private_ip]
#}