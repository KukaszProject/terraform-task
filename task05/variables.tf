variable "resource_groups" {
  type = map(object({
    name     = string
    location = string
  }))
}

variable "app_service_plans" {
  type = map(object({
    name         = string
    rg_key       = string
    sku_name     = string
    worker_count = number
  }))
}

variable "app_services" {
  type = map(object({
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
}

variable "traffic_manager" {
  type = object({
    name           = string
    rg_key         = string
    routing_method = string
  })
}

variable "tags" {
  type = map(string)
}