variable "fruits" {
  default = "apple"
}

output "fruit_name" {
  value = var.fruits
}

# Print Plain Variable
variable "fruit_stock" {
  default = "banana"
}

output "fruit" {
  value = var.fruit_stock
}