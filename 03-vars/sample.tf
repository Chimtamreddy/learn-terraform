# Plain Variable
variable "fruit_name" {
  default = "apple"
}

output "fruit_name" {
  value = var.fruit_name
}

# List Variable
variable "fruits" {
  default = [
    "mango",
    "banana"
  ]
}

output "fruits" {
  value = var.fruits[0]
}

# Map Variable
variable "fruit_stock" {
  default = {
    kiwi = 100
    orange = 200
  }
}

output "fruit_stock" {
  value = var.fruit_stock[1]
}


