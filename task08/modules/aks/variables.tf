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
variable "node_pool_name" {
  type        = string
  description = "Name of the default node pool"
}
variable "node_pool_count" {
  type        = number
  description = "Number of nodes in the default node pool"
}
variable "node_pool_size" {
  type        = string
  description = "VM size for the default node pool"
}
variable "node_pool_disk_type" {
  type        = string
  description = "OS disk type for the default node pool"
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