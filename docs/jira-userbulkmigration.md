---
title: Account Ids For Users
description: |-
  Returns the account IDs for the users specified in the `key` or `username` parameters. Note that multiple `key` or `username` parameters can be specified.
  
  **[Permissions](#permissions) required:** Permission to access Jira.
nav_order: 999
published: false
---

# Account Ids For Users

## API Description
Returns the account IDs for the users specified in the `key` or `username` parameters. Note that multiple `key` or `username` parameters can be specified.

**[Permissions](#permissions) required:** Permission to access Jira.

## Purpose
Understand team composition, roles, and user activity patterns

## When to Use
When analyzing team performance, resource allocation, or conducting organizational analysis of project contributions

## Key Data Points
• **startAt**: The index of the first item to return in a page of results (page offset).
• **maxResults**: The maximum number of items to return per page.
• **username**: Username of a user. To specify multiple users, pass multiple copies of this parameter. For example, `username=fred&username=barney`. Required if `key` isn't provided. Cannot be provided if `key` is present.

## Project Analysis Value
Enables analysis of human resource utilization, identifies key contributors, and supports capacity planning and team optimization decisions

## Usage Examples
• Team performance and contribution analysis
• Resource capacity planning
• User activity and engagement metrics
• Role-based access and permission auditing

## Implementation
To use this data in Excel Power Query:

1. **Load the M code**: Use the function `JiraGetUserBulkMigration` from [jira-userbulkmigration.m](../assets/jira-userbulkmigration.m)
2. **Configure authentication**: Ensure your Parameters table includes Jira credentials
3. **Execute the query**: The function will return structured data ready for analysis

### Function Parameters
• **startAt** (Optional): The index of the first item to return in a page of results (page offset).
• **maxResults** (Optional): The maximum number of items to return per page.
• **username** (Optional): Username of a user. To specify multiple users, pass multiple copies of this parameter. For example, `username=fred&username=barney`. Required if `key` isn't provided. Cannot be provided if `key` is present.
• **key** (Optional): Key of a user. To specify multiple users, pass multiple copies of this parameter. For example, `key=fred&key=barney`. Required if `username` isn't provided. Cannot be provided if `username` is present.

### Expected Output
Structured table with expanded JSON data ready for Excel analysis

## Related Endpoints
See other endpoints in the same category for related functionality

---
*This documentation corresponds to the Jira API endpoint: `/rest/api/3/user/bulk/migration`*
