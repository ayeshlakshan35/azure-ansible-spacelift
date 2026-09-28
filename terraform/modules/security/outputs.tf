output "web_nsg_id" {
  description = "ID of the web NSG"
  value       = azurerm_network_security_group.web.id
}

output "app_nsg_id" {
  description = "ID of the application NSG"
  value       = azurerm_network_security_group.app.id
}

output "db_nsg_id" {
  description = "ID of the database NSG"
  value       = azurerm_network_security_group.db.id
}