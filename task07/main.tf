# Resource Definitions for Imported Resources
resource "azurerm_resource_group" "rg" {
  name     = var.rg_name
  location = var.location
}

resource "azurerm_storage_account" "sa" {
  name                     = var.sa_name
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  
  account_tier             = "Standard"
  account_replication_type = "LRS"

  allow_nested_items_to_be_public  = false
  cross_tenant_replication_enabled = false
}

resource "azurerm_storage_container" "container" {
  name                  = "content"
  storage_account_name  = azurerm_storage_account.sa.name
  container_access_type = "private"
}

resource "azurerm_storage_blob" "blob" {
  name                   = "blob.txt"
  storage_account_name   = azurerm_storage_account.sa.name
  storage_container_name = azurerm_storage_container.container.name
  type                   = "Block"
  source_content         = "Hello World from CDN!"
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