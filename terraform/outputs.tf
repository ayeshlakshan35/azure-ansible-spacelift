output "resource_group_name" {
  description = "Name of the Azure Resource Group"
  value       = module.resource_group.resource_group_name
}

output "vnet_name" {
  description = "Name of the Virtual Network"
  value       = module.network.vnet_name
}

output "web_public_ip" {
  description = "Public IP address of the web server"
  value       = module.compute.web_public_ip
}

output "web_private_ip" {
  description = "Private IP address of the web server"
  value       = module.compute.web_private_ip
}

output "app_private_ip" {
  description = "Private IP address of the application server"
  value       = module.compute.app_private_ip
}

output "db_private_ip" {
  description = "Private IP address of the database server"
  value       = module.compute.db_private_ip
}

output "key_vault_name" {
  description = "Name of the Azure Key Vault"
  value       = module.keyvault.key_vault_name
}

output "key_vault_uri" {
  description = "URI of the Azure Key Vault"
  value       = module.keyvault.key_vault_uri
}