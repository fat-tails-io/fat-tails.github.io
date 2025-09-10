---
title: Workflow Schemes Which Are Using A Given Workflow
description: Returns a page of workflow schemes using a given workflow.
nav_order: 999
published: false
---

# Workflow Schemes Which Are Using A Given Workflow

## API Description
Returns a page of workflow schemes using a given workflow.

## Purpose
Extract specific data from Jira for project analysis and reporting

## When to Use
When you need this specific data point for project analysis or reporting requirements

## Key Data Points
• **workflowId**: The workflow ID
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

1. **Load the M code**: Use the function `JiraGetWorkflowWorkflowschemes` from [jira-workflowworkflowschemes.m](../assets/jira-workflowworkflowschemes.m)
2. **Configure authentication**: Ensure your Parameters table includes Jira credentials
3. **Execute the query**: The function will return structured data ready for analysis

### Function Parameters
• **workflowId** (Required): The workflow ID
• **nextPageToken** (Optional): The cursor for pagination
• **maxResults** (Optional): The maximum number of results to return. Must be an integer between 1 and 200.

### Expected Output
Structured table with expanded JSON data ready for Excel analysis

## Related Endpoints
See other endpoints in the same category for related functionality

---
*This documentation corresponds to the Jira API endpoint: `/rest/api/3/workflow/{workflowId}/workflowSchemes`*
