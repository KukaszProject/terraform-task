variable "rg_name" {
  type        = string
  description = "The name of the Resource Group where CDN resources will be deployed"
}

variable "sa_primary_blob_host" {
  type        = string
  description = "The primary blob host of the Storage Account to be used as the CDN origin"
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