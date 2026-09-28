data "azurerm_client_config" "current" {}


module "resource_group" {
  source = "./modules/resource-group"

  resource_group_name = var.resource_group_name
  location            = var.location
}








module "network" {
  source = "./modules/network"

  resource_group_name = module.resource_group.resource_group_name
  location            = var.location

  vnet_name          = var.vnet_name
  vnet_address_space = var.vnet_address_space

  web_subnet_name             = var.web_subnet_name
  web_subnet_address_prefixes = var.web_subnet_address_prefixes

  private_subnet_name             = var.private_subnet_name
  private_subnet_address_prefixes = var.private_subnet_address_prefixes
}





module "security" {
  source = "./modules/security"

  resource_group_name = module.resource_group.resource_group_name
  location            = var.location

  web_nsg_name = var.web_nsg_name
  app_nsg_name = var.app_nsg_name
  db_nsg_name  = var.db_nsg_name
}

module "compute" {
  source = "./modules/compute"

  resource_group_name = module.resource_group.resource_group_name
  location            = var.location

  web_subnet_id     = module.network.web_subnet_id
  private_subnet_id = module.network.private_subnet_id

  web_nsg_id = module.security.web_nsg_id
  app_nsg_id = module.security.app_nsg_id
  db_nsg_id  = module.security.db_nsg_id

  admin_username = var.admin_username
  ssh_public_key = var.ssh_public_key
  vm_size        = var.vm_size
}





module "keyvault" {
  source = "./modules/keyvault"

  resource_group_name = module.resource_group.resource_group_name
  location            = var.location

  key_vault_name = var.key_vault_name
  tenant_id      = data.azurerm_client_config.current.tenant_id
}