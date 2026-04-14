variable "components" {
  default = ["frontend", "mongodb", "catalogue"]
}

output "components" {
#  value = var.components[0]
  value = element(var.components, 3)
}

variable "fruits_with_stock" {
  default = {
    apple = {
      stock = 100
      price = 20
    }
  }
}

output "fruits_with_stock" {
#  value = var.fruits_with_stock["apple"].stock
  value = try(var.fruits_with_stock["banana"], 0)
}