---
title: Project Role By Id
description: |-
  Gets the project role details and the default actors associated with the role. The list of default actors is sorted by display name.
  
  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
nav_order: 999
published: false
---

# Project Role By Id

## API Description
Gets the project role details and the default actors associated with the role. The list of default actors is sorted by display name.

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

## Purpose
Understand project roles, permissions, and team structure for governance analysis

## When to Use
When you need this specific data point for project analysis or reporting requirements

## Key Data Points
• **id**: The ID of the project role. Use [Get all project roles](#api-rest-api-3-role-get) to get a list of project role IDs.

## Project Analysis Value
Provides valuable data insights that support project management decision-making and performance analysis

## Usage Examples
• Custom reports and dashboards
• Data analysis and trend identification
• Performance monitoring and tracking

## Implementation
To use this data in Excel Power Query:

1. **Load the M code**: Use the function `JiraGetRole` from [jira-role.m](../assets/jira-role.m)
2. **Configure authentication**: Ensure your Parameters table includes Jira credentials
3. **Execute the query**: The function will return structured data ready for analysis

### Function Parameters
• **id** (Required): The ID of the project role. Use [Get all project roles](#api-rest-api-3-role-get) to get a list of project role IDs.

### Expected Output
Structured table with expanded JSON data ready for Excel analysis

## Related Endpoints
See other endpoints in the same category for related functionality

---
*This documentation corresponds to the Jira API endpoint: `/rest/api/3/role/{id}`*
