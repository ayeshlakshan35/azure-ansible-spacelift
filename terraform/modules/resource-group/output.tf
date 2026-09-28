output "resource_group_name" {
  description = "Name of the resource group"
  value       = azurerm_resource_group.this.name
}

output "resource_group_id" {
  description = "id of the azure resource group"
  value       = azurerm_resource_group.this.id
}

output "location" {
  description = "location of the azure resource group"
  value       = azurerm_resource_group.this.location
}