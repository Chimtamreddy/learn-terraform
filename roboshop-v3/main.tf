module "components" {
  source = "./module"
  name = each.value["name"]
  instance_type = each.value["instance_type"]
}