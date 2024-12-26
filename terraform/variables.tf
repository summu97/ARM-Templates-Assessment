variable "location" {
  type        = string
  default     = "centralus"
  description = "The Azure region where the resources will be created."
}

variable "resource_group_name" {
  type        = string
  default     = "adq-appdeploy-rg"
  description = "The name of the resource group where the resources will be created."
}

variable "vnet_name" {
  type        = string
  default     = "adq-az-vnet"
  description = "The name of the virtual network."
}

variable "vnet_cidr" {
  type        = string
  default     = "10.0.0.0/16"
  description = "The CIDR block for the virtual network."
}

variable "bastion_subnet_name" {
  type        = string
  default     = "AzureBastionSubnet"
  description = "The name of the Bastion subnet."
}

variable "bastion_subnet_cidr" {
  type        = string
  default     = "10.0.1.0/26"
  description = "The CIDR block for the Bastion subnet."
}

variable "vm_subnet_name" {
  type        = string
  default     = "VM-Subnet"
  description = "The name of the VM subnet."
}

variable "vm_subnet_cidr" {
  type        = string
  default     = "10.0.2.0/24"
  description = "The CIDR block for the VM subnet."
}

variable "appgateway_subnet_name" {
  type        = string
  default     = "AppGateway-Subnet"
  description = "The name of the Application Gateway subnet."
}

variable "appgateway_subnet_cidr" {
  type        = string
  default     = "10.0.3.0/24"
  description = "The CIDR block for the Application Gateway subnet."
}

variable "appgateway_name" {
  type        = string
  default     = "adq-az-appgateway"
  description = "The name of the application gateway."
}
