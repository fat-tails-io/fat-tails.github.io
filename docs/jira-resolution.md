---
title: Resolution
description: |-
  Returns an issue resolution value.
  
  **[Permissions](#permissions) required:** Permission to access Jira.
nav_order: 999
published: false
---

# Resolution

## API Description
Returns an issue resolution value.

**[Permissions](#permissions) required:** Permission to access Jira.

## Purpose
Extract specific data from Jira for project analysis and reporting

## When to Use
When you need this specific data point for project analysis or reporting requirements

## Key Data Points
• **id**: The ID of the issue resolution value.

## Project Analysis Value
Provides valuable data insights that support project management decision-making and performance analysis

## Usage Examples
• Custom reports and dashboards
• Data analysis and trend identification
• Performance monitoring and tracking

## Implementation
To use this data in Excel Power Query:

1. **Load the M code**: Use the function `JiraGetResolution` from [jira-resolution.m](../assets/jira-resolution.m)
2. **Configure authentication**: Ensure your Parameters table includes Jira credentials
3. **Execute the query**: The function will return structured data ready for analysis

### Function Parameters
• **id** (Required): The ID of the issue resolution value.

### Expected Output
Structured table with expanded JSON data ready for Excel analysis

## Related Endpoints
See other endpoints in the same category for related functionality

---
*This documentation corresponds to the Jira API endpoint: `/rest/api/3/resolution/{id}`*
