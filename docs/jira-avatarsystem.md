---
title: System Avatars By Type
description: |-
  Returns a list of system avatar details by owner type, where the owner types are issue type, project, user or priority.
  
  This operation can be accessed anonymously.
  
  **[Permissions](#permissions) required:** None.
nav_order: 999
published: false
---

# System Avatars By Type

## API Description
Returns a list of system avatar details by owner type, where the owner types are issue type, project, user or priority.

This operation can be accessed anonymously.

**[Permissions](#permissions) required:** None.

## Purpose
Extract specific data from Jira for project analysis and reporting

## When to Use
When you need this specific data point for project analysis or reporting requirements

## Key Data Points
• **type**: The avatar type.

## Project Analysis Value
Provides valuable data insights that support project management decision-making and performance analysis

## Usage Examples
• Custom reports and dashboards
• Data analysis and trend identification
• Performance monitoring and tracking

## Implementation
To use this data in Excel Power Query:

1. **Load the M code**: Use the function `JiraGetAvatarSystem` from [jira-avatarsystem.m](../assets/jira-avatarsystem.m)
2. **Configure authentication**: Ensure your Parameters table includes Jira credentials
3. **Execute the query**: The function will return structured data ready for analysis

### Function Parameters
• **type** (Required): The avatar type.

### Expected Output
Structured table with expanded JSON data ready for Excel analysis

## Related Endpoints
See other endpoints in the same category for related functionality

---
*This documentation corresponds to the Jira API endpoint: `/rest/api/3/avatar/{type}/system`*
