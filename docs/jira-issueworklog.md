---
title: Worklog
description: Returns a worklog.

Time tracking must be enabled in Jira, otherwise this operation returns an error. For more information, see [Configuring time trac...
nav_order: 999
draft: true
---

# Worklog

## Purpose
Access detailed issue data for project analysis and performance tracking

## When to Use
When conducting deep-dive analysis of project delivery, identifying bottlenecks, or measuring team productivity and issue resolution patterns

## Key Data Points
• **issueIdOrKey**: The ID or key of the issue.
• **id**: The ID of the worklog.
• **expand**: Use [expand](#expansion) to include additional information about work logs in the response. This parameter accepts

`properties`, which returns worklog properties.

## Project Analysis Value
Provides granular insights into project execution, enabling identification of process inefficiencies, resource constraints, and quality patterns that impact project success

## Usage Examples
• Burndown analysis and sprint performance
• Issue aging and resolution time analysis
• Quality metrics and defect tracking
• Team productivity and workload analysis

## Implementation
To use this data in Excel Power Query:

1. **Load the M code**: Use the function `JiraGetIssueWorklog` from [jira-issueworklog.m](../assets/jira-issueworklog.m)
2. **Configure authentication**: Ensure your Parameters table includes Jira credentials
3. **Execute the query**: The function will return structured data ready for analysis

### Function Parameters
• **issueIdOrKey** (Required): The ID or key of the issue.
• **id** (Required): The ID of the worklog.
• **expand** (Optional): Use [expand](#expansion) to include additional information about work logs in the response. This parameter accepts

`properties`, which returns worklog properties.

### Expected Output
Structured table with expanded JSON data ready for Excel analysis

## Related Endpoints
See other endpoints in the same category for related functionality

---
*This documentation corresponds to the Jira API endpoint: `/rest/api/3/issue/{issueIdOrKey}/worklog/{id}`*
