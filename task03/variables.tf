variable "resource_group_name" {
  type        = string
  description = "Name of the Resource Group"
}

variable "location" {
  type        = string
  description = "Azure region for the resources"
  default     = "East US"
}

variable "storage_account_name" {
  type        = string
  description = "Name of the Storage Account"
}

variable "vnet_name" {
  type        = string
  description = "Name of the Virtual Network"
}

variable "subnet_names" {
  type        = list(string)
  description = "List of subnet names"
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply to resources"
}