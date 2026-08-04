variable "resource_groups" {
  type        = map(object({
    name     = string
    location = string
  }))
  description = "A map of resource group objects containing their names and locations."
}

variable "app_service_plans" {
  type        = map(object({
    name         = string
    rg_key       = string
    sku_name     = string
    worker_count = number
  }))
  description = "A map of App Service Plan configurations including SKU and worker instances."
}

variable "app_services" {
  type        = map(object({
    name    = string
    rg_key  = string
    asp_key = string
    ip_restrictions = list(object({
      name        = string
      ip_address  = optional(string)
      service_tag = optional(string)
      action      = string
      priority    = number
    }))
  }))
  description = "A map of Windows Web Apps and their respective IP access restriction security rules."
}

variable "traffic_manager" {
  type        = object({
    name           = string
    rg_key         = string
    routing_method = string
  })
  description = "Configuration settings for the Azure Traffic Manager profile and routing method."
}

variable "tags" {
  type        = map(string)
  description = "A map of tags applied across all deployed Azure resources."
}