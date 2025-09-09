---
title: Issue Type Usages By Status And Project
description: Returns a page of issue types in a project using a given status.
nav_order: 999
---

# Issue Type Usages By Status And Project

## Purpose
Retrieve essential project information for management oversight and analysis

## When to Use
When you need to analyze project performance, track project metrics, or generate executive reports on project portfolio health

## Key Data Points
• **statusId**: The statusId to fetch issue type usages for
• **projectId**: The projectId to fetch issue type usages for
• **nextPageToken**: The cursor for pagination

## Project Analysis Value
Enables forensic analysis of project setup, configuration, and performance metrics. Critical for understanding project success factors and identifying patterns in high-performing vs struggling projects

## Usage Examples
• Executive dashboard showing project health across portfolio
• Project audit reports for compliance
• Resource allocation analysis by project
• Project timeline and milestone tracking

## Implementation
To use this data in Excel Power Query:

1. **Load the M code**: Use the function `JiraGetStatusesProjectIssuetypeusages` from [jira-statusesprojectissuetypeusages.m](../assets/jira-statusesprojectissuetypeusages.m)
2. **Configure authentication**: Ensure your Parameters table includes Jira credentials
3. **Execute the query**: The function will return structured data ready for analysis

### Function Parameters
• **statusId** (Required): The statusId to fetch issue type usages for
• **projectId** (Required): The projectId to fetch issue type usages for
• **nextPageToken** (Optional): The cursor for pagination
• **maxResults** (Optional): The maximum number of results to return. Must be an integer between 1 and 200.

### Expected Output
Structured table with expanded JSON data ready for Excel analysis

## Related Endpoints
See other endpoints in the same category for related functionality

---
*This documentation corresponds to the Jira API endpoint: `/rest/api/3/statuses/{statusId}/project/{projectId}/issueTypeUsages`*
