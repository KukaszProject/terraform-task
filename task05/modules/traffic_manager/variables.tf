variable "name" {
  type        = string
  description = "Name of the Traffic Manager profile"
}

variable "resource_group_name" {
  type        = string
  description = "Resource group name for Traffic Manager"
}

variable "routing_method" {
  type        = string
  description = "Traffic routing method (e.g., Performance)"
}

variable "endpoints" {
  type = map(object({
    name               = string
    target_resource_id = string
    weight             = optional(number, 1)
    priority           = optional(number, 1)
  }))
  description = "Map of Traffic Manager Azure endpoints using for_each"
}

variable "tags" {
  type        = map(string)
  description = "Tags applied to Traffic Manager profile"
}