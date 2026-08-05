variable "rg_name" {
  type        = string
  description = "Resource Group name"
}

variable "sa_primary_blob_host" {
  type        = string
  description = "Primary blob host"
}

variable "fd_profile_name" {
  type        = string
  description = "Front Door profile name"
}

variable "fd_sku_name" {
  type        = string
  description = "Front Door SKU"
}

variable "fd_endpoint_name" {
  type        = string
  description = "Front Door endpoint name"
}

variable "fd_origin_group_name" {
  type        = string
  description = "Front Door origin group name"
}

variable "fd_origin_name" {
  type        = string
  description = "Front Door origin name"
}

variable "fd_route_name" {
  type        = string
  description = "Front Door route name"
}