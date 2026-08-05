# Import Blocks
import {
  to = azurerm_resource_group.rg
  id = var.rg_id
}

import {
  to = azurerm_storage_account.sa
  id = var.sa_id
}

# Resource Definitions for Imported Resources
resource "azurerm_resource_group" "rg" {
  name     = var.rg_name
  location = var.location
}

resource "azurerm_storage_account" "sa" {
  name                = var.sa_name
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location

  # Assuming Standard_LRS for pre-created. The import state will reconcile this.
  account_tier             = "Standard"
  account_replication_type = "LRS"

  # Required settings
  allow_nested_items_to_be_public  = false
  cross_tenant_replication_enabled = false
}

# Call the CDN Module
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