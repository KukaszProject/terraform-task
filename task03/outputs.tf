output "rg_id" {
  value       = azurerm_resource_group.rg.id
  description = "The ID of the Resource Group"
}

output "sa_blob_endpoint" {
  value       = azurerm_storage_account.sa.primary_blob_endpoint
  description = "The Primary Blob Endpoint of the Storage Account"
}

output "vnet_id" {
  value       = azurerm_virtual_network.vnet.id
  description = "The ID of the Virtual Network"
}