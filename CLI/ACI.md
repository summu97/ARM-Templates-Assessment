# Azure Container Instances (ACI) Command-Based Cheatsheet

## Create a Container Instance
 
1. **Basic Container Creation:**

   ```bash
   az container create --resource-group <RESOURCE_GROUP> --name <CONTAINER_NAME> --image <IMAGE_NAME>

2. **Specify CPU and Memory:**

   ```bash
   az container create --resource-group <RESOURCE_GROUP> --name <CONTAINER_NAME> --image <IMAGE_NAME> --cpu <CPU_UNITS> --memory <MEMORY_IN_GB>

3. **Create a Container with Public IP and Port:**

   ```bash
   az container create --resource-group <RESOURCE_GROUP> --name <CONTAINER_NAME> --image <IMAGE_NAME> --ports <PORT> --ip-address Public

4. **Create a Container with Environment Variables:**

   ```bash
   az container create --resource-group <RESOURCE_GROUP> --name <CONTAINER_NAME> --image <IMAGE_NAME> --environment-variables KEY1=VALUE1 KEY2=VALUE2

5. **Create a Container with a Restart Policy:**

   ```bash
   az container create --resource-group <RESOURCE_GROUP> --name <CONTAINER_NAME> --image <IMAGE_NAME> --restart-policy <RestartPolicy>

(Possible values for RestartPolicy:** Always, OnFailure, Never)

## Manage Container Instances

1. **List All Container Instances in a Resource Group:**

   ```bash
   az container list --resource-group <RESOURCE_GROUP> --output table

2. **Get Details of a Specific Container:**

   ```bash
   az container show --resource-group <RESOURCE_GROUP> --name <CONTAINER_NAME>

3. **Start a Container Instance:**

   ```bash
   az container start --resource-group <RESOURCE_GROUP> --name <CONTAINER_NAME>

4. **Stop a Container Instance:**

   ```bash
   az container stop --resource-group <RESOURCE_GROUP> --name <CONTAINER_NAME>

5. **Restart a Container Instance:**

   ```bash
   az container restart --resource-group <RESOURCE_GROUP> --name <CONTAINER_NAME>

6. **Delete a Container Instance:**

   ```bash
   az container delete --resource-group <RESOURCE_GROUP> --name <CONTAINER_NAME>

## Logs and Monitoring

1. **View Logs of a Container:**

   ```bash
   az container logs --resource-group <RESOURCE_GROUP> --name <CONTAINER_NAME>

2. **Stream Logs of a Running Container:**

   ```bash
   az container logs --resource-group <RESOURCE_GROUP> --name <CONTAINER_NAME> --follow

## Attach to a Running Container

1. **Attach to a Container for Interactive Debugging:**

   ```bash
   az container attach --resource-group <RESOURCE_GROUP> --name <CONTAINER_NAME>

## Networking

1. **Create a Container with a Private VNet:**

   ```bash
   az container create --resource-group <RESOURCE_GROUP> --name <CONTAINER_NAME> --image <IMAGE_NAME> --vnet-name <VNET_NAME> --subnet <SUBNET_NAME>

## Volumes
1. **Create a Container with a Mounted Volume:**

   ```bash
   az container create --resource-group <RESOURCE_GROUP> --name <CONTAINER_NAME> --image <IMAGE_NAME> --azure-file-volume-account-name <STORAGE_ACCOUNT> --azure-file-volume-account-key <ACCOUNT_KEY> --azure-file-volume-share-name <SHARE_NAME> --azure-file-volume-mount-path <MOUNT_PATH>

## Advanced Options

1. **Deploy a Multi-Container Group:**

   ```bash
   az container create --resource-group <RESOURCE_GROUP> --name <CONTAINER_GROUP_NAME> --file <DEPLOYMENT_YAML_FILE>

2. **Add GPU Support to a Container:**

   ```bash
   az container create --resource-group <RESOURCE_GROUP> --name <CONTAINER_NAME> --image <IMAGE_NAME> --gpu-count <COUNT> --gpu-sku <SKU>

(GPU SKU Options:** K80, P100, V100)

## Diagnostic and Debugging

1. **Check the Status of a Container:**

   ```bash
   az container show --resource-group <RESOURCE_GROUP> --name <CONTAINER_NAME> --query "instanceView.state"

2. **Diagnose Networking Issues:**

   ```bash
   az container show --resource-group <RESOURCE_GROUP> --name <CONTAINER_NAME> --query "ipAddress"

## Cleanup

1. **Delete All Containers in a Resource Group:**
   ```bash
   az container delete --resource-group <RESOURCE_GROUP> --yes
