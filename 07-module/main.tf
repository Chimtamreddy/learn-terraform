module "test" {
  source = "./local-module"
}


output "test" {
  value = module.test
}

variable "instance_type" {
  default = "t3.micro"
}