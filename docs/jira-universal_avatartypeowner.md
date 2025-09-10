---
title: Avatars
description: Returns the system and custom avatars for a project, issue type or priority.

This operation can be accessed anonymously.

**[Permissions](#permission...
nav_order: 999
published: false
---

# Avatars

## Purpose
Extract specific data from Jira for project analysis and reporting

## When to Use
When you need this specific data point for project analysis or reporting requirements

## Key Data Points
• **type**: The avatar type.
• **entityId**: The ID of the item the avatar is associated with.

## Project Analysis Value
Provides valuable data insights that support project management decision-making and performance analysis

## Usage Examples
• Custom reports and dashboards
• Data analysis and trend identification
• Performance monitoring and tracking

## Implementation
To use this data in Excel Power Query:

1. **Load the M code**: Use the function `JiraGetUniversal_AvatarTypeOwner` from [jira-universal_avatartypeowner.m](../assets/jira-universal_avatartypeowner.m)
2. **Configure authentication**: Ensure your Parameters table includes Jira credentials
3. **Execute the query**: The function will return structured data ready for analysis

### Function Parameters
• **type** (Required): The avatar type.
• **entityId** (Required): The ID of the item the avatar is associated with.

### Expected Output
Structured table with expanded JSON data ready for Excel analysis

## Related Endpoints
See other endpoints in the same category for related functionality

---
*This documentation corresponds to the Jira API endpoint: `/rest/api/3/universal_avatar/type/{type}/owner/{entityId}`*
