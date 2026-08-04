resource "azurerm_service_plan" "asp" {
  name                = var.name
  location            = var.location
  resource_group_name = var.rg_name
  os_type             = "Windows"
  sku_name            = var.sku
  worker_count        = var.worker_count
  tags                = var.tags
}