variable "fruits" {
  default = "apple"
}

output "fruit_name" {
  value = var.fruits
}