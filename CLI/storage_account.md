# Azure Storage Account Command Cheatsheet

## List Storage Accounts
1. **List all Storage Accounts in a Subscription:**

   ```bash
   az storage account list --output table

2. **List Storage Accounts in a Specific Resource Group:**

   ```bash
   az storage account list --resource-group <RESOURCE_GROUP_NAME> --output table

## Create a Storage Account

1. **Create a General-Purpose v2 Storage Account:**

   ```bash
   az storage account create --resource-group <RESOURCE_GROUP_NAME> --name <STORAGE_ACCOUNT_NAME> --sku <SKU> --kind StorageV2 --location <LOCATION>

(SKUs:** Standard_LRS, Standard_GRS, Standard_ZRS, Premium_LRS, etc.)

2. **Create a Blob Storage Account:**

   ```bash
   az storage account create --resource-group <RESOURCE_GROUP_NAME> --name <STORAGE_ACCOUNT_NAME> --sku <SKU> --kind BlobStorage --access-tier <ACCESS_TIER>

(Access Tiers:** Hot, Cool)

## Update a Storage Account

1. **Update Tags for a Storage Account:**

   ```bash
   az storage account update --resource-group <RESOURCE_GROUP_NAME> --name <STORAGE_ACCOUNT_NAME> --tags <KEY>=<VALUE>

2. **Upgrade a Storage Account to General-Purpose v2:**

   ```bash
   az storage account update --resource-group <RESOURCE_GROUP_NAME> --name <STORAGE_ACCOUNT_NAME> --set kind=StorageV2

3. **Enable Blob Soft Delete:**

   ```bash
   az storage blob service-properties delete-policy update --account-name <STORAGE_ACCOUNT_NAME> --enable true --retention-days <DAYS>

## Delete a Storage Account

1. **Delete a Storage Account:**
   ```bash
   az storage account delete --resource-group <RESOURCE_GROUP_NAME> --name <STORAGE_ACCOUNT_NAME> --yes

## Manage Access Keys

1. **List Access Keys for a Storage Account:**

   ```bash
   az storage account keys list --resource-group <RESOURCE_GROUP_NAME> --account-name <STORAGE_ACCOUNT_NAME> --output table

2. **Regenerate an Access Key:**

   ```bash
   az storage account keys renew --resource-group <RESOURCE_GROUP_NAME> --account-name <STORAGE_ACCOUNT_NAME> --key primary

3. **Enable Azure AD Authentication for Blob Storage:**

   ```bash
   az storage account update --resource-group <RESOURCE_GROUP_NAME> --name <STORAGE_ACCOUNT_NAME> --enable-hierarchical-namespace true

## Blob Container Management

1. **Create a Blob Container:**

   ```bash
   az storage container create --account-name <STORAGE_ACCOUNT_NAME> --name <CONTAINER_NAME> --public-access <ACCESS_LEVEL>

(Access Levels:** off, blob, container)

2. **List Blob Containers:**

   ```bash
   az storage container list --account-name <STORAGE_ACCOUNT_NAME> --output table

3. **Delete a Blob Container:**

   ```bash
   az storage container delete --account-name <STORAGE_ACCOUNT_NAME> --name <CONTAINER_NAME>

## File Share Management

1. **Create a File Share:**

   ```bash
   az storage share-rm create --resource-group <RESOURCE_GROUP_NAME> --storage-account <STORAGE_ACCOUNT_NAME> --name <SHARE_NAME> --quota <QUOTA_IN_GB>

2. **List File Shares:**

   ```bash
   az storage share list --account-name <STORAGE_ACCOUNT_NAME> --output table

3. **Delete a File Share:**

   ```bash
   az storage share-rm delete --resource-group <RESOURCE_GROUP_NAME> --storage-account <STORAGE_ACCOUNT_NAME> --name <SHARE_NAME>

## Static Website Hosting

1. **Enable Static Website Hosting:**

   ```bash
   az storage blob service-properties update --account-name <STORAGE_ACCOUNT_NAME> --static-website --index-document <INDEX_DOCUMENT> --error-document <ERROR_DOCUMENT>

2. **Show Static Website Hosting Properties:**

   ```bash
   az storage blob service-properties show --account-name <STORAGE_ACCOUNT_NAME> --query "staticWebsite"

## Network and Security

1. **Add a Virtual Network Rule:**

   ```bash
   az storage account network-rule add --resource-group <RESOURCE_GROUP_NAME> --account-name <STORAGE_ACCOUNT_NAME> --vnet-name <VNET_NAME> --subnet <SUBNET_NAME>
2. **Remove a Virtual Network Rule:**

   ```bash
   az storage account network-rule remove --resource-group <RESOURCE_GROUP_NAME> --account-name <STORAGE_ACCOUNT_NAME> --vnet-name <VNET_NAME> --subnet <SUBNET_NAME>

3. **Enable Secure Transfer Required:**

   ```bash
   az storage account update --resource-group <RESOURCE_GROUP_NAME> --name <STORAGE_ACCOUNT_NAME> --enable-https-only true

## Export and Import Data

1. **Generate a Shared Access Signature (SAS):**

   ```bash
   az storage account generate-sas --permissions <PERMISSIONS> --account-name <STORAGE_ACCOUNT_NAME> --services <SERVICES> --resource-types <RESOURCE_TYPES> --expiry <EXPIRY_DATE>

(Example:** Permissions:** rw, Services:** bq, Resource Types:** co)

2. **Copy a Blob to Another Storage Account:**

   ```bash
   az storage blob copy start --destination-account-name <DEST_STORAGE_ACCOUNT> --destination-container <DEST_CONTAINER> --source-account-name <SRC_STORAGE_ACCOUNT> --source-container <SRC_CONTAINER> --source-blob <SRC_BLOB>
