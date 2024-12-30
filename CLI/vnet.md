# Azure Virtual Network (VNet) Command Cheatsheet

## List Virtual Networks

1. **List all VNets in a subscription:**

   ```bash
   az network vnet list --output table

2. **List VNets in a specific Resource Group:**

   ```bash
   az network vnet list --resource-group <RESOURCE_GROUP_NAME> --output table

## Create a Virtual Network

1. **Create a VNet with a Default Subnet:**

   ```bash
   az network vnet create --resource-group <RESOURCE_GROUP_NAME> --name <VNET_NAME> --address-prefix <ADDRESS_PREFIX>

(Example Address Prefix:** 10.0.0.0/16)

2. **Create a VNet with a Custom Subnet:**

   ```bash
   az network vnet create --resource-group <RESOURCE_GROUP_NAME> --name <VNET_NAME> --address-prefix <ADDRESS_PREFIX> --subnet-name <SUBNET_NAME> --subnet-prefix <SUBNET_PREFIX>

(Example Subnet Prefix:** 10.0.1.0/24)

## Manage Subnets

1. **Create a Subnet in an Existing VNet:**

   ```bash
   az network vnet subnet create --resource-group <RESOURCE_GROUP_NAME> --vnet-name <VNET_NAME> --name <SUBNET_NAME> --address-prefix <SUBNET_PREFIX>

2. **List Subnets in a VNet:**

   ```bash
   az network vnet subnet list --resource-group <RESOURCE_GROUP_NAME> --vnet-name <VNET_NAME> --output table

3. **Delete a Subnet:**

   ```bash
   az network vnet subnet delete --resource-group <RESOURCE_GROUP_NAME> --vnet-name <VNET_NAME> --name <SUBNET_NAME>

4. **Update a Subnet with Network Security Group (NSG):**

   ```bash
   az network vnet subnet update --resource-group <RESOURCE_GROUP_NAME> --vnet-name <VNET_NAME> --name <SUBNET_NAME> --network-security-group <NSG_NAME>

## Peer Virtual Networks

1. **Create VNet Peering:**

   ```bash
   az network vnet peering create --name <PEERING_NAME> --resource-group <RESOURCE_GROUP_NAME> --vnet-name <VNET_NAME> --remote-vnet <REMOTE_VNET_ID> --allow-vnet-access

2. **List VNet Peerings:**

   ```bash
   az network vnet peering list --resource-group <RESOURCE_GROUP_NAME> --vnet-name <VNET_NAME> --output table

3. **Delete VNet Peering:**

   ```bash
   az network vnet peering delete --name <PEERING_NAME> --resource-group <RESOURCE_GROUP_NAME> --vnet-name <VNET_NAME>

## Manage VNet Settings

1. **Update VNet DNS Servers:**

   ```bash
   az network vnet update --resource-group <RESOURCE_GROUP_NAME> --name <VNET_NAME> --dns-servers <DNS_SERVER_1> <DNS_SERVER_2>

2. **Add/Update Tags on a VNet:**

   ```bash
   az network vnet update --resource-group <RESOURCE_GROUP_NAME> --name <VNET_NAME> --set tags.<TAG_KEY>=<TAG_VALUE>

3. Delete a VNet:**

   ```bash
   az network vnet delete --resource-group <RESOURCE_GROUP_NAME> --name <VNET_NAME>

## Configure VNet Security

1. **Associate a Network Security Group (NSG) with a Subnet:**

   ```bash
   az network vnet subnet update --resource-group <RESOURCE_GROUP_NAME> --vnet-name <VNET_NAME> --name <SUBNET_NAME> --network-security-group <NSG_NAME>

2. **Add a Service Endpoint to a Subnet:**

   ```bash
   az network vnet subnet update --resource-group <RESOURCE_GROUP_NAME> --vnet-name <VNET_NAME> --name <SUBNET_NAME> --service-endpoints <SERVICE>

(Example Service:** Microsoft.Sql, Microsoft.Storage)

## Export VNet Template

1. **Export a VNet as a Template:**
   
   ```bash
   az network vnet show --resource-group <RESOURCE_GROUP_NAME> --name <VNET_NAME> --query "{name:**name, location:**location, addressSpace:**addressSpace}" > vnet-template.json

## Troubleshooting and Monitoring

1. **Check Effective Routes for a VM in a Subnet:**

   ```bash
   az network nic show-effective-route-table --resource-group <RESOURCE_GROUP_NAME> --name <NIC_NAME> --output table

2. **Check Effective Security Rules for a VM:**

   ```bash
   az network nic show-effective-nsg --resource-group <RESOURCE_GROUP_NAME> --name <NIC_NAME>

## Miscellaneous

1. **Enable DDoS Protection on a VNet:**

   ```bash
   az network vnet update --resource-group <RESOURCE_GROUP_NAME> --name <VNET_NAME> --ddos-protection true --ddos-protection-plan <DDOS_PLAN_ID>

2. **List Available Address Prefixes in a VNet:**

   ```bash
   az network vnet list-available-ips --resource-group <RESOURCE_GROUP_NAME> --name <VNET_NAME>
