variable "components" {
  default = [ "frontend", "mongodb" ]
}

resource "aws_instance" "instance" {
  count = length(var.components)
  ami           = "ami-0f3c7d07486cad139"
  instance_type = "t3.small"
  vpc_security_group_ids = ["sg-061167548882a91e3"]

  tags = {
#    Name = var.components[count.index]
    Name = element(var.components, count.index)

  }
}