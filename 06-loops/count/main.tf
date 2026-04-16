variable "components" {
  default = ["redis", "frontend", "mongodb", "catalogue"]
}

resource "aws_instance" "instance" {
  count = length(var.components)
  ami           = "ami-0b4f379183e5706b9"
  instance_type = "t3.small"
  vpc_security_group_ids = [
    "sg-0e3a1d089c9059cfc"
  ]
  tags = {
    Name = element(var.components, count.index)
  }
}

