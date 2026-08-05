variable "name" {
  type        = string
  description = "Name of the Azure Kubernetes Service cluster"
}
variable "location" {
  type        = string
  description = "Azure region for the AKS cluster"
}
variable "rg_name" {
  type        = string
  description = "Name of the Resource Group"
}

variable "acr_id" {
  type        = string
  description = "ID of the Azure Container Registry to pull images from"
}
variable "key_vault_id" {
  type        = string
  description = "ID of the Key Vault to pull secrets from via CSI driver"
}
variable "tags" {
  type        = map(string)
  description = "Tags applied to the AKS cluster"
}

variable "default_node_pool_name" {
  type        = string
  description = "The name of the default node pool for the AKS cluster"
}

variable "default_node_pool_instance_count" {
  type        = number
  description = "The number of nodes in the default node pool"
}

variable "default_node_pool_instance_node_size" {
  type        = string
  description = "The VM size of the nodes in the default node pool"
}