variable "fruits" {
  default = ["apple", "banana"]
}

output "fruits" {
#  value = var.fruits[0]
  value = element(var.fruits, 2)
}

variable "fruit_with_stock" {
  default = {
    apple = {
      stock = 10
    }
  }
}

output "fruit_stock" {
  value = var.fruit_with_stock[apple].stock
#  value = try(var.fruit_with_stock[banana], 0)
}

output "fruit_stock_price" {
  value = lookup(var.fruit_with_stock, "apple", 30)
#  value = try(var.fruit_with_stock[apple].price, 25)
}