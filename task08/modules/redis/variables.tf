variable "name" {
  type        = string
  description = "Name of the Redis Cache instance"
}
variable "location" {
  type        = string
  description = "Azure region for the Redis Cache"
}
variable "rg_name" {
  type        = string
  description = "Name of the Resource Group"
}
variable "capacity" {
  type        = number
  description = "Capacity size of the Redis Cache"
}
variable "family" {
  type        = string
  description = "SKU family of the Redis Cache"
}
variable "sku" {
  type        = string
  description = "SKU of the Redis Cache"
}
variable "key_vault_id" {
  type        = string
  description = "ID of the Key Vault to store secrets in"
}
variable "secret_name_hostname" {
  type        = string
  description = "Name of the Key Vault secret storing Redis hostname"
}
variable "secret_name_primary_key" {
  type        = string
  description = "Name of the Key Vault secret storing Redis primary key"
}
variable "tags" {
  type        = map(string)
  description = "Tags applied to the Redis Cache"
}