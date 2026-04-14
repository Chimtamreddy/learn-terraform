data "aws_ami" "ami" {
  ami = "ami-0b4f379183e5706b9"
  name_regex = "Centos-8-DevOps-Practice"

}

output "aws_ami" {
  value = data.aws_ami.ami
}