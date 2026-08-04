variable "resource_groups" {
  type = map(object({
    name     = string
    location = string
  }))
  description = "A map of resource group objects containing their name and location."
}

variable "app_service_plans" {
  type = map(object({
    name         = string
    worker_count = number
    sku          = string
    rg_key       = string
  }))
  description = "A map defining the App Service Plans and their scaling configurations."
}

variable "app_services" {
  type = map(object({
    name    = string
    asp_key = string
    rg_key  = string
  }))
  description = "A map defining the Windows Web Apps and their target service plans."
}

variable "tags" {
  type        = map(string)
  description = "A mapping of standard tags to assign to all resources."
}

variable "verification_agent_ip" {
  type        = string
  description = "The IP address of the verification agent for access restrictions."
}

variable "ip_rule_name" {
  type        = string
  description = "The name of the access restriction rule allowing the verification agent IP."
}

variable "tm_rule_name" {
  type        = string
  description = "The name of the access restriction rule allowing Azure Traffic Manager."
}

variable "tm_profile_name" {
  type        = string
  description = "The name of the Azure Traffic Manager profile."
}

variable "tm_routing_method" {
  type        = string
  description = "The routing method used by the Azure Traffic Manager profile."
}