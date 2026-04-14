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

# Variable Data Types
variable "fruit_stock_with" {
  default = {
    apple = {
      stock = 200 # integer
      price = 2
      type = "washington" # string
      for_sale = true # boolean
    }
  }
}

variable "fruit_w" {
  default = "pinaple"
}
output "fruit_w" {
  value = "Fruit Name = {var.fruit_w}"
}

output "fruit_stock_with" {
  value = "Apple Stock = ${var.fruit_stock_with["apple"].stock}, Apple Price = ${var.fruit_stock_with["apple"].price}, Apple Type = ${var.fruit_stock_with["apple"].type}, Apple Sale Status=${var.fruit_stock_with["apple"].for_sale}"
}