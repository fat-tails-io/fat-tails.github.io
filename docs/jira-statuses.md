---
title: Bulk Get Statuses
description: Returns a list of the statuses specified by one or more status IDs.

**[Permissions](#permissions) required:**

 *  *Administer projects* [project per...
nav_order: 999
published: false
---

# Bulk Get Statuses

## Purpose
Extract specific data from Jira for project analysis and reporting

## When to Use
When you need this specific data point for project analysis or reporting requirements

## Key Data Points
• **id**: The list of status IDs. To include multiple IDs, provide an ampersand-separated list. For example, id=10000&id=10001.

Min items `1`, Max items `50`

## Project Analysis Value
Provides valuable data insights that support project management decision-making and performance analysis

## Usage Examples
• Custom reports and dashboards
• Data analysis and trend identification
• Performance monitoring and tracking

## Implementation
To use this data in Excel Power Query:

1. **Load the M code**: Use the function `JiraGetStatuses` from [jira-statuses.m](../assets/jira-statuses.m)
2. **Configure authentication**: Ensure your Parameters table includes Jira credentials
3. **Execute the query**: The function will return structured data ready for analysis

### Function Parameters
• **id** (Required): The list of status IDs. To include multiple IDs, provide an ampersand-separated list. For example, id=10000&id=10001.

Min items `1`, Max items `50`

### Expected Output
Structured table with expanded JSON data ready for Excel analysis

## Related Endpoints
See other endpoints in the same category for related functionality

---
*This documentation corresponds to the Jira API endpoint: `/rest/api/3/statuses`*
