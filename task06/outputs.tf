output "sql_server_fqdn" {
  value       = module.sql.sql_server_fqdn
  description = "The fully qualified domain name of the Azure SQL Server."
}

output "app_hostname" {
  value       = module.webapp.app_hostname
  description = "The default hostname of the Linux Web App."
}