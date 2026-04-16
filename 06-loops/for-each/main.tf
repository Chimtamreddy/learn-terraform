variable "components" {
  default = {
    frontend = { name = "frontend" }
    mongodb = { name = "mongodb" }
    catalogue = { name = "catalogue" }

  }
}

resource "aws_security_group" "allow_tls" {
  for_each = var.components
  tags = {
    Name = lookup(var.components, each.value, null)
  }
}