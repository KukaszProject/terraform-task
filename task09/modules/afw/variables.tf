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

variable "subnet_name" {
  type        = string
  description = "Existing AKS Cluster Subnet name"
}

variable "aks_loadbalancer_ip" {
  type        = string
  description = "AKS load-balancer Public IP address for NAT DNAT rules"
}

variable "public_ip_name" {
  type        = string
  description = "Firewall Public IP name"
}

variable "firewall_subnet_prefix" {
  type        = string
  default     = "10.0.10.0/24"
  description = "Address prefix for AzureFirewallSubnet"
}