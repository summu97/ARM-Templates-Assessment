# Azure Network Security Group (NSG) Command-Based Cheatsheet

## Create and Manage NSG

1. **Create a New NSG:**

   ```bash
   az network nsg create --resource-group <RESOURCE_GROUP> --name <NSG_NAME> --location <LOCATION>

2. **List All NSGs in a Resource Group:**

   ```bash
   az network nsg list --resource-group <RESOURCE_GROUP> --output table

3. **Show Details of a Specific NSG:**

   ```bash
   az network nsg show --resource-group <RESOURCE_GROUP> --name <NSG_NAME>

4. **Delete an NSG:**

   ```bash
   az network nsg delete --resource-group <RESOURCE_GROUP> --name <NSG_NAME>

## NSG Rules Management

1. **List All Rules in an NSG:**

   ```bash
   az network nsg rule list --resource-group <RESOURCE_GROUP> --nsg-name <NSG_NAME> --output table

2. **Create a New NSG Rule:**

   ```bash
   az network nsg rule create --resource-group <RESOURCE_GROUP> --nsg-name <NSG_NAME> --name <RULE_NAME> --priority <PRIORITY> --direction <Inbound|Outbound> --access <Allow|Deny> --protocol <Tcp|Udp|*|Icmp> --source-address-prefixes <SOURCE> --source-port-ranges <SOURCE_PORT> --destination-address-prefixes <DESTINATION> --destination-port-ranges <DESTINATION_PORT>

3. **(Example):**

   ```bash
   az network nsg rule create --resource-group myResourceGroup --nsg-name myNSG --name AllowSSH --priority 100 --direction Inbound --access Allow --protocol Tcp --source-address-prefixes '*' --source-port-ranges '*' --destination-address-prefixes '*' --destination-port-ranges 22

4. **Update an NSG Rule:**

   ```bash
   az network nsg rule update --resource-group <RESOURCE_GROUP> --nsg-name <NSG_NAME> --name <RULE_NAME> --priority <NEW_PRIORITY>

5. **Delete an NSG Rule:**

   ```bash
   az network nsg rule delete --resource-group <RESOURCE_GROUP> --nsg-name <NSG_NAME> --name <RULE_NAME>

## Associate NSG with a Subnet

1. **Associate NSG to a Subnet:**

   ```bash
   az network vnet subnet update --resource-group <RESOURCE_GROUP> --vnet-name <VNET_NAME> --name <SUBNET_NAME> --network-security-group <NSG_NAME>

2. **Disassociate NSG from a Subnet:**

   ```bash
   az network vnet subnet update --resource-group <RESOURCE_GROUP> --vnet-name <VNET_NAME> --name <SUBNET_NAME> --remove networkSecurityGroup

## Associate NSG with a Network Interface (NIC)

1. **Associate NSG to a NIC:**

   ```bash
   az network nic update --resource-group <RESOURCE_GROUP> --name <NIC_NAME> --network-security-group <NSG_NAME>

2. **Disassociate NSG from a NIC:**

   ```bash
   az network nic update --resource-group <RESOURCE_GROUP> --name <NIC_NAME> --remove networkSecurityGroup

## Diagnostic and Monitoring

1. **View Effective Security Rules for a VM NIC:**

   ```bash
   az network nic show-effective-nsg --resource-group <RESOURCE_GROUP> --name <NIC_NAME>

2. **Check NSG Flow Logs: (Enable Diagnostics First):**

   ```bash
   az network watcher flow-log configure --resource-group <RESOURCE_GROUP> --nsg <NSG_NAME> --enabled true --storage-account <STORAGE_ACCOUNT> --retention 30

3. **(View Current Flow Log Configuration):**

   ```bash
   az network watcher flow-log show --resource-group <RESOURCE_GROUP> --nsg <NSG_NAME>

## Export NSG Configuration

1. **Export NSG Details to JSON File:**

   ```bash
   az network nsg show --resource-group <RESOURCE_GROUP> --name <NSG_NAME> --output json > <OUTPUT_FILE>.json
