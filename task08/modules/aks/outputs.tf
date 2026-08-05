output "host" {
  value     = try(azurerm_kubernetes_cluster.aks.kube_config[0].host, "")
  sensitive = true
}

output "client_certificate" {
  value     = try(azurerm_kubernetes_cluster.aks.kube_config[0].client_certificate, "")
  sensitive = true
}

output "client_key" {
  value     = try(azurerm_kubernetes_cluster.aks.kube_config[0].client_key, "")
  sensitive = true
}

output "cluster_ca_certificate" {
  value     = try(azurerm_kubernetes_cluster.aks.kube_config[0].cluster_ca_certificate, "")
  sensitive = true
}

output "tenant_id" {
  value = azurerm_kubernetes_cluster.aks.identity[0].tenant_id
}

output "csi_identity_client_id" {
  value = azurerm_kubernetes_cluster.aks.key_vault_secrets_provider[0].secret_identity[0].client_id
}