resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = [var.vnet_cidr]

  subnet {
    name           = var.bastion_subnet_name
    address_prefix = var.bastion_subnet_cidr
  }

  subnet {
    name           = var.vm_subnet_name
    address_prefix = var.vm_subnet_cidr
  }

  subnet {
    name           = var.appgateway_subnet_name
    address_prefix = var.appgateway_subnet_cidr
    delegation {
      name = "appGatewayDelegation"
      service_delegation {
        name = "Microsoft.Network/applicationGateways"
        actions = [
          "Microsoft.Network/virtualNetworks/subnets/action"
        ]
      }
    }
  }

  tags = {
    vnet = var.vnet_name
  }
}
