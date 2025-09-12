---
title: Projects Using A Given Workflow
description: Returns a page of projects using a given workflow.
nav_order: 999
published: false
---

# Projects Using A Given Workflow

## API Description
Returns a page of projects using a given workflow.

## Purpose
Retrieve essential project information for management oversight and analysis

## When to Use
When you need to analyze project performance, track project metrics, or generate executive reports on project portfolio health

## Key Data Points
• **workflowId**: The workflow ID
• **nextPageToken**: The cursor for pagination
• **maxResults**: The maximum number of results to return. Must be an integer between 1 and 200.

## Project Analysis Value
Enables forensic analysis of project setup, configuration, and performance metrics. Critical for understanding project success factors and identifying patterns in high-performing vs struggling projects

## Usage Examples
• Executive dashboard showing project health across portfolio
• Project audit reports for compliance
• Resource allocation analysis by project
• Project timeline and milestone tracking

## Implementation
To use this data in Excel Power Query:

1. **Load the M code**: Use the function `JiraGetWorkflowProjectusages` from [jira-workflowprojectusages.m](../assets/jira-workflowprojectusages.m)
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
*This documentation corresponds to the Jira API endpoint: `/rest/api/3/workflow/{workflowId}/projectUsages`*
