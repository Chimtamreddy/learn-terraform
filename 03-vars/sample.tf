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

# Map Variables
variable "fruit" {
  default = {
    apple = {
      stock = 100
      price = 10
    }
    mango = {
      stock = 400
      price = 20
    }
  }
}

output "fruit_2" {
  value = var.fruit["apple"].stock
}
output "fruit_with_price" {
  value = var.fruit["apple"].price
}
