variable "name" {
  type        = string
  description = "Name of the Key Vault"
}
variable "location" {
  type        = string
  description = "Azure region for the Key Vault"
}
variable "rg_name" {
  type        = string
  description = "Name of the Resource Group"
}
variable "sku" {
  type        = string
  description = "SKU used for the Key Vault"
}
variable "tags" {
  type        = map(string)
  description = "Tags applied to the Key Vault"
}