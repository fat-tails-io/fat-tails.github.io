---
title: All Users Default
description: Returns a list of all users, including active users, inactive users and previously deleted users that have an Atlassian account.

Privacy controls are...
nav_order: 999
draft: true
---

# All Users Default

## Purpose
Understand team composition, roles, and user activity patterns

## When to Use
When analyzing team performance, resource allocation, or conducting organizational analysis of project contributions

## Key Data Points
• **startAt**: The index of the first item to return.
• **maxResults**: The maximum number of items to return (limited to 1000).

## Project Analysis Value
Enables analysis of human resource utilization, identifies key contributors, and supports capacity planning and team optimization decisions

## Usage Examples
• Team performance and contribution analysis
• Resource capacity planning
• User activity and engagement metrics
• Role-based access and permission auditing

## Implementation
To use this data in Excel Power Query:

1. **Load the M code**: Use the function `JiraGetUsers` from [jira-users.m](../assets/jira-users.m)
2. **Configure authentication**: Ensure your Parameters table includes Jira credentials
3. **Execute the query**: The function will return structured data ready for analysis

### Function Parameters
• **startAt** (Optional): The index of the first item to return.
• **maxResults** (Optional): The maximum number of items to return (limited to 1000).

### Expected Output
Structured table with expanded JSON data ready for Excel analysis

## Related Endpoints
See other endpoints in the same category for related functionality

---
*This documentation corresponds to the Jira API endpoint: `/rest/api/3/users`*
