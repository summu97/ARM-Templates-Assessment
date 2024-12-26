variable "location" {
  type        = string
  description = "The Azure region where the resources will be created."
}

variable "resource_group_name" {
  type        = string
  description = "The name of the resource group where the VNet will be created."
}

variable "vnet_name" {
  type        = string
  description = "The name of the virtual network."
}

variable "vnet_cidr" {
  type        = string
  description = "The CIDR block for the virtual network."
}

variable "bastion_subnet_name" {
  type        = string
  description = "The name of the Bastion subnet."
}

variable "bastion_subnet_cidr" {
  type        = string
  description = "The CIDR block for the Bastion subnet."
}

variable "vm_subnet_name" {
  type        = string
  description = "The name of the VM subnet."
}

variable "vm_subnet_cidr" {
  type        = string
  description = "The CIDR block for the VM subnet."
}

variable "appgateway_subnet_name" {
  type        = string
  description = "The name of the Application Gateway subnet."
}

variable "appgateway_subnet_cidr" {
  type        = string
  description = "The CIDR block for the Application Gateway subnet."
}
