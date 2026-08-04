# 1. Resource Groups
module "resource_groups" {
  for_each = var.resource_groups
  source   = "./modules/resource_group"

  name     = each.value.name
  location = each.value.location
  tags     = var.tags
}

# 2. App Service Plans
module "app_service_plans" {
  for_each = var.app_service_plans
  source   = "./modules/app_service_plan"

  name                = each.value.name
  resource_group_name = module.resource_groups[each.value.rg_key].name
  location            = module.resource_groups[each.value.rg_key].location
  sku_name            = each.value.sku_name
  worker_count        = each.value.worker_count
  tags                = var.tags
}

# 3. Windows Web Apps
module "app_services" {
  for_each = var.app_services
  source   = "./modules/app_service"

  name                = each.value.name
  resource_group_name = module.resource_groups[each.value.rg_key].name
  location            = module.resource_groups[each.value.rg_key].location
  service_plan_id     = module.app_service_plans[each.value.asp_key].id
  ip_restrictions     = each.value.ip_restrictions
  tags                = var.tags
}

# 4. Traffic Manager Profile with Endpoints
module "traffic_manager" {
  source = "./modules/traffic_manager"

  name                = var.traffic_manager.name
  resource_group_name = module.resource_groups[var.traffic_manager.rg_key].name
  routing_method      = var.traffic_manager.routing_method
  tags                = var.tags

  endpoints = {
    ep1 = {
      name               = "endpoint-app-01"
      target_resource_id = module.app_services["app1"].id
      priority           = 1
    }
    ep2 = {
      name               = "endpoint-app-02"
      target_resource_id = module.app_services["app2"].id
      priority           = 2
    }
  }
}

import {
  to = module.traffic_manager.azurerm_traffic_manager_azure_endpoint.endpoint["ep1"]
  id = "/subscriptions/fe7f3f41-b0fa-47c8-84f7-d5e8ae76595f/resourceGroups/cmaz-ac643e5v-mod5-rg-03/providers/Microsoft.Network/trafficManagerProfiles/cmaz-ac643e5v-mod5-traf/azureEndpoints/endpoint-app-01"
}

import {
  to = module.traffic_manager.azurerm_traffic_manager_azure_endpoint.endpoint["ep2"]
  id = "/subscriptions/fe7f3f41-b0fa-47c8-84f7-d5e8ae76595f/resourceGroups/cmaz-ac643e5v-mod5-rg-03/providers/Microsoft.Network/trafficManagerProfiles/cmaz-ac643e5v-mod5-traf/azureEndpoints/endpoint-app-02"
}