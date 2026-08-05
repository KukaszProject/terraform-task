output "endpoint_hostname" {
  value       = azurerm_cdn_frontdoor_endpoint.fd_endpoint.host_name
  description = "The hostname of the Azure CDN Front Door Endpoint"
}