# 1. Resource Group
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
  tags     = var.tags
}

# 2. Storage Account
resource "azurerm_storage_account" "sa" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  tags                     = var.tags
}

# 3. Virtual Network
resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  tags                = var.tags
}

# 4. Standalone Subnets
resource "azurerm_subnet" "subnet_frontend" {
  name                 = var.subnet_names[0]
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_subnet" "subnet_backend" {
  name                 = var.subnet_names[1]
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.2.0/24"]
}

import {
  to = azurerm_resource_group.rg
  id = "/subscriptions/fe7f3f41-b0fa-47c8-84f7-d5e8ae76595f/resourceGroups/cmaz-ac643e5v-mod3-rg"
}

import {
  to = azurerm_storage_account.sa
  id = "/subscriptions/fe7f3f41-b0fa-47c8-84f7-d5e8ae76595f/resourceGroups/cmaz-ac643e5v-mod3-rg/providers/Microsoft.Storage/storageAccounts/cmazac643e5vsa"
}

import {
  to = azurerm_virtual_network.vnet
  id = "/subscriptions/fe7f3f41-b0fa-47c8-84f7-d5e8ae76595f/resourceGroups/cmaz-ac643e5v-mod3-rg/providers/Microsoft.Network/virtualNetworks/cmaz-ac643e5v-mod3-vnet"
}

import {
  to = azurerm_subnet.subnet_frontend
  id = "/subscriptions/fe7f3f41-b0fa-47c8-84f7-d5e8ae76595f/resourceGroups/cmaz-ac643e5v-mod3-rg/providers/Microsoft.Network/virtualNetworks/cmaz-ac643e5v-mod3-vnet/subnets/frontend"
}

import {
  to = azurerm_subnet.subnet_backend
  id = "/subscriptions/fe7f3f41-b0fa-47c8-84f7-d5e8ae76595f/resourceGroups/cmaz-ac643e5v-mod3-rg/providers/Microsoft.Network/virtualNetworks/cmaz-ac643e5v-mod3-vnet/subnets/backend"
}