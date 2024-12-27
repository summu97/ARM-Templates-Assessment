Prerequesites: SubscriptionID, Resource group(name: adq-appdeploy-rg)
--
Steps:
Step01: Create project
* Login to your Azure DevOps: "https://dev.azure.com/"
* Create new project

Step02: Add Service connection
* Project Settings--Service connections--Create service connection--Azure Resource Manager--Next--Select your Subscription--Select Resource group--Give Service connect name--Save.

Step03: Cloning files
* Import a repository--Import--https://github.com/summu97/ARM-Templates-Assessment.git --Import.

Step04: Create Pipeline
* Create Pipeline--Azure Repos Git--Select your project--Existing Azure Pipelines YAML file--Select your pipeline--Run.

NOTE: Make sure to change azureServiceConnection(ID) value, file paths, resourceGroupName, etc parameters values in "azure-pipeline.json" file.
--
