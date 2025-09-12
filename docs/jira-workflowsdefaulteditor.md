---
title: The User'S Default Workflow Editor
description: |-
  Get the user's default workflow editor. This can be either the new editor or the legacy editor.
nav_order: 999
published: false
---

# The User'S Default Workflow Editor

## API Description
Get the user's default workflow editor. This can be either the new editor or the legacy editor.

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

1. **Load the M code**: Use the function `JiraGetWorkflowsDefaulteditor` from [jira-workflowsdefaulteditor.m](../assets/jira-workflowsdefaulteditor.m)
2. **Configure authentication**: Ensure your Parameters table includes Jira credentials
3. **Execute the query**: The function will return structured data ready for analysis

### Function Parameters
• No additional parameters required

### Expected Output
Structured table with expanded JSON data ready for Excel analysis

## Related Endpoints
See other endpoints in the same category for related functionality

---
*This documentation corresponds to the Jira API endpoint: `/rest/api/3/workflows/defaultEditor`*
