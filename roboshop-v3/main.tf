module "components" {
  source = "./module"

  for_each = var.components
  name = each.value["name"]
  instance_type = each.value["instance_type"]
}