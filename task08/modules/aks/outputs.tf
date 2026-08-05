output "csi_identity_client_id" {
  description = "The Client ID of the AKS Key Vault Secrets Provider identity."
  # This extracts the client_id generated when the CSI driver is enabled on the cluster
  value = azurerm_kubernetes_cluster.aks.key_vault_secrets_provider[0].secret_identity[0].client_id
}

output "tenant_id" {
  description = "The Tenant ID of the AKS cluster identity."
  value       = azurerm_kubernetes_cluster.aks.identity[0].tenant_id
}