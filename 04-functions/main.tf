variable "fruits" {
  default = ["apple", "banana"]
}

output "fruits" {
  value = var.fruits[0]

}

variable "fruit_with_stock" {
  default = {
    apple = {
      stock = 10
    }
  }
}

output "fruit_stock" {
  value = var.fruit_with_stock

}

output "fruit_stock_price" {
  value = lookup(var.fruit_with_stock, "apple", 30)

}