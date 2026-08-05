resource "azurerm_resource_group" "rg" {
  name     = local.rg_name
  location = var.location
  tags     = local.common_tags
}

module "keyvault" {
  source   = "./modules/keyvault"
  name     = local.keyvault_name
  location = azurerm_resource_group.rg.location
  rg_name  = azurerm_resource_group.rg.name
  sku      = "standard"
  tags     = local.common_tags
}

module "redis" {
  source                  = "./modules/redis"
  name                    = local.redis_name
  location                = azurerm_resource_group.rg.location
  rg_name                 = azurerm_resource_group.rg.name
  capacity                = 0
  family                  = "C"
  sku                     = "Basic"
  key_vault_id            = module.keyvault.kv_id
  secret_name_hostname    = var.redis_hostname_secret
  secret_name_primary_key = var.redis_primary_key_secret
  tags                    = local.common_tags
  
  depends_on = [module.keyvault]
}

module "acr" {
  source       = "./modules/acr"
  name         = local.acr_name
  location     = azurerm_resource_group.rg.location
  rg_name      = azurerm_resource_group.rg.name
  sku          = "Standard"
  git_repo_url = var.git_repo_url
  git_pat      = var.git_pat
  image_name   = var.image_name
  tags         = local.common_tags
}

module "aks" {
  source              = "./modules/aks"
  name                = local.aks_name
  location            = azurerm_resource_group.rg.location
  rg_name             = azurerm_resource_group.rg.name
  node_pool_name      = "default"
  node_pool_count     = 1
  node_pool_size      = "Standard_B2s"
  node_pool_disk_type = "Managed"
  acr_id              = module.acr.acr_id
  key_vault_id        = module.keyvault.kv_id
  tags                = local.common_tags
}

module "aci" {
  source             = "./modules/aci"
  name               = local.aci_name
  location           = azurerm_resource_group.rg.location
  rg_name            = azurerm_resource_group.rg.name
  acr_login_server   = module.acr.login_server
  acr_admin_username = module.acr.admin_username
  acr_admin_password = module.acr.admin_password
  image_name         = var.image_name
  redis_hostname     = module.redis.redis_hostname
  redis_primary_key  = module.redis.redis_primary_key
  tags               = local.common_tags
  
  depends_on = [module.acr] 
}

# --- K8S Manifests via Kubectl Provider ---

resource "kubectl_manifest" "secret_provider" {
  yaml_body = templatefile("${path.module}/k8s-manifests/secret-provider.yaml.tftpl", {
    aks_kv_access_identity_id  = module.aks.csi_identity_client_id
    kv_name                    = module.keyvault.kv_name
    tenant_id                  = module.aks.tenant_id
    redis_url_secret_name      = var.redis_hostname_secret
    redis_password_secret_name = var.redis_primary_key_secret
  })
  
  depends_on = [module.aks]
}

resource "kubectl_manifest" "deployment" {
  yaml_body = templatefile("${path.module}/k8s-manifests/deployment.yaml.tftpl", {
    acr_login_server = module.acr.login_server
    app_image_name   = var.image_name
    image_tag        = "latest"
  })

  wait_for {
    field {
      key   = "status.availableReplicas"
      value = "1"
    }
  }
  
  depends_on = [kubectl_manifest.secret_provider]
}

resource "kubectl_manifest" "service" {
  yaml_body = file("${path.module}/k8s-manifests/service.yaml")

  wait_for {
    field {
      key        = "status.loadBalancer.ingress.[0].ip"
      value      = "^(\\d+(\\.|$)){4}"
      value_type = "regex"
    }
  }
  
  depends_on = [kubectl_manifest.deployment]
}

data "kubernetes_service" "app_service" {
  metadata {
    name = "redis-flask-app-service"
  }
  depends_on = [kubectl_manifest.service]
}