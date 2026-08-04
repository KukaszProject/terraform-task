resource "azurerm_windows_web_app" "app" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location
  service_plan_id     = var.service_plan_id
  tags                = var.tags

  site_config {
    application_stack {
      dotnet_version = "v8.0"
    }

    ip_restriction_default_action = "Deny"

    dynamic "ip_restriction" {
      for_each = var.ip_restrictions
      content {
        name        = ip_restriction.value.name
        ip_address  = ip_restriction.value.ip_address
        service_tag = ip_restriction.value.service_tag
        action      = ip_restriction.value.action
        priority    = ip_restriction.value.priority
      }
    }
  }
}