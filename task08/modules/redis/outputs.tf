output "redis_hostname" {
  value     = azurerm_redis_cache.redis.hostname
  sensitive = true
}

output "redis_primary_key" {
  value     = azurerm_redis_cache.redis.primary_access_key
  sensitive = true
}