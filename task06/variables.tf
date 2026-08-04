variable "region" {
  type        = string
  description = "The Azure region where all resources will be provisioned."
  default     = "West US 2"
}

variable "name_prefix" {
  type        = string
  description = "The prefix string used to generate dynamic names for the resources."
  default     = "cmaz-ac643e5v-mod6"
}

variable "kv_rg_name" {
  type        = string
  description = "The name of the resource group that contains the existing Azure Key Vault."
  default     = "cmaz-ac643e5v-mod6-kv-rg"
}

variable "kv_name" {
  type        = string
  description = "The name of the existing Azure Key Vault used to store secrets."
  default     = "cmaz-ac643e5v-mod6-kv"
}

variable "allowed_ip_address" {
  type        = string
  description = "Verification agent IP address that will be allowed through the SQL firewall."
}

variable "sql_admin_username" {
  type        = string
  description = "The administrator username for the Azure SQL Server."
  default     = "sqladmin"
}

variable "tags" {
  type        = map(string)
  description = "A mapping of tags to assign to all created resources."
  default = {
    Creator = "lukasz_kielbasa@epam.com"
  }
}