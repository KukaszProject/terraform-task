module "rgs" {
  source   = "./modules/resource_group"
  for_each = var.resource_groups

  name     = each.value.name
  location = each.value.location
  tags     = var.tags
}

module "asps" {
  source   = "./modules/app_service_plan"
  for_each = var.app_service_plans

  name         = each.value.name
  location     = module.rgs[each.value.rg_key].location
  rg_name      = module.rgs[each.value.rg_key].name
  sku          = each.value.sku
  worker_count = each.value.worker_count
  tags         = var.tags
}

module "apps" {
  source   = "./modules/app_service"
  for_each = var.app_services

  name     = each.value.name
  location = module.rgs[each.value.rg_key].location
  rg_name  = module.rgs[each.value.rg_key].name
  asp_id   = module.asps[each.value.asp_key].id
  tags     = var.tags

  ip_restrictions = [
    {
      name       = "allow-ip"
      ip_address = "${var.verification_agent_ip}/32"
      priority   = 100
    },
    {
      name        = "allow-tm"
      service_tag = "AzureTrafficManager"
      priority    = 110
    }
  ]
}

module "traffic_manager" {
  source  = "./modules/traffic_manager"
  name    = "cmaz-ac643e5v-mod5-traf"
  rg_name = module.rgs["rg3"].name
  tags    = var.tags

  endpoints = {
    ep1 = { app_id = module.apps["app1"].id }
    ep2 = { app_id = module.apps["app2"].id }
  }
}