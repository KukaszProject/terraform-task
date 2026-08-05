variable "name" {
  type        = string
  description = "Name of the Azure Container Instance group"
}
variable "location" {
  type        = string
  description = "Azure region for the ACI"
}
variable "rg_name" {
  type        = string
  description = "Name of the Resource Group"
}
variable "acr_login_server" {
  type        = string
  description = "Login server URL of the ACR"
}
variable "acr_admin_username" {
  type        = string
  description = "Admin username for the ACR"
}
variable "acr_admin_password" {
  type        = string
  description = "Admin password for the ACR"
}
variable "image_name" {
  type        = string
  description = "Name of the Docker image to deploy"
}
variable "redis_hostname" {
  type        = string
  description = "Hostname of the Redis cache to connect to"
}
variable "redis_primary_key" {
  type        = string
  description = "Primary access key of the Redis cache"
}
variable "tags" {
  type        = map(string)
  description = "Tags applied to the Azure Container Instance"
}