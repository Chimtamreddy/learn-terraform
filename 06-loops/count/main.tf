variable "components" {
  default = [ "frontend", "mongodb", "catalogue" ]
}

resource "aws_instance" "instance" {
  count = length(var.components)
  ami           = "ami-0f3c7d07486cad139"
  instance_type = "t3.small"
  vpc_security_group_ids = ["sg-0cd45286220a14e5a"]

  tags = {
    Name = var.components[count.index]


  }
}

