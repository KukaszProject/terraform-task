variable "location" {
  type        = string
  description = "The Azure region where resources will be imported and created"
}

variable "rg_name" {
  type        = string
  description = "The name of the pre-created Resource Group"
}

variable "rg_id" {
  type        = string
  description = "The Azure Resource ID of the pre-created Resource Group"
}

variable "sa_name" {
  type        = string
  description = "The name of the pre-created Storage Account"
}

variable "sa_id" {
  type        = string
  description = "The Azure Resource ID of the pre-created Storage Account"
}

variable "fd_profile_name" {
  type        = string
  description = "The name of the CDN Front Door profile"
}

variable "fd_sku_name" {
  type        = string
  description = "The SKU for the CDN Front Door profile"
}

variable "fd_endpoint_name" {
  type        = string
  description = "The name of the CDN Front Door endpoint"
}

variable "fd_origin_group_name" {
  type        = string
  description = "The name of the CDN Front Door origin group"
}

variable "fd_origin_name" {
  type        = string
  description = "The name of the CDN Front Door origin"
}

variable "fd_route_name" {
  type        = string
  description = "The name of the CDN Front Door route"
}