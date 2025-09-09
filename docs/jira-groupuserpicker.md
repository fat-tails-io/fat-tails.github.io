---
title: Find Users And Groups
description: Returns a list of users and groups matching a string. The string is used:

 *  for users, to find a case-insensitive match with display name and e-mai...
nav_order: 999
draft: true
---

# Find Users And Groups

## Purpose
Extract specific data from Jira for project analysis and reporting

## When to Use
When you need this specific data point for project analysis or reporting requirements

## Key Data Points
• **query**: The search string.
• **maxResults**: The maximum number of items to return in each list.
• **showAvatar**: Whether the user avatar should be returned. If an invalid value is provided, the default value is used.

## Project Analysis Value
Provides valuable data insights that support project management decision-making and performance analysis

## Usage Examples
• Custom reports and dashboards
• Data analysis and trend identification
• Performance monitoring and tracking

## Implementation
To use this data in Excel Power Query:

1. **Load the M code**: Use the function `JiraGetGroupuserpicker` from [jira-groupuserpicker.m](../assets/jira-groupuserpicker.m)
2. **Configure authentication**: Ensure your Parameters table includes Jira credentials
3. **Execute the query**: The function will return structured data ready for analysis

### Function Parameters
• **query** (Required): The search string.
• **maxResults** (Optional): The maximum number of items to return in each list.
• **showAvatar** (Optional): Whether the user avatar should be returned. If an invalid value is provided, the default value is used.
• **fieldId** (Optional): The custom field ID of the field this request is for.
• **projectId** (Optional): The ID of a project that returned users and groups must have permission to view. To include multiple projects, provide an ampersand-separated list. For example, `projectId=10000&projectId=10001`. This parameter is only used when `fieldId` is present.
• **issueTypeId** (Optional): The ID of an issue type that returned users and groups must have permission to view. To include multiple issue types, provide an ampersand-separated list. For example, `issueTypeId=10000&issueTypeId=10001`. Special values, such as `-1` (all standard issue types) and `-2` (all subtask issue types), are supported. This parameter is only used when `fieldId` is present.
• **avatarSize** (Optional): The size of the avatar to return. If an invalid value is provided, the default value is used.
• **caseInsensitive** (Optional): Whether the search for groups should be case insensitive.
• **excludeConnectAddons** (Optional): Whether Connect app users and groups should be excluded from the search results. If an invalid value is provided, the default value is used.

### Expected Output
Structured table with expanded JSON data ready for Excel analysis

## Related Endpoints
See other endpoints in the same category for related functionality

---
*This documentation corresponds to the Jira API endpoint: `/rest/api/3/groupuserpicker`*
