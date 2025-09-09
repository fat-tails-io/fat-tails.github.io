---
title: All Workflows
description: This will be removed on [February 1, 2026](https://developer.atlassian.com/cloud/jira/platform/changelog/#CHANGE-2567); use [Search workflows](#api-re...
nav_order: 999
published: false
---

# All Workflows

## Purpose
Extract specific data from Jira for project analysis and reporting

## When to Use
When you need this specific data point for project analysis or reporting requirements

## Key Data Points
• **workflowName**: The name of the workflow to be returned. Only one workflow can be specified.

## Project Analysis Value
Provides valuable data insights that support project management decision-making and performance analysis

## Usage Examples
• Custom reports and dashboards
• Data analysis and trend identification
• Performance monitoring and tracking

## Implementation
To use this data in Excel Power Query:

1. **Load the M code**: Use the function `JiraGetWorkflow` from [jira-workflow.m](../assets/jira-workflow.m)
2. **Configure authentication**: Ensure your Parameters table includes Jira credentials
3. **Execute the query**: The function will return structured data ready for analysis

### Function Parameters
• **workflowName** (Optional): The name of the workflow to be returned. Only one workflow can be specified.

### Expected Output
Structured table with expanded JSON data ready for Excel analysis

## Related Endpoints
See other endpoints in the same category for related functionality

---
*This documentation corresponds to the Jira API endpoint: `/rest/api/3/workflow`*
