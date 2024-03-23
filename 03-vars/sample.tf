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
  value = var.fruits
}

# Map Variable
variable "fruit_stock" {
  default = {
    kiwi = 100
    orange = 200
  }
}

output "fruit_stock" {
  value = var.fruit_stock
}

# Map Variable, Map of Maps
variable "fruit_stock_with_price" {
  default = {
    kiwi = {
      stock = 10
      price = 20
    }

    orange = {
      stock = 100
      price = 10
    }

  }
}


## Access a list variable, List index start from zero

output "fruit_first" {
  value = var.fruits[0]
}

output "fruit_second" {
  value = var.fruits[1]
}

# Access a Map Variable
output "fruit_stock_orange" {
  value = var.fruit_stock["orange"]
}

output "fruit_stock_with_price_of_kiwi" {
  value = var.fruit_stock["kiwi"].stock
}
