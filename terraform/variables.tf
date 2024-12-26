variable "location" {
  description = "The Azure region where the resources will be created."
  default     = "centralus"
}

variable "resource_group_name" {
  description = "The name of the resource group."
  default     = "adq-az-rg"  # Default value if not provided
}

variable "vnet_name" {
  description = "The name of the virtual network."
  default     = "adq-az-vnet"
}

variable "vnet_cidr" {
  description = "The CIDR block for the virtual network."
  default     = "10.0.0.0/16"
}

variable "bastion_subnet_name" {
  description = "The name of the Bastion subnet."
  default     = "AzureBastionSubnet"
}

variable "bastion_subnet_cidr" {
  description = "The CIDR block for the Bastion subnet."
  default     = "10.0.1.0/26"
}

variable "vm_subnet_name" {
  description = "The name of the VM subnet."
  default     = "VM-Subnet"
}

variable "vm_subnet_cidr" {
  description = "The CIDR block for the VM subnet."
  default     = "10.0.2.0/24"
}

variable "appgateway_subnet_name" {
  description = "The name of the Application Gateway subnet."
  default     = "AppGateway-Subnet"
}

variable "appgateway_subnet_cidr" {
  description = "The CIDR block for the Application Gateway subnet."
  default     = "10.0.3.0/24"
}

variable "bastion_name" {
  description = "The name of the Bastion host."
  default     = "adq-az-bastion"
}

variable "bastion_sku" {
  description = "The SKU for the Bastion host."
  default     = "Standard_B1MS"
}

variable "bastion_scale_units" {
  description = "The number of Bastion host scale units."
  default     = 1
}

variable "enable_ip_connect" {
  description = "Enable IP Connect for Bastion."
  default     = true
}

variable "enable_tunneling" {
  description = "Enable tunneling for Bastion."
  default     = true
}

variable "enable_shareable_link" {
  description = "Enable shareable link for Bastion."
  default     = false
}

variable "enable_kerberos" {
  description = "Enable Kerberos authentication."
  default     = false
}

variable "disable_copy_paste" {
  description = "Disable copy-paste functionality in Bastion."
  default     = true
}

variable "enable_session_recording" {
  description = "Enable session recording in Bastion."
  default     = false
}

variable "enable_private_only_bastion" {
  description = "Enable private only Bastion."
  default     = false
}

variable "zones" {
  description = "The availability zones for the resources."
  type        = list(string)
  default     = ["1", "2"]
}
