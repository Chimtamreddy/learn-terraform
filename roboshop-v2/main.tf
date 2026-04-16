variable "ami" {
  default = "ami-0b4f379183e5706b9"
}
variable "instance_type" {
  default = "t3.small"
}
variable "security_groups" {
  default = [
    "sg-0e3a1d089c9059cfc"
  ]
}
variable "zone_id" {
  default = "Z08590761XW1O9G92270H"
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
  tags = {
    Name = lookup(each.value, "name", null)
  }
}

# resource "aws_route53_record" "record" {
#   for_each = var.components
#   zone_id = var.zone_id
#   name    = "${lookup(each.value, "name", null)}.anysite.info"
#   type    = "A"
#   ttl     = 30
#   # records = lookup(aws_instance.instance, )
# }

output "aws_instance" {
  value = aws_instance.instance
}