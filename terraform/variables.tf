variable "resource_group_name" {
  description = "Name of the Azure Resource Group"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}









variable "vnet_name" {
  description = "Name of the Azure Virtual Network"
  type        = string
}

variable "vnet_address_space" {
  description = "Address space for the Virtual Network"
  type        = list(string)
}

variable "web_subnet_name" {
  description = "Name of the web subnet"
  type        = string
}

variable "web_subnet_address_prefixes" {
  description = "Address prefixes for the web subnet"
  type        = list(string)
}

variable "private_subnet_name" {
  description = "Name of the private subnet"
  type        = string
}

variable "private_subnet_address_prefixes" {
  description = "Address prefixes for the private subnet"
  type        = list(string)
}










variable "web_nsg_name" {
  description = "Name of the web NSG"
  type        = string
}

variable "app_nsg_name" {
  description = "Name of the application NSG"
  type        = string
}

variable "db_nsg_name" {
  description = "Name of the database NSG"
  type        = string
}



variable "admin_username" {
  description = "Administrator username for Azure VMs"
  type        = string
}

variable "ssh_public_key" {
  description = "SSH public key for Azure VM access"
  type        = string
}

variable "vm_size" {
  description = "Azure VM size"
  type        = string
}





variable "key_vault_name" {
  description = "Name of the Azure Key Vault"
  type        = string
}