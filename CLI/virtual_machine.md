# Azure Virtual Machine Command Cheatsheet

## List Virtual Machines

1. **List all VMs in a subscription:**

   ```bash
   az vm list --output table

2. **List VMs in a specific Resource Group:**

   ```bash
   az vm list --resource-group <RESOURCE_GROUP_NAME> --output table

## Create Virtual Machines
1. **Create a Basic Linux VM:**

   ```bash
   az vm create --resource-group <RESOURCE_GROUP_NAME> --name <VM_NAME> --image <IMAGE> --admin-username <USERNAME> --generate-ssh-keys

(Common Images:** UbuntuLTS, Debian, CentOS, RedHat, etc.)

2. **Create a Basic Windows VM:**

   ```bash
   az vm create --resource-group <RESOURCE_GROUP_NAME> --name <VM_NAME> --image <IMAGE> --admin-username <USERNAME> --admin-password <PASSWORD>

(Common Images:** Win2022Datacenter, Win2019Datacenter, etc.)

3. **Create a VM with a Specific Size:**

   ```bash
   az vm create --resource-group <RESOURCE_GROUP_NAME> --name <VM_NAME> --image <IMAGE> --size <VM_SIZE>

(Example Sizes:** Standard_B2s, Standard_D2s_v3, etc.)

## Start, Stop, and Restart Virtual Machines

1. **Start a VM:**

   ```bash
   az vm start --resource-group <RESOURCE_GROUP_NAME> --name <VM_NAME>

2. **Stop (Deallocate) a VM:**

   ```bash
   az vm stop --resource-group <RESOURCE_GROUP_NAME> --name <VM_NAME>

3. **Restart a VM:**

   ```bash
   az vm restart --resource-group <RESOURCE_GROUP_NAME> --name <VM_NAME>

4. **Deallocate a VM (release resources):**

   ```bash
   az vm deallocate --resource-group <RESOURCE_GROUP_NAME> --name <VM_NAME>

## Manage VM Configuration

1. **Resize a VM:**

   ```bash
   az vm resize --resource-group <RESOURCE_GROUP_NAME> --name <VM_NAME> --size <NEW_VM_SIZE>

2. **Attach a Data Disk to a VM:**

   ```bash
   az vm disk attach --resource-group <RESOURCE_GROUP_NAME> --vm-name <VM_NAME> --name <DISK_NAME>

3. **Detach a Data Disk:**

   ```bash
   az vm disk detach --resource-group <RESOURCE_GROUP_NAME> --vm-name <VM_NAME> --name <DISK_NAME>

4. **Add/Update Tags on a VM:**

   ```bash
   az vm update --resource-group <RESOURCE_GROUP_NAME> --name <VM_NAME> --set tags.<TAG_KEY>=<TAG_VALUE>

## Manage VM Networking

1. **Show Network Interface Information:**

   ```bash
   az network nic show --ids $(az vm show --resource-group <RESOURCE_GROUP_NAME> --name <VM_NAME> --query 'networkProfile.networkInterfaces[0].id' -o tsv)

2. Add a Public IP Address:**

   ```bash
   az network public-ip create --resource-group <RESOURCE_GROUP_NAME> --name <PUBLIC_IP_NAME>
   az network nic update --ids $(az vm show --resource-group <RESOURCE_GROUP_NAME> --name <VM_NAME> --query "networkProfile.networkInterfaces[0].id" -o tsv) --add ipConfigurations[0].publicIpAddress.id=$(az network public-ip show --resource-group <RESOURCE_GROUP_NAME> --name <PUBLIC_IP_NAME> --query id -o tsv)

3. **Remove a Public IP Address:**

   ```bash
   az network nic ip-config update --resource-group <RESOURCE_GROUP_NAME> --nic-name <NIC_NAME> --name <IP_CONFIG_NAME> --remove publicIpAddress

## Monitor and Debug VMs

1. **Get VM Status:**

   ```bash
   az vm get-instance-view --resource-group <RESOURCE_GROUP_NAME> --name <VM_NAME> --query instanceView.statuses -o table

2. **Enable Boot Diagnostics:**

   ```bash
   az vm boot-diagnostics enable --resource-group <RESOURCE_GROUP_NAME> --name <VM_NAME> --storage <STORAGE_ACCOUNT_NAME>

3. **View Boot Diagnostics:**

   ```bash
   az vm boot-diagnostics get-boot-log --resource-group <RESOURCE_GROUP_NAME> --name <VM_NAME>

## Delete Virtual Machines

1. **Delete a VM:**

   ```bash
   az vm delete --resource-group <RESOURCE_GROUP_NAME> --name <VM_NAME> --yes

2. **Delete All Associated Resources:**

   ```bash
   az resource delete --ids $(az vm show --resource-group <RESOURCE_GROUP_NAME> --name <VM_NAME> --query 'id' -o tsv)

## Export and Clone VMs

1. **Export VM Template:**

   ```bash
   az vm export --resource-group <RESOURCE_GROUP_NAME> --name <VM_NAME> --output json > vm-template.json

2. **Clone a VM from Template:**

   ```bash
   az deployment group create --resource-group <RESOURCE_GROUP_NAME> --template-file vm-template.json

## Miscellaneous

1. **Update VM OS Disk Size:**

   ```bash
   az vm update --resource-group <RESOURCE_GROUP_NAME> --name <VM_NAME> --set storageProfile.osDisk.diskSizeGb=<SIZE_IN_GB>

2. **Run a Command on a VM:**

   ```bash
   az vm run-command invoke --command-id RunShellScript --name <VM_NAME> --resource-group
