provider "azurerm" {
  features {}
}

module "vnet" {
  source                  = "./modules/vnet"
  location                = var.location
  resource_group_name     = var.resource_group_name
  vnet_name               = var.vnet_name
  vnet_cidr               = var.vnet_cidr
  bastion_subnet_name     = var.bastion_subnet_name
  bastion_subnet_cidr     = var.bastion_subnet_cidr
  vm_subnet_name          = var.vm_subnet_name
  vm_subnet_cidr          = var.vm_subnet_cidr
  appgateway_subnet_name  = var.appgateway_subnet_name
  appgateway_subnet_cidr  = var.appgateway_subnet_cidr
  appgateway_name         = var.appgateway_name
}

output "vnet_id" {
  value = module.vnet.vnet_id
}
