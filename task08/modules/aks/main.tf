resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.name
  location            = var.location
  resource_group_name = var.rg_name
  dns_prefix          = "${var.name}-dns"
  tags                = var.tags

  default_node_pool {
    name            = var.default_node_pool_name
    node_count      = var.default_node_pool_instance_count
    vm_size         = var.default_node_pool_instance_node_size
    os_disk_type    = "Ephemeral"
    os_disk_size_gb = 30 # Required to fit inside the VM's temp storage cache
  }

  identity {
    type = "SystemAssigned"
  }

  key_vault_secrets_provider {
    secret_rotation_enabled = true
  }
}

resource "azurerm_role_assignment" "acr_pull" {
  principal_id                     = azurerm_kubernetes_cluster.aks.kubelet_identity[0].object_id
  role_definition_name             = "AcrPull"
  scope                            = var.acr_id
  skip_service_principal_aad_check = true
}

resource "azurerm_key_vault_access_policy" "aks_csi" {
  key_vault_id = var.key_vault_id
  tenant_id    = azurerm_kubernetes_cluster.aks.identity[0].tenant_id
  object_id    = azurerm_kubernetes_cluster.aks.key_vault_secrets_provider[0].secret_identity[0].object_id

  secret_permissions = ["Get", "List"]
}