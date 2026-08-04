resource "random_password" "sql_pwd" {
  length           = 16
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

resource "azurerm_key_vault_secret" "sql_admin_name" {
  name         = "sql-admin-name"
  value        = var.admin_username
  key_vault_id = var.kv_id
}

resource "azurerm_key_vault_secret" "sql_admin_password" {
  name         = "sql-admin-password"
  value        = random_password.sql_pwd.result
  key_vault_id = var.kv_id
}

resource "azurerm_mssql_server" "sql" {
  name                         = var.sql_server_name
  resource_group_name          = var.rg_name
  location                     = var.location
  version                      = "12.0"
  administrator_login          = var.admin_username
  administrator_login_password = random_password.sql_pwd.result
  tags                         = var.tags
}

resource "azurerm_mssql_database" "db" {
  name      = var.sql_db_name
  server_id = azurerm_mssql_server.sql.id
  sku_name  = "S2"
  tags      = var.tags
}

resource "azurerm_mssql_firewall_rule" "allow_verification_ip" {
  name             = "allow-verification-ip"
  server_id        = azurerm_mssql_server.sql.id
  start_ip_address = var.allowed_ip_address
  end_ip_address   = var.allowed_ip_address
}

resource "azurerm_mssql_firewall_rule" "allow_azure_services" {
  name             = "allow-azure-services"
  server_id        = azurerm_mssql_server.sql.id
  start_ip_address = "0.0.0.0"
  end_ip_address   = "0.0.0.0"
}