data "aws_ami_ids" "ami" {
  name_regex    = "Centos-*"
  owners = ["973714476881"]
}

output "ami" {
  value = data.aws_ami_ids.ami
}

resource "aws_instance" "instance" {
  ami           = data.aws_ami_ids.ami
  instance_type = "t3.small"
  vpc_security_group_ids = ["sg-061167548882a91e3"]

}

