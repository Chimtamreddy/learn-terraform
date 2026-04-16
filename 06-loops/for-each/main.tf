variable "components" {
  default = {
    rabbitmq = { name = "rabbitmq_sg" }
    frontend = { name = "frontend_sg" }
    mongodb = { name = "mongodb_sg" }
    catalogue = { name = "catalogue_sg" }

  }
}

resource "aws_security_group" "allow_tls" {
  for_each = var.components
  tags = {
    Name = each.key
  }
}