variable "rg_name" {
  type        = string
  description = "The name of the resource group where the Web App will be created."
}

variable "location" {
  type        = string
  description = "The Azure region where the Web App resources will be deployed."
}

variable "asp_name" {
  type        = string
  description = "The name of the Azure App Service Plan."
}

variable "app_name" {
  type        = string
  description = "The name of the Linux Web Application."
}

variable "sql_connection_string" {
  type        = string
  sensitive   = true
  description = "The ADO.NET connection string for the Azure SQL Database to be injected into the Web App settings."
}

variable "tags" {
  type        = map(string)
  description = "A mapping of tags to assign to the Web App resources."
}