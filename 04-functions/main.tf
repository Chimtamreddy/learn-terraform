variable "components" {
  default = ["frontend", "mongodb", "catalogue"]
}

output "components" {
#  value = var.components[0]
  value = element(var.components, 3)
}