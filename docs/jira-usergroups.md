---
title: User Groups
description: |-
  Returns the groups to which a user belongs.
  
  **[Permissions](#permissions) required:** *Browse users and groups* [global permission](https://confluence.atlassian.com/x/x4dKLg).
nav_order: 999
published: false
---

# User Groups

## API Description
Returns the groups to which a user belongs.

**[Permissions](#permissions) required:** *Browse users and groups* [global permission](https://confluence.atlassian.com/x/x4dKLg).

## Purpose
Understand team composition, roles, and user activity patterns

## When to Use
When analyzing team performance, resource allocation, or conducting organizational analysis of project contributions

## Key Data Points
• **accountId**: The account ID of the user, which uniquely identifies the user across all Atlassian products. For example, *5b10ac8d82e05b22cc7d4ef5*.
• **username**: This parameter is no longer available. See the [deprecation notice](https://developer.atlassian.com/cloud/jira/platform/deprecation-notice-user-privacy-api-migration-guide/) for details.
• **key**: This parameter is no longer available. See the [deprecation notice](https://developer.atlassian.com/cloud/jira/platform/deprecation-notice-user-privacy-api-migration-guide/) for details.

## Project Analysis Value
Enables analysis of human resource utilization, identifies key contributors, and supports capacity planning and team optimization decisions

## Usage Examples
• Team performance and contribution analysis
• Resource capacity planning
• User activity and engagement metrics
• Role-based access and permission auditing

## Implementation
To use this data in Excel Power Query:

1. **Load the M code**: Use the function `JiraGetUserGroups` from [jira-usergroups.m](../assets/jira-usergroups.m)
2. **Configure authentication**: Ensure your Parameters table includes Jira credentials
3. **Execute the query**: The function will return structured data ready for analysis

### Function Parameters
• **accountId** (Required): The account ID of the user, which uniquely identifies the user across all Atlassian products. For example, *5b10ac8d82e05b22cc7d4ef5*.
• **username** (Optional): This parameter is no longer available. See the [deprecation notice](https://developer.atlassian.com/cloud/jira/platform/deprecation-notice-user-privacy-api-migration-guide/) for details.
• **key** (Optional): This parameter is no longer available. See the [deprecation notice](https://developer.atlassian.com/cloud/jira/platform/deprecation-notice-user-privacy-api-migration-guide/) for details.

### Expected Output
Structured table with expanded JSON data ready for Excel analysis

## Related Endpoints
See other endpoints in the same category for related functionality

---
*This documentation corresponds to the Jira API endpoint: `/rest/api/3/user/groups`*
