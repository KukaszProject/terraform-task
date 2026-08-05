resource "azurerm_container_registry" "acr" {
  name                = var.name
  resource_group_name = var.rg_name
  location            = var.location
  sku                 = var.sku
  admin_enabled       = true
  tags                = var.tags
}

resource "azurerm_container_registry_task" "build_task" {
  name                  = "${var.name}-task"
  container_registry_id = azurerm_container_registry.acr.id

  platform {
    os = "Linux"
  }

  docker_step {
    dockerfile_path      = "task08/application/Dockerfile"
    context_path         = var.git_repo_url
    context_access_token = var.git_pat
    image_names          = ["${var.image_name}:latest"]
  }

  # Integrated Schedule Trigger
  timer_trigger {
    name     = "daily-build"
    schedule = "0 0 * * *"
    enabled  = true
  }
}