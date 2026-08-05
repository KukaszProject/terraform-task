variable "name" {
  type        = string
  description = "Name of the Azure Container Registry"
}
variable "location" {
  type        = string
  description = "Azure region for the ACR"
}
variable "rg_name" {
  type        = string
  description = "Name of the Resource Group"
}
variable "sku" {
  type        = string
  description = "SKU used for the Azure Container Registry"
}
variable "git_repo_url" {
  type        = string
  description = "GitHub Repository URL for the ACR Task"
}
variable "git_pat" {
  type        = string
  description = "Personal Access Token for the Git repo"
}
variable "image_name" {
  type        = string
  description = "Name of the Docker image to be built"
}
variable "tags" {
  type        = map(string)
  description = "Tags applied to the Azure Container Registry"
}