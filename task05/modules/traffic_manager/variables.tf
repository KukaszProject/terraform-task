variable "name" {
  type        = string
  description = "Name of the Traffic Manager profile"
}

variable "rg_name" {
  type        = string
  description = "Resource group name for Traffic Manager"
}

variable "endpoints" {
  type = map(object({
    app_id = string
  }))
  description = "Map of Traffic Manager Azure endpoints using for_each"
}

variable "tags" {
  type        = map(string)
  description = "Tags applied to Traffic Manager profile"
}

variable "routing_method" { type = string }