output "vnet_id" {
  description = "The ID of the created virtual network."
  value       = azurerm_virtual_network.vnet.id
}
