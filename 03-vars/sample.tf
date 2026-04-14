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

# Print List Variables
variable "fruit_with_stock" {
  default = ["apple", "banana" ]
}
output "fruit_with_stock" {
  value = var.fruit_with_stock[0]
}

output "fruit_with_stock_1" {
  value = var.fruit_with_stock[1]
}