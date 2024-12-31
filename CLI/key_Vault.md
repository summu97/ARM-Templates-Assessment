# Azure Key Vault Command-Based Cheatsheet

## Key Vault Management

1. **List All Key Vaults in a Subscription:**

   ```bash
   az keyvault list --output table

2. **List All Key Vaults in a Specific Resource Group:**

   ```bash
   az keyvault list --resource-group <RESOURCE_GROUP_NAME> --output table

3. **Create a Key Vault:**

   ```bash
   az keyvault create --name <KEY_VAULT_NAME> --resource-group <RESOURCE_GROUP_NAME> --location <LOCATION>

4. **Delete a Key Vault:**

   ```bash
   az keyvault delete --name <KEY_VAULT_NAME>

## Secret Management

1. **List All Secrets in a Key Vault:**

   ```bash
   az keyvault secret list --vault-name <KEY_VAULT_NAME> --output table

2. **Set a Secret:**

   ```bash
   az keyvault secret set --vault-name <KEY_VAULT_NAME> --name <SECRET_NAME> --value <SECRET_VALUE>

3. **Get a Secret:**

   ```bash
   az keyvault secret show --vault-name <KEY_VAULT_NAME> --name <SECRET_NAME>

4. **Delete a Secret:**

   ```bash
   az keyvault secret delete --vault-name <KEY_VAULT_NAME> --name <SECRET_NAME>

5. **Backup a Secret:**

   ```bash
   az keyvault secret backup --vault-name <KEY_VAULT_NAME> --name <SECRET_NAME> --file <BACKUP_FILE_PATH>

6. **Restore a Secret from Backup:**

   ```bash
   az keyvault secret restore --vault-name <KEY_VAULT_NAME> --file <BACKUP_FILE_PATH>

## Key Management

1. **List All Keys in a Key Vault:**

   ```bash
   az keyvault key list --vault-name <KEY_VAULT_NAME> --output table

2. **Create a Key:**

   ```bash
   az keyvault key create --vault-name <KEY_VAULT_NAME> --name <KEY_NAME> --protection software

3. **Get a Key:**

   ```bash
   az keyvault key show --vault-name <KEY_VAULT_NAME> --name <KEY_NAME>

4. **Delete a Key:**

   ```bash
   az keyvault key delete --vault-name <KEY_VAULT_NAME> --name <KEY_NAME>

5. **Backup a Key:**

   ```bash
   az keyvault key backup --vault-name <KEY_VAULT_NAME> --name <KEY_NAME> --file <BACKUP_FILE_PATH>

6. **Restore a Key from Backup:**

   ```bash
   az keyvault key restore --vault-name <KEY_VAULT_NAME> --file <BACKUP_FILE_PATH>

## Certificate Management

1. **List All Certificates in a Key Vault:**

   ```bash
   az keyvault certificate list --vault-name <KEY_VAULT_NAME> --output table

2. **Create a Certificate:**

   ```bash
   az keyvault certificate create --vault-name <KEY_VAULT_NAME> --name <CERTIFICATE_NAME> --policy @<POLICY_JSON_FILE>

3. **Get a Certificate:**

   ```bash
   az keyvault certificate show --vault-name <KEY_VAULT_NAME> --name <CERTIFICATE_NAME>

4. **Delete a Certificate:**

   ```bash
   az keyvault certificate delete --vault-name <KEY_VAULT_NAME> --name <CERTIFICATE_NAME>

5. **Backup a Certificate:**

   ```bash
   az keyvault certificate backup --vault-name <KEY_VAULT_NAME> --name <CERTIFICATE_NAME> --file <BACKUP_FILE_PATH>

6. **Restore a Certificate from Backup:**

   ```bash
   az keyvault certificate restore --vault-name <KEY_VAULT_NAME> --file <BACKUP_FILE_PATH>

## Access Policies

1. **List Access Policies for a Key Vault:**

   ```bash
   az keyvault show --name <KEY_VAULT_NAME> --query "properties.accessPolicies"

2. **Add an Access Policy:**

   ```bash
   az keyvault set-policy --name <KEY_VAULT_NAME> --object-id <OBJECT_ID> --secret-permissions <PERMISSIONS> --key-permissions <PERMISSIONS> --certificate-permissions <PERMISSIONS>

(Permissions Examples:** get, list, set, delete, backup, restore)

3. **Remove an Access Policy:**

   ```bash
   az keyvault delete-policy --name <KEY_VAULT_NAME> --object-id <OBJECT_ID>

## Network and Security

1. **Enable Private Endpoints for Key Vault:**

   ```bash
   az keyvault update --name <KEY_VAULT_NAME> --enable-soft-delete true --enable-rbac-authorization true

2. **Add a Virtual Network Rule:**

   ```bash
   az keyvault network-rule add --name <KEY_VAULT_NAME> --vnet-name <VNET_NAME> --subnet <SUBNET_NAME>

3. **Remove a Virtual Network Rule:**

   ```bash
   az keyvault network-rule remove --name <KEY_VAULT_NAME> --vnet-name <VNET_NAME> --subnet <SUBNET_NAME>

## Enable Soft-Delete and Purge Protection

1. **Enable Soft Delete:**

   ```bash
   az keyvault update --name <KEY_VAULT_NAME> --enable-soft-delete true

2. **Enable Purge Protection:**

   ```bash
   az keyvault update --name <KEY_VAULT_NAME> --enable-purge-protection true
