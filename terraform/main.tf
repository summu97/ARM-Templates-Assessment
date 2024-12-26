provider "azurerm" {
  features {}
}

# Resource Group
module "resource_group" {
  source              = "./modules/resource_group"
  location           = var.location
  resource_group_name = var.resource_group_name  # Dynamically passed from the root
}

# Virtual Network
module "virtual_network" {
  source                     = "./modules/virtual_network"
  location                  = var.location
  vnet_name                 = var.vnet_name
  vnet_cidr                 = var.vnet_cidr
  bastion_subnet_name       = var.bastion_subnet_name
  bastion_subnet_cidr       = var.bastion_subnet_cidr
  vm_subnet_name            = var.vm_subnet_name
  vm_subnet_cidr            = var.vm_subnet_cidr
  appgateway_subnet_name    = var.appgateway_subnet_name
  appgateway_subnet_cidr    = var.appgateway_subnet_cidr
  resource_group_name       = module.resource_group.name  # Passed to the virtual network module
}

# Bastion Host
module "bastion_host" {
  source                     = "./modules/bastion_host"
  location                  = var.location
  bastion_name              = var.bastion_name
  bastion_sku               = var.bastion_sku
  bastion_scale_units       = var.bastion_scale_units
  enable_ip_connect         = var.enable_ip_connect
  enable_tunneling          = var.enable_tunneling
  enable_shareable_link     = var.enable_shareable_link
  enable_kerberos           = var.enable_kerberos
  disable_copy_paste        = var.disable_copy_paste
  enable_session_recording  = var.enable_session_recording
  enable_private_only_bastion = var.enable_private_only_bastion
  zones                     = var.zones
  public_ip_address_name    = "${var.bastion_name}-pip"
  subnet_id                 = module.virtual_network.bastion_subnet_id
  resource_group_name       = module.resource_group.name  # Passed to the bastion host module
}

output "resource_group_name" {
  value = module.resource_group.name
}

output "vnet_name" {
  value = module.virtual_network.vnet_name
}

output "bastion_host_name" {
  value = module.bastion_host.bastion_name
}
