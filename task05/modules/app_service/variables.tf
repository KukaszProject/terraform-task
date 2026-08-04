variable "name" {
  type        = string
  description = "Name of the Windows Web App"
}

variable "resource_group_name" {
  type        = string
  description = "Name of the Resource Group"
}

variable "location" {
  type        = string
  description = "Azure region"
}

variable "service_plan_id" {
  type        = string
  description = "ID of the App Service Plan"
}

variable "ip_restrictions" {
  type = list(object({
    name        = string
    ip_address  = optional(string)
    service_tag = optional(string)
    action      = string
    priority    = number
  }))
  description = "List of IP restrictions with dynamic rules"
}

variable "tags" {
  type        = map(string)
  description = "Tags applied to the web app"
}