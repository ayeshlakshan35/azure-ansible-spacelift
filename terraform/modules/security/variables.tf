variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "web_nsg_name" {
  description = "Name of the web tier NSG"
  type        = string
}

variable "app_nsg_name" {
  description = "Name of the application tier NSG"
  type        = string
}

variable "db_nsg_name" {
  description = "Name of the database tier NSG"
  type        = string
}