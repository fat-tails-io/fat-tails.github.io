---
title: Available Workflow Capabilities
description: Get the list of workflow capabilities for a specific workflow using either the workflow ID, or the project and issue type ID pair. The response includ...
nav_order: 999
published: false
---

# Available Workflow Capabilities

## Purpose
Extract specific data from Jira for project analysis and reporting

## When to Use
When you need this specific data point for project analysis or reporting requirements

## Key Data Points
• Structured data from Jira API endpoint
• Automatically expanded nested information
• Ready for Excel analysis and reporting

## Project Analysis Value
Provides valuable data insights that support project management decision-making and performance analysis

## Usage Examples
• Custom reports and dashboards
• Data analysis and trend identification
• Performance monitoring and tracking

## Implementation
To use this data in Excel Power Query:

1. **Load the M code**: Use the function `JiraGetWorkflowsCapabilities` from [jira-workflowscapabilities.m](../assets/jira-workflowscapabilities.m)
2. **Configure authentication**: Ensure your Parameters table includes Jira credentials
3. **Execute the query**: The function will return structured data ready for analysis

### Function Parameters
• **workflowId** (Optional): 
• **projectId** (Optional): 
• **issueTypeId** (Optional): 

### Expected Output
Structured table with expanded JSON data ready for Excel analysis

## Related Endpoints
See other endpoints in the same category for related functionality

---
*This documentation corresponds to the Jira API endpoint: `/rest/api/3/workflows/capabilities`*
