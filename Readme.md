# Azure DevOps Project Setup and Pipeline Execution

---

## Steps

### Step 01: Create Project in Azure DevOps

1. **Login to Azure DevOps**:
   - Open your browser and navigate to [Azure DevOps] -- https://dev.azure.com/.
   - Sign in with your Azure DevOps account credentials.

2. **Create a New Project**:
   - Once logged in, click on the **New Project** button.
   - Provide a **Project Name** and **Description** (optional).
   - Choose the **visibility** (Private or Public) for your project.
   - Click **Create** to generate the new project.

---

### Step 02: Add Service Connection

1. **Navigate to Project Settings**:
   - In your newly created Azure DevOps project, click on the **Project Settings** gear icon located at the bottom left of the page.

2. **Create Service Connection**:
   - Under **Project Settings**, go to the **Service connections** section.
   - Click on **New service connection** and select **Azure Resource Manager**.

3. **Configure Service Connection**:
   - In the wizard, click **Next** to proceed.
   - Select the **Subscription** under which you wish to deploy the resources.
   - Select the appropriate **Resource Group** that contains or will contain the Azure resources.
   - Provide a name for the service connection, such as `MyAzureServiceConnection`, and then click **Save** to finish the configuration.

---

### Step 03: Cloning Files from GitHub Repository

1. **Import a Repository**:
   - In your Azure DevOps project, navigate to **Repos**.
   - Click on **Import** to import a repository into your project.

2. **Enter GitHub Repository URL**:
   - In the **Import Repository** dialog, paste the URL of the repository you wish to clone:
     ``` 
     https://github.com/summu97/App-Deploy-ARM-Templates-Assessment.git
     ```
   - Click **Import** to bring the repository into your Azure DevOps project.

---

### Step 04: Create and Run Pipeline

1. **Create a Pipeline**:
   - Navigate to the **Pipelines** section of your Azure DevOps project.
   - Click on **Create Pipeline** to start a new pipeline setup.

2. **Select Repository**:
   - Choose **Azure Repos Git** as your source.
   - Select the project and repository you imported earlier.

3. **Select Existing YAML File**:
   - Choose **Existing Azure Pipelines YAML file** to link the pipeline to an existing YAML configuration.
   - Browse for the YAML file (e.g., `deploy-pipeline.yml`) in your repository and select it.

4. **Run the Pipeline**:
   - After selecting the YAML file, click **Run** to trigger the pipeline.

---

## Important Notes

- **Update Configuration File**:
   Before running the pipeline, make sure to modify the following parameters in the `deploy-pipeline.yml` & `.json` configuration files:
   - Update the **azureServiceConnection(ID)** value to reflect the newly created service connection ID.
   - Ensure **file paths**, **resourceGroupName**, and any other parameters are set to the correct values relevant to your project.

---

## Conclusion

By following these steps, you will have successfully set up a project in Azure DevOps, added a service connection, cloned a GitHub repository, and created a pipeline. The pipeline is now ready to execute tasks as defined in the YAML configuration.
