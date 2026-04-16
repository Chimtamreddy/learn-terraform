variable "ami" {
  ami = "ami-0b4f379183e5706b9"
}
variable "instance_type" {
  instance_type = "t3.small"
}
variable "security_groups" {
  vpc_security_group_ids = [
    "sg-0e3a1d089c9059cfc"
  ]
}
variable "zone_id" {
  zone_id = "Z08590761XW1O9G92270H"
}

variable "components" {
  default = {
    frontend = { name = "frontend-dev" }
    mongodb = { name = "mongodb-dev" }
    catalogue = { name = "catalogue-dev" }
    redis = { name = "redis-dev" }
  }

}

resource "aws_instance" "instance" {
  for_each = var.components
  ami           = var.ami
  instance_type = var.instance_type
  vpc_security_group_ids = var.security_groups

}

# resource "aws_route53_record" "frontend" {
#   for_each = var.components
#   zone_id = var.zone_id
#   name    = "frontend-dev.anysite.info"
#   type    = "A"
#   ttl     = 30
#   records = [aws_instance.frontend.private_ip]
# }

output "aws_instance" {
  value = aws_instance.instance
}