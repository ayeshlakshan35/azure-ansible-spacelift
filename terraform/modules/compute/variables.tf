variable "resource_group_name" {
  description = "Name of the Azure Resource Group"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "web_subnet_id" {
  description = "ID of the web subnet"
  type        = string
}

variable "private_subnet_id" {
  description = "ID of the private subnet"
  type        = string
}

variable "web_nsg_id" {
  description = "ID of the web network security group"
  type        = string
}

variable "app_nsg_id" {
  description = "ID of the application network security group"
  type        = string
}

variable "db_nsg_id" {
  description = "ID of the database network security group"
  type        = string
}

variable "admin_username" {
  description = "Admin username for the virtual machines"
  type        = string
}

variable "ssh_public_key" {
  description = "SSH public key used to access the virtual machines"
  type        = string
}

variable "vm_size" {
  description = "Azure VM size"
  type        = string
}