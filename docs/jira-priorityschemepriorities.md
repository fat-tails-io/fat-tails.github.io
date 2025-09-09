---
title: Priorities By Priority Scheme
description: Returns a [paginated](#pagination) list of priorities by scheme.

**[Permissions](#permissions) required:** Permission to access Jira.
nav_order: 999
draft: true
---

# Priorities By Priority Scheme

## Purpose
Extract specific data from Jira for project analysis and reporting

## When to Use
When you need this specific data point for project analysis or reporting requirements

## Key Data Points
• **startAt**: The index of the first item to return in a page of results (page offset).
• **maxResults**: The maximum number of items to return per page.
• **schemeId**: The priority scheme ID.

## Project Analysis Value
Provides valuable data insights that support project management decision-making and performance analysis

## Usage Examples
• Custom reports and dashboards
• Data analysis and trend identification
• Performance monitoring and tracking

## Implementation
To use this data in Excel Power Query:

1. **Load the M code**: Use the function `JiraGetPriorityschemePriorities` from [jira-priorityschemepriorities.m](../assets/jira-priorityschemepriorities.m)
2. **Configure authentication**: Ensure your Parameters table includes Jira credentials
3. **Execute the query**: The function will return structured data ready for analysis

### Function Parameters
• **startAt** (Optional): The index of the first item to return in a page of results (page offset).
• **maxResults** (Optional): The maximum number of items to return per page.
• **schemeId** (Required): The priority scheme ID.

### Expected Output
Structured table with expanded JSON data ready for Excel analysis

## Related Endpoints
See other endpoints in the same category for related functionality

---
*This documentation corresponds to the Jira API endpoint: `/rest/api/3/priorityscheme/{schemeId}/priorities`*
