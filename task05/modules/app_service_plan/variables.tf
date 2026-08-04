variable "name" {
  type        = string
  description = "Name of the App Service Plan"
}

variable "rg_name" {
  type        = string
  description = "Name of the Resource Group"
}

variable "location" {
  type        = string
  description = "Azure region"
}

variable "sku" {
  type        = string
  description = "SKU pricing tier"
}

variable "worker_count" {
  type        = number
  description = "Worker (instance) count"
}

variable "tags" {
  type        = map(string)
  description = "Tags applied to the plan"
}