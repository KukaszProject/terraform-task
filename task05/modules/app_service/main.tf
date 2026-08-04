resource "azurerm_windows_web_app" "app" {
  name                = var.name
  location            = var.location
  resource_group_name = var.rg_name
  service_plan_id     = var.asp_id
  tags                = var.tags

  site_config {
    ip_restriction_default_action = "Deny"

    dynamic "ip_restriction" {
      for_each = var.ip_restrictions
      content {
        name        = ip_restriction.value.name
        ip_address  = ip_restriction.value.ip_address
        service_tag = ip_restriction.value.service_tag
        action      = "Allow"
        priority    = ip_restriction.value.priority
      }
    }
  }
}