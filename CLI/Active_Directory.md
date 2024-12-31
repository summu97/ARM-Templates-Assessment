# Microsoft Entra ID (Azure AD) Command-Based Cheatsheet

## User Management
1. **List All Users:**

   ```bash
   az ad user list --output table

2. **Get Details of a Specific User:**

   ```bash
   az ad user show --id <USER_PRINCIPAL_NAME_OR_OBJECT_ID>

3. **Create a User:**

   ```bash
   az ad user create --display-name <DISPLAY_NAME> --user-principal-name <USER_PRINCIPAL_NAME> --password <PASSWORD>

4. **Update a User:**

   ```bash
   az ad user update --id <USER_PRINCIPAL_NAME_OR_OBJECT_ID> --force-change-password-next-login true

5. **Delete a User:**

   ```bash
   az ad user delete --id <USER_PRINCIPAL_NAME_OR_OBJECT_ID>

## Group Management

1. **List All Groups:**

   ```bash
   az ad group list --output table

2. **Create a Group:**

   ```bash
   az ad group create --display-name <GROUP_NAME> --mail-nickname <GROUP_ALIAS>

3. **Add a User to a Group:**

   ```bash
   az ad group member add --group <GROUP_NAME_OR_ID> --member-id <USER_OBJECT_ID>

4. **Remove a User from a Group:**

   ```bash
   az ad group member remove --group <GROUP_NAME_OR_ID> --member-id <USER_OBJECT_ID>

5. **List Members of a Group:**

   ```bash
   az ad group member list --group <GROUP_NAME_OR_ID> --output table

6. **Delete a Group:**

   ```bash
   az ad group delete --id <GROUP_NAME_OR_ID>

## Role Assignments

1. **List All Directory Roles:**

   ```bash
   az ad role list --output table

2. **List Members of a Role:**

   ```bash
   az ad role assignment list --role <ROLE_NAME> --output table

3. **Assign a Role to a User:**

   ```bash
   az ad role assignment create --assignee <USER_OBJECT_ID> --role <ROLE_NAME>

4. **Remove a Role Assignment:**

   ```bash
   az ad role assignment delete --assignee <USER_OBJECT_ID> --role <ROLE_NAME>

## Application Management

1. **List All Applications:**

   ```bash
   az ad app list --output table

2. **Create an Application:**

   ```bash
   az ad app create --display-name <APP_NAME>

3. **Update an Application:**

   ```bash
   az ad app update --id <APP_ID> --reply-urls <NEW_REPLY_URL>

4. **Delete an Application:**

   ```bash
   az ad app delete --id <APP_ID>

## Service Principal Management

1. **List All Service Principals:**

   ```bash
   az ad sp list --output table

2. **Create a Service Principal for an Application:**

   ```bash
   az ad sp create --id <APP_ID>

3. **Create a Service Principal with a Role:**

   ```bash
   az ad sp create-for-rbac --name <SERVICE_PRINCIPAL_NAME> --role <ROLE_NAME> --scopes <SCOPE>

4. **Delete a Service Principal:**

   ```bash
   az ad sp delete --id <SP_ID>

## Password Management

1. **Reset a User Password:**

   ```bash
   az ad user update --id <USER_PRINCIPAL_NAME_OR_OBJECT_ID> --password <NEW_PASSWORD>

2. **Add a Password Credential to a Service Principal:**

   ```bash
   az ad sp credential reset --name <SP_NAME_OR_ID>

## Conditional Access

1. **List Conditional Access Policies:**

   ```bash
   az ad conditional-access policy list --output table

2. **Create a Conditional Access Policy:**

   ```bash
   az ad conditional-access policy create --name <POLICY_NAME> --state <ENABLED/DISABLED>

3. **Update a Conditional Access Policy:**

   ```bash
   az ad conditional-access policy update --name <POLICY_NAME> --state <ENABLED/DISABLED>

4. **Delete a Conditional Access Policy:**

   ```bash
   az ad conditional-access policy delete --name <POLICY_NAME>

## Miscellaneous

1. **List Azure AD Tenants:**

   ```bash
   az account tenant list --output table

2. **Switch Azure AD Tenant:**

   ```bash
   az account set --tenant <TENANT_ID>

3. **Show Information About the Current Tenant:**

   ```bash
   az ad signed-in-user show
