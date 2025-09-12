---
title: Workflow Usages By Status
description: Returns a page of workflows using a given status.
nav_order: 999
published: false
---

# Workflow Usages By Status

## API Description
Returns a page of workflows using a given status.

## Purpose
Extract specific data from Jira for project analysis and reporting

## When to Use
When you need this specific data point for project analysis or reporting requirements

## Key Data Points
• **statusId**: The statusId to fetch workflow usages for
• **nextPageToken**: The cursor for pagination
• **maxResults**: The maximum number of results to return. Must be an integer between 1 and 200.

## Project Analysis Value
Provides valuable data insights that support project management decision-making and performance analysis

## Usage Examples
• Custom reports and dashboards
• Data analysis and trend identification
• Performance monitoring and tracking

## Implementation
To use this data in Excel Power Query:

1. **Load the M code**: Use the function `JiraGetStatusesWorkflowusages` from [jira-statusesworkflowusages.m](../assets/jira-statusesworkflowusages.m)
2. **Configure authentication**: Ensure your Parameters table includes Jira credentials
3. **Execute the query**: The function will return structured data ready for analysis

### Function Parameters
• **statusId** (Required): The statusId to fetch workflow usages for
• **nextPageToken** (Optional): The cursor for pagination
• **maxResults** (Optional): The maximum number of results to return. Must be an integer between 1 and 200.

### Expected Output
Structured table with expanded JSON data ready for Excel analysis

## Related Endpoints
See other endpoints in the same category for related functionality

---
*This documentation corresponds to the Jira API endpoint: `/rest/api/3/statuses/{statusId}/workflowUsages`*
