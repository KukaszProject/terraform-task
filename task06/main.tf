data "azurerm_key_vault" "existing_kv" {
  name                = var.kv_name
  resource_group_name = var.kv_rg_name
}

resource "azurerm_resource_group" "rg" {
  name     = local.rg_name
  location = var.region
  tags     = var.tags
}

module "sql" {
  source = "./modules/sql"

  rg_name            = azurerm_resource_group.rg.name
  location           = azurerm_resource_group.rg.location
  sql_server_name    = local.sql_server_name
  sql_db_name        = local.sql_db_name
  admin_username     = var.sql_admin_username
  kv_id              = data.azurerm_key_vault.existing_kv.id
  allowed_ip_address = var.allowed_ip_address
  tags               = var.tags
}

module "webapp" {
  source = "./modules/webapp"

  rg_name               = azurerm_resource_group.rg.name
  location              = azurerm_resource_group.rg.location
  asp_name              = local.asp_name
  app_name              = local.app_name
  sql_connection_string = module.sql.sql_connection_string
  tags                  = var.tags
}
