# Azure PowerShell Installation Guide (Windows)

## Step 1: Open PowerShell as Administrator

1. Click the **Start** button.
2. Search for **PowerShell**.
3. Right-click on **Windows PowerShell** and select **Run as Administrator**.

## Step 2: Install the Azure PowerShell Module

Run the following command to install the `Az` module:

```powershell
Install-Module -Name Az -AllowClobber -Force -Scope CurrentUser
```
## Step 3: Verify the Installation
Once the installation is complete, verify that the module has been installed by running:

```powershell
Get-Module -ListAvailable -Name Az
```
## Step 4: Import the Az Module

If the module is not automatically imported, you can import it manually by running:

```powershell
Import-Module Az
```
## Step 5: Sign in to Azure
To authenticate and connect to Azure, use the following command:

```powershell
Connect-AzAccount
```
## Step 6: Create a Resource Group
To create a new resource group, use the New-AzResourceGroup cmdlet.

```powershell
New-AzResourceGroup -Name "MyResourceGroup" -Location "EastUS"
```
## Step 7: Deploy Resources Using ARM Template

```powershell
New-AzResourceGroupDeployment -ResourceGroupName "MyResourceGroup" -TemplateFile "C:\path\to\template.json" -TemplateParameterFile "C:\path\to\parameters.json"
```
## Step 8: Check Deployment Status(Optional)
After running the command, you can check the status of the deployment using:

```powershell
Get-AzResourceGroupDeployment -ResourceGroupName "MyResourceGroup"
```
