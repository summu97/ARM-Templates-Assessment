# Azure App Services Command Cheatsheet

## General App Service Commands

1. **List all App Services:**

   ```bash
   az webapp list --output table

2. **Get details of an App Service:**

   ```bash
   az webapp show --resource-group <RESOURCE_GROUP> --name <APP_SERVICE_NAME>

3. **Delete an App Service:**

   ```bash
   az webapp delete --resource-group <RESOURCE_GROUP> --name <APP_SERVICE_NAME>

## Create and Manage App Services

1. **Create an App Service Plan:**

   ```bash
   az appservice plan create --name <APP_PLAN_NAME> --resource-group <RESOURCE_GROUP> --sku <SKU> --is-linux
(Common SKUs: F1 (Free), B1 (Basic), P1v2 (Premium))

2. **Create a Web App:**

   ```bash
   az webapp create --name <APP_SERVICE_NAME> --resource-group <RESOURCE_GROUP> --plan <APP_PLAN_NAME>

3. **Create a Web App with Docker:**

   ```bash
   az webapp create --name <APP_SERVICE_NAME> --resource-group <RESOURCE_GROUP> --plan <APP_PLAN_NAME> --deployment-container-image-name <IMAGE_NAME>

## Configure App Services

1. **Set Environment Variables:**

   ```bash
   az webapp config appsettings set --resource-group <RESOURCE_GROUP> --name <APP_SERVICE_NAME> --settings KEY1=VALUE1 KEY2=VALUE2

2. **Get Environment Variables:**

   ```bash
   az webapp config appsettings list --resource-group <RESOURCE_GROUP> --name <APP_SERVICE_NAME>

3. **Configure Custom Domain:**

   ```bash
   az webapp config hostname add --resource-group <RESOURCE_GROUP> --webapp-name <APP_SERVICE_NAME> --hostname <CUSTOM_DOMAIN>

4. **Enable HTTPS:**

   ```bash
   az webapp update --resource-group <RESOURCE_GROUP> --name <APP_SERVICE_NAME> --https-only true

## Deployment Management

1. **Deploy using a Git Repository:**

   ```bash
   az webapp deployment source config --name <APP_SERVICE_NAME> --resource-group <RESOURCE_GROUP> --repo-url <REPO_URL> --branch <BRANCH_NAME>

2. **Set Deployment User:**

   ```bash
   az webapp deployment user set --user-name <USERNAME> --password <PASSWORD>

3. **Get Deployment Logs:**

   ```bash
   az webapp log tail --name <APP_SERVICE_NAME> --resource-group <RESOURCE_GROUP>

## Scaling and Monitoring

1. **Scale App Service Plan:**

   ```bash
   az appservice plan update --name <APP_PLAN_NAME> --resource-group <RESOURCE_GROUP> --sku <NEW_SKU>

2. **Enable Logging:**

   ```bash
   az webapp log config --name <APP_SERVICE_NAME> --resource-group <RESOURCE_GROUP> --application-logging true --web-server-logging filesystem

3. **Monitor Performance:**

   ```bash
   az monitor metrics list --resource <RESOURCE_ID> --metric <METRIC_NAME>

## Backup and Restore

1. **Create a Backup:**

   ```bash
   az webapp config backup create --resource-group <RESOURCE_GROUP> --webapp-name <APP_SERVICE_NAME> --container-url <STORAGE_CONTAINER_URL>

2. **List Backups:**

   ```bash
   az webapp config backup list --resource-group <RESOURCE_GROUP> --webapp-name <APP_SERVICE_NAME>

3. **Restore a Backup:**

   ```bash
   az webapp config backup restore --resource-group <RESOURCE_GROUP> --webapp-name <APP_SERVICE_NAME> --backup-name <BACKUP_NAME>

## Miscellaneous

1. **Restart an App Service:**

   ```bash
   az webapp restart --name <APP_SERVICE_NAME> --resource-group <RESOURCE_GROUP>

2. **Stop an App Service:**

   ```bash
   az webapp stop --name <APP_SERVICE_NAME> --resource-group <RESOURCE_GROUP>

3. **Start an App Service:**

   ```bash
   az webapp start --name <APP_SERVICE_NAME> --resource-group <RESOURCE_GROUP>
