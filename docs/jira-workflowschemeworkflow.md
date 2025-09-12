---
title: Issue Types For Workflows In Workflow Scheme
description: |-
  Returns the workflow-issue type mappings for a workflow scheme.
  
  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
nav_order: 999
published: false
---

# Issue Types For Workflows In Workflow Scheme

## API Description
Returns the workflow-issue type mappings for a workflow scheme.

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

## Purpose
Extract specific data from Jira for project analysis and reporting

## When to Use
When you need this specific data point for project analysis or reporting requirements

## Key Data Points
• **id**: The ID of the workflow scheme.
• **workflowName**: The name of a workflow in the scheme. Limits the results to the workflow-issue type mapping for the specified workflow.
• **returnDraftIfExists**: Returns the mapping from the workflow scheme's draft rather than the workflow scheme, if set to true. If no draft exists, the mapping from the workflow scheme is returned.

## Project Analysis Value
Provides valuable data insights that support project management decision-making and performance analysis

## Usage Examples
• Custom reports and dashboards
• Data analysis and trend identification
• Performance monitoring and tracking

## Implementation
To use this data in Excel Power Query:

1. **Load the M code**: Use the function `JiraGetWorkflowschemeWorkflow` from [jira-workflowschemeworkflow.m](../assets/jira-workflowschemeworkflow.m)
2. **Configure authentication**: Ensure your Parameters table includes Jira credentials
3. **Execute the query**: The function will return structured data ready for analysis

### Function Parameters
• **id** (Required): The ID of the workflow scheme.
• **workflowName** (Optional): The name of a workflow in the scheme. Limits the results to the workflow-issue type mapping for the specified workflow.
• **returnDraftIfExists** (Optional): Returns the mapping from the workflow scheme's draft rather than the workflow scheme, if set to true. If no draft exists, the mapping from the workflow scheme is returned.

### Expected Output
Structured table with expanded JSON data ready for Excel analysis

## Related Endpoints
See other endpoints in the same category for related functionality

---
*This documentation corresponds to the Jira API endpoint: `/rest/api/3/workflowscheme/{id}/workflow`*
