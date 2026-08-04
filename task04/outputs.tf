output "vm_public_ip" {
  value       = azurerm_public_ip.pip.ip_address
  description = "Public IP address of the Virtual Machine"
}

output "vm_fqdn" {
  value       = azurerm_public_ip.pip.fqdn
  description = "Fully Qualified Domain Name of the Virtual Machine"
}