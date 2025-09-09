---
title: My Permissions
description: Returns a list of permissions indicating which permissions the user has. Details of the user's permissions can be obtained in a global, project, issue...
nav_order: 999
published: false
---

# My Permissions

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
