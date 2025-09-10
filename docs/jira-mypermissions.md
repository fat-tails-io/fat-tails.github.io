---
title: My Permissions
description: |-
  Returns a list of permissions indicating which permissions the user has. Details of the user's permissions can be obtained in a global, project, issue or comment context.
  
  The user is reported as having a project permission:
  
   *  in the global context, if the user has the project permission in any project.
   *  for a project, where the project permission is determined using issue data, if the user meets the permission's criteria for any issue in the project. Otherwise, if the user has the project permission in the project.
   *  for an issue, where a project permission is determined using issue data, if the user has the permission in the issue. Otherwise, if the user has the project permission in the project containing the issue.
   *  for a comment, where the user has both the permission to browse the comment and the project permission for the comment's parent issue. Only the BROWSE\_PROJECTS permission is supported. If a `commentId` is provided whose `permissions` does not equal BROWSE\_PROJECTS, a 400 error will be returned.
  
  This means that users may be shown as having an issue permission (such as EDIT\_ISSUES) in the global context or a project context but may not have the permission for any or all issues. For example, if Reporters have the EDIT\_ISSUES permission a user would be shown as having this permission in the global context or the context of a project, because any user can be a reporter. However, if they are not the user who reported the issue queried they would not have EDIT\_ISSUES permission for that issue.
  
  For [Jira Service Management project permissions](https://support.atlassian.com/jira-cloud-administration/docs/customize-jira-service-management-permissions/), this will be evaluated similarly to a user in the customer portal. For example, if the BROWSE\_PROJECTS permission is granted to Service Project Customer - Portal Access, any users with access to the customer portal will have the BROWSE\_PROJECTS permission.
  
  Global permissions are unaffected by context.
  
  This operation can be accessed anonymously.
  
  **[Permissions](#permissions) required:** None.
nav_order: 999
published: false
---

# My Permissions

## API Description
Returns a list of permissions indicating which permissions the user has. Details of the user's permissions can be obtained in a global, project, issue or comment context.

The user is reported as having a project permission:

 *  in the global context, if the user has the project permission in any project.
 *  for a project, where the project permission is determined using issue data, if the user meets the permission's criteria for any issue in the project. Otherwise, if the user has the project permission in the project.
 *  for an issue, where a project permission is determined using issue data, if the user has the permission in the issue. Otherwise, if the user has the project permission in the project containing the issue.
 *  for a comment, where the user has both the permission to browse the comment and the project permission for the comment's parent issue. Only the BROWSE\_PROJECTS permission is supported. If a `commentId` is provided whose `permissions` does not equal BROWSE\_PROJECTS, a 400 error will be returned.

This means that users may be shown as having an issue permission (such as EDIT\_ISSUES) in the global context or a project context but may not have the permission for any or all issues. For example, if Reporters have the EDIT\_ISSUES permission a user would be shown as having this permission in the global context or the context of a project, because any user can be a reporter. However, if they are not the user who reported the issue queried they would not have EDIT\_ISSUES permission for that issue.

For [Jira Service Management project permissions](https://support.atlassian.com/jira-cloud-administration/docs/customize-jira-service-management-permissions/), this will be evaluated similarly to a user in the customer portal. For example, if the BROWSE\_PROJECTS permission is granted to Service Project Customer - Portal Access, any users with access to the customer portal will have the BROWSE\_PROJECTS permission.

Global permissions are unaffected by context.

This operation can be accessed anonymously.

**[Permissions](#permissions) required:** None.

## Purpose
Extract specific data from Jira for project analysis and reporting

## When to Use
When you need this specific data point for project analysis or reporting requirements

## Key Data Points
• **projectKey**: The key of project. Ignored if `projectId` is provided.
• **projectId**: The ID of project.
• **issueKey**: The key of the issue. Ignored if `issueId` is provided.

## Project Analysis Value
Provides valuable data insights that support project management decision-making and performance analysis

## Usage Examples
• Custom reports and dashboards
• Data analysis and trend identification
• Performance monitoring and tracking

## Implementation
To use this data in Excel Power Query:

1. **Load the M code**: Use the function `JiraGetMypermissions` from [jira-mypermissions.m](../assets/jira-mypermissions.m)
2. **Configure authentication**: Ensure your Parameters table includes Jira credentials
3. **Execute the query**: The function will return structured data ready for analysis

### Function Parameters
• **projectKey** (Optional): The key of project. Ignored if `projectId` is provided.
• **projectId** (Optional): The ID of project.
• **issueKey** (Optional): The key of the issue. Ignored if `issueId` is provided.
• **issueId** (Optional): The ID of the issue.
• **permissions** (Optional): A list of permission keys. (Required) This parameter accepts a comma-separated list. To get the list of available permissions, use [Get all permissions](#api-rest-api-3-permissions-get).
• **projectUuid** (Optional): 
• **projectConfigurationUuid** (Optional): 
• **commentId** (Optional): The ID of the comment.

### Expected Output
Structured table with expanded JSON data ready for Excel analysis

## Related Endpoints
See other endpoints in the same category for related functionality

---
*This documentation corresponds to the Jira API endpoint: `/rest/api/3/mypermissions`*
