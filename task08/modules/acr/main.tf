resource "azurerm_container_registry" "acr" {
  name                = var.name
  resource_group_name = var.rg_name
  location            = var.location
  sku                 = var.sku

  # ACI requires admin credentials to pull the image using image_registry_credential
  admin_enabled = true

  tags = var.tags
}

resource "azurerm_container_registry_task" "acr_task" {
  name                  = "${var.name}-task"
  container_registry_id = azurerm_container_registry.acr.id

  platform {
    os           = "Linux"
    architecture = "amd64"
  }

  docker_step {
    # The URL to your Git repository (e.g., https://github.com/youruser/yourrepo.git#main)
    context_path         = var.git_repo_url
    context_access_token = var.git_pat

    # Path to the Dockerfile relative to the repository root
    dockerfile_path = "task08/application/Dockerfile"

    image_names = ["${var.image_name}:latest"]
  }
}

resource "azurerm_container_registry_task_schedule_run_now" "acr_task_run" {
  container_registry_task_id = azurerm_container_registry_task.acr_task.id
}