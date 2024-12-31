# Azure Resource Group Command Cheatsheet

## List Resource Groups

1. **List all Resource Groups:**

   ```bash
   az group list --output table

2. **List Resource Groups with a specific tag:*

   ```bash
   az group list --tag <TAG_NAME>=<TAG_VALUE> --output table

## Create and Delete Resource Groups

1. **Create a Resource Group:**

   ```bash
   az group create --name <RESOURCE_GROUP_NAME> --location <LOCATION>

(Example Locations: eastus, westus, centralindia)

2. **Delete a Resource Group:**

   ```bash
   az group delete --name <RESOURCE_GROUP_NAME> --yes --no-wait

(Add --no-wait to avoid waiting for completion.)

## Get Details of a Resource Group

1. **Show Details of a Resource Group:**

   ```bash
   az group show --name <RESOURCE_GROUP_NAME>

2. **Check if a Resource Group Exists:**

   ```bash
   az group exists --name <RESOURCE_GROUP_NAME>

## Manage Tags

1. **Add/Update Tags to a Resource Group:**

   ```bash
   az group update --name <RESOURCE_GROUP_NAME> --set tags.<TAG_NAME>=<TAG_VALUE>

2. **Remove a Tag from a Resource Group:**

   ```bash
   az group update --name <RESOURCE_GROUP_NAME> --remove tags.<TAG_NAME>

3. **Clear All Tags from a Resource Group:**

   ```bash
   az group update --name <RESOURCE_GROUP_NAME> --set tags={}

## Export Resource Group Template

1. **Export a Resource Group’s Deployment Template:**

   ```bash
   az group export --name <RESOURCE_GROUP_NAME> --output json > exported-template.json

## Lock Resource Groups

1. **Add a Lock to Prevent Deletion:**

   ```bash
   az lock create --name <LOCK_NAME> --resource-group <RESOURCE_GROUP_NAME> --lock-type CanNotDelete

2. **List Locks on a Resource Group:**

   ```bash
   az lock list --resource-group <RESOURCE_GROUP_NAME>

3. **Delete a Lock:**

   ```bash
   az lock delete --name <LOCK_NAME> --resource-group <RESOURCE_GROUP_NAME>


## Manage Resource Group Deployments
1. **List All Deployments in a Resource Group:**

   ```bash
   az deployment group list --resource-group <RESOURCE_GROUP_NAME>

2. **View a Specific Deployment:**

   ```bash
   az deployment group show --resource-group <RESOURCE_GROUP_NAME> --name <DEPLOYMENT_NAME>

3. **Delete a Deployment:**

   ```bash
   az deployment group delete --resource-group <RESOURCE_GROUP_NAME> --name <DEPLOYMENT_NAME>

## Monitor Resource Group Activity

1. **View Resource Group Usage:**

   ```bash
   az resource list --resource-group <RESOURCE_GROUP_NAME> --output table

2. **List Resource Group Operations:**

   ```bash
   az monitor activity-log list --resource-group <RESOURCE_GROUP_NAME> --output table

## Miscellaneous

1. **Move Resources to Another Resource Group:**

   ```bash
   az resource move --destination-group <NEW_RESOURCE_GROUP> --ids <RESOURCE_ID_1> <RESOURCE_ID_2>

2. **Delete All Resources in a Resource Group:**

   ```bash
   az resource delete --resource-group <RESOURCE_GROUP_NAME> --name <RESOURCE_NAME> --resource-type <RESOURCE_TYPE>
