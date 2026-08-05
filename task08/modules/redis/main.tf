resource "azurerm_redis_cache" "redis" {
  name                = var.name
  location            = var.location
  resource_group_name = var.rg_name
  capacity            = var.capacity
  family              = var.family
  sku_name            = var.sku
  enable_non_ssl_port = false
  tags                = var.tags
}

resource "azurerm_key_vault_secret" "redis_hostname" {
  name         = var.secret_name_hostname
  value        = azurerm_redis_cache.redis.hostname
  key_vault_id = var.key_vault_id
}

resource "azurerm_key_vault_secret" "redis_primary_key" {
  name         = var.secret_name_primary_key
  value        = azurerm_redis_cache.redis.primary_access_key
  key_vault_id = var.key_vault_id
}