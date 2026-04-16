

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
    frontend = {
      name = "frontend"
      instance_type = "t3.micro"
    }

    mongodb = {
      name = "mongodb"
      instance_type = "t3.micro"
    }
  }
}