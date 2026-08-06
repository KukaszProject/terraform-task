# 1. Dedicated Subnet for Azure Firewall (Must be named 'AzureFirewallSubnet')
resource "azurerm_subnet" "firewall" {
  name                 = "AzureFirewallSubnet"
  resource_group_name  = var.rg_name
  virtual_network_name = var.vnet_name
  address_prefixes     = [var.firewall_subnet_prefix]
}

# 2. Public IP Address for Azure Firewall
resource "azurerm_public_ip" "firewall" {
  name                = var.public_ip_name
  location            = var.location
  resource_group_name = var.rg_name
  allocation_method   = "Static"
  sku                 = "Standard"

  lifecycle {
    create_before_destroy = true
  }
}

# 3. Azure Firewall
resource "azurerm_firewall" "this" {
  name                = local.afw_name
  location            = var.location
  resource_group_name = var.rg_name
  sku_name            = "AZFW_VNet"
  sku_tier            = "Standard"

  ip_configuration {
    name                 = "configuration"
    subnet_id            = azurerm_subnet.firewall.id
    public_ip_address_id = azurerm_public_ip.firewall.id
  }
}

# 4. Route Table with default route (0.0.0.0/0 -> Azure Firewall)
resource "azurerm_route_table" "aks" {
  name                = local.route_table_name
  location            = var.location
  resource_group_name = var.rg_name

  route {
    name                   = "hop-to-azure-firewall"
    address_prefix         = "0.0.0.0/0"
    next_hop_type          = "VirtualAppliance"
    next_hop_in_ip_address = azurerm_firewall.this.ip_configuration[0].private_ip_address
  }

  route {
    name           = "fw-pip-bypass"
    address_prefix = "${azurerm_public_ip.firewall.ip_address}/32"
    next_hop_type  = "Internet"
  }
}

# 5. Data Source to reference existing AKS Subnet
data "azurerm_subnet" "aks" {
  name                 = var.subnet_name
  virtual_network_name = var.vnet_name
  resource_group_name  = var.rg_name
}

# 6. Associate Route Table with existing AKS Subnet
resource "azurerm_subnet_route_table_association" "aks" {
  subnet_id      = data.azurerm_subnet.aks.id
  route_table_id = azurerm_route_table.aks.id
}

# 7. Dedicated Network Rule Collection (DNS, NTP, AKS required traffic)
resource "azurerm_firewall_network_rule_collection" "aks" {
  name                = local.net_rc_name
  azure_firewall_name = azurerm_firewall.this.name
  resource_group_name = var.rg_name
  priority            = 100
  action              = "Allow"

  dynamic "rule" {
    for_each = local.net_rules
    content {
      name                  = rule.value.name
      protocols             = rule.value.protocols
      source_addresses      = ["*"]
      destination_addresses = ["*"]
      destination_ports     = rule.value.ports
    }
  }
}

# 8. Dedicated Application Rule Collection (AKS FQDN dependencies & OS updates)
resource "azurerm_firewall_application_rule_collection" "aks" {
  name                = local.app_rc_name
  azure_firewall_name = azurerm_firewall.this.name
  resource_group_name = var.rg_name
  priority            = 200
  action              = "Allow"

  rule {
    name             = "allow-aks-fqdns"
    source_addresses = ["*"]

    target_fqdns = [
      "*.hcp.${replace(lower(var.location), " ", "")}.azmk8s.io",
      "mcr.microsoft.com",
      "*.data.mcr.microsoft.com",
      "management.azure.com",
      "login.microsoftonline.com",
      "packages.microsoft.com",
      "acs-mirror.azureedge.net"
    ]

    protocol {
      port = "443"
      type = "Https"
    }

    protocol {
      port = "80"
      type = "Http"
    }
  }
}

# 9. Dedicated NAT Rule Collection (DNAT HTTP port 80 -> NGINX Load Balancer IP)
resource "azurerm_firewall_nat_rule_collection" "aks_ingress" {
  name                = local.nat_rc_name
  azure_firewall_name = azurerm_firewall.this.name
  resource_group_name = var.rg_name
  priority            = 300
  action              = "Dnat"

  rule {
    name                  = "dnat-nginx-http"
    source_addresses      = ["*"]
    destination_addresses = [azurerm_public_ip.firewall.ip_address]
    destination_ports     = ["80"]
    translated_address    = var.aks_loadbalancer_ip
    translated_port       = "80"
    protocols             = ["TCP"]
  }
}