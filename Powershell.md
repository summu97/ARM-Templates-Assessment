# Azure PowerShell Installation Guide (Windows)

## Step 1: Open PowerShell as Administrator

1. Click the **Start** button.
2. Search for **PowerShell**.
3. Right-click on **Windows PowerShell** and select **Run as Administrator**.

## Step 2: Install the Azure PowerShell Module

Run the following command to install the `Az` module:

```powershell
Install-Module -Name Az -AllowClobber -Force -Scope CurrentUser


