variable "unique_id" {
  type        = string
  description = "Unique resource naming suffix"
}

variable "location" {
  type        = string
  description = "Azure region location"
}

variable "rg_name" {
  type        = string
  description = "Existing Resource Group name"
}

variable "vnet_name" {
  type        = string
  description = "Existing Virtual Network name"
}

variable "vnet_space" {
  type        = string
  description = "Existing Virtual Network Address Space"
}

variable "subnet_name" {
  type        = string
  description = "Existing Subnet name (AKS Cluster subnet)"
}

variable "subnet_space" {
  type        = string
  description = "Existing Subnet Address Space (AKS Cluster subnet)"
}

variable "aks_cluster_name" {
  type        = string
  description = "Existing AKS Cluster name"
}

variable "aks_loadbalancer_ip" {
  type        = string
  description = "AKS load-balancer Public IP address"
}

variable "public_ip_name" {
  type        = string
  description = "Firewall Public IP name"
}

variable "fw_subnet_prefix" {
  type        = string
  description = "Firewall Subnet prefix"
}