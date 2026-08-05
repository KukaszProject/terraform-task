import {
  to = azurerm_resource_group.rg
  id = "/subscriptions/fe7f3f41-b0fa-47c8-84f7-d5e8ae76595f/resourceGroups/cmtr-ac643e5v-mod7-rg"
}

import {
  to = azurerm_storage_account.sa
  id = "/subscriptions/fe7f3f41-b0fa-47c8-84f7-d5e8ae76595f/resourceGroups/cmtr-ac643e5v-mod7-rg/providers/Microsoft.Storage/storageAccounts/cmtrac643e5vmod7sa"
}

resource "azurerm_resource_group" "rg" {
  name     = var.rg_name
  location = var.location

  tags = {
    rg_reference = var.rg_id
  }
}

resource "azurerm_storage_account" "sa" {
  name                     = var.sa_name
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  allow_nested_items_to_be_public  = false
  cross_tenant_replication_enabled = false

  tags = {
    sa_reference = var.sa_id
  }
}

module "cdn" {
  source = "./modules/cdn"

  rg_name              = azurerm_resource_group.rg.name
  sa_primary_blob_host = azurerm_storage_account.sa.primary_blob_host

  fd_profile_name      = var.fd_profile_name
  fd_sku_name          = var.fd_sku_name
  fd_endpoint_name     = var.fd_endpoint_name
  fd_origin_group_name = var.fd_origin_group_name
  fd_origin_name       = var.fd_origin_name
  fd_route_name        = var.fd_route_name
}