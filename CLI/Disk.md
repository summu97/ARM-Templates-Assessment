# Azure Disk Command Cheatsheet

## List Disks

1. **List all Disks in a Subscription:**

   ```bash
   az disk list --output table

2. **List Disks in a Specific Resource Group:**

   ```bash
   az disk list --resource-group <RESOURCE_GROUP_NAME> --output table

## Create a Disk

1. **Create a Managed Disk:**

   ```bash
   az disk create --resource-group <RESOURCE_GROUP_NAME> --name <DISK_NAME> --size-gb <SIZE_IN_GB> --sku <DISK_SKU>

(Disk SKUs:** Standard_LRS, Premium_LRS, StandardSSD_LRS, UltraSSD_LRS)

2. **Create a Disk from a Snapshot:**

   ```bash
   az disk create --resource-group <RESOURCE_GROUP_NAME> --name <DISK_NAME> --source <SNAPSHOT_ID>

3. **Create a Disk from a VHD:**

   ```bash
   az disk create --resource-group <RESOURCE_GROUP_NAME> --name <DISK_NAME> --source <VHD_URL>

## Attach and Detach Disks

1. **Attach a Disk to a Virtual Machine:**

   ```bash
   az vm disk attach --resource-group <RESOURCE_GROUP_NAME> --vm-name <VM_NAME> --name <DISK_NAME>

2. **Detach a Disk from a Virtual Machine:**

   ```bash
   az vm disk detach --resource-group <RESOURCE_GROUP_NAME> --vm-name <VM_NAME> --name <DISK_NAME>

## Resize a Disk

1. **Update the Size of an Existing Disk:**

   ```bash
   az disk update --resource-group <RESOURCE_GROUP_NAME> --name <DISK_NAME> --size-gb <NEW_SIZE_IN_GB>

## Snapshots

1. **Create a Snapshot of a Disk:**

   ```bash
   az snapshot create --resource-group <RESOURCE_GROUP_NAME> --name <SNAPSHOT_NAME> --source <DISK_NAME>

2. **List Snapshots:**

   ```bash
   az snapshot list --resource-group <RESOURCE_GROUP_NAME> --output table

3. **Delete a Snapshot:**

   ```bash
   az snapshot delete --resource-group <RESOURCE_GROUP_NAME> --name <SNAPSHOT_NAME>

## Delete Disks

1. **Delete a Managed Disk:**
   ```bash
   az disk delete --resource-group <RESOURCE_GROUP_NAME> --name <DISK_NAME> --yes

## Export Disks

1. **Grant Access to a Disk for Export:**

   ```bash
   az disk grant-access --resource-group <RESOURCE_GROUP_NAME> --name <DISK_NAME> --duration-in-seconds <SECONDS> --access-level Read

2. **Revoke Access to a Disk:**

   ```bash
   az disk revoke-access --resource-group <RESOURCE_GROUP_NAME> --name <DISK_NAME>

## Manage Disk Encryption

1. **Enable Disk Encryption:**

   ```bash
   az disk encryption enable --resource-group <RESOURCE_GROUP_NAME> --disk-name <DISK_NAME> --key-encryption-key <KEY_URL> --key-encryption-key-vault <VAULT_NAME>

2. **Disable Disk Encryption:**

   ```bash
   az disk encryption disable --resource-group <RESOURCE_GROUP_NAME> --disk-name <DISK_NAME>

## View Disk Details

1. **Get Disk Information:**

   ```bash
   az disk show --resource-group <RESOURCE_GROUP_NAME> --name <DISK_NAME>

## Miscellaneous

1. **Add/Update Tags on a Disk:**

   ```bash
   az disk update --resource-group <RESOURCE_GROUP_NAME> --name <DISK_NAME> --set tags.<TAG_KEY>=<TAG_VALUE>

2. **Change Disk SKU:**

   ```bash
   az disk update --resource-group <RESOURCE_GROUP_NAME> --name <DISK_NAME> --sku <NEW_SKU>
