variable "resource_group_name" {
  type        = string
  description = "Name of the Resource Group"
}

variable "location" {
  type        = string
  description = "Azure region"
  default     = "West US 2"
}

variable "vnet_name" {
  type        = string
  description = "Name of the Virtual Network"
}

variable "subnet_name" {
  type        = string
  description = "Name of the Subnet"
}

variable "nic_name" {
  type        = string
  description = "Name of the Network Interface"
}

variable "nsg_name" {
  type        = string
  description = "Name of the Network Security Group"
}

variable "nsg_rule_http" {
  type        = string
  description = "Name of the NSG HTTP rule"
}

variable "nsg_rule_ssh" {
  type        = string
  description = "Name of the NSG SSH rule"
}

variable "public_ip" {
  type        = string
  description = "Name of the Public IP"
}

variable "domain_name_label" {
  type        = string
  description = "DNS name label for the Public IP"
}

variable "vm_name" {
  type        = string
  description = "Name of the Virtual Machine"
}

variable "vm_os_version" {
  type        = string
  description = "OS version/sku for the VM"
}

variable "vm_SKU" {
  type        = string
  description = "VM size SKU"
}

variable "admin_username" {
  type        = string
  description = "Admin username for the VM"
  default     = "azureuser"
}

variable "vm_password" {
  type        = string
  description = "Admin password for the VM (sensitive input)"
  sensitive   = true
}

variable "tags" {
  type        = map(string)
  description = "Tags applied to resources"
}