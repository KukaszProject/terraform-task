variable "rg_name" {
  type        = string
  description = "The name of the resource group where the SQL Server will be created."
}

variable "location" {
  type        = string
  description = "The Azure region where the SQL resources will be deployed."
}

variable "sql_server_name" {
  type        = string
  description = "The name of the logical Azure SQL Server."
}

variable "sql_db_name" {
  type        = string
  description = "The name of the Azure SQL Database."
}

variable "admin_username" {
  type        = string
  description = "The administrator username for the Azure SQL Server."
}

variable "kv_id" {
  type        = string
  description = "The ID of the existing Azure Key Vault where SQL credentials will be stored."
}

variable "allowed_ip_address" {
  type        = string
  description = "The specific IP address to be allowed in the SQL Server firewall rules."
}

variable "tags" {
  type        = map(string)
  description = "A mapping of tags to assign to the SQL resources."
}