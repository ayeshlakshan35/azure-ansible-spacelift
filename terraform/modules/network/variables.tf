variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "vnet_name" {
  description = "Name of the Virtual Network"
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