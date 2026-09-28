output "web_public_ip" {
  description = "Public IP address of the web server"
  value       = azurerm_public_ip.web.ip_address
}

output "web_private_ip" {
  description = "Private IP address of the web server"
  value       = azurerm_network_interface.web.private_ip_address
}

output "app_private_ip" {
  description = "Private IP address of the application server"
  value       = azurerm_network_interface.app.private_ip_address
}

output "db_private_ip" {
  description = "Private IP address of the database server"
  value       = azurerm_network_interface.db.private_ip_address
}