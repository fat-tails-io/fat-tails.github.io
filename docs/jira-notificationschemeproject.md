---
title: Projects Using Notification Schemes Paginated
description: Returns a [paginated](#pagination) mapping of project that have notification scheme assigned. You can provide either one or multiple notification sche...
nav_order: 999
draft: true
---

# Projects Using Notification Schemes Paginated

## Purpose
Retrieve essential project information for management oversight and analysis

## When to Use
When you need to analyze project performance, track project metrics, or generate executive reports on project portfolio health

## Key Data Points
• **startAt**: The index of the first item to return in a page of results (page offset).
• **maxResults**: The maximum number of items to return per page.
• **notificationSchemeId**: The list of notifications scheme IDs to be filtered out

## Project Analysis Value
Enables forensic analysis of project setup, configuration, and performance metrics. Critical for understanding project success factors and identifying patterns in high-performing vs struggling projects

## Usage Examples
• Executive dashboard showing project health across portfolio
• Project audit reports for compliance
• Resource allocation analysis by project
• Project timeline and milestone tracking

## Implementation
To use this data in Excel Power Query:

1. **Load the M code**: Use the function `JiraGetNotificationschemeProject` from [jira-notificationschemeproject.m](../assets/jira-notificationschemeproject.m)
2. **Configure authentication**: Ensure your Parameters table includes Jira credentials
3. **Execute the query**: The function will return structured data ready for analysis

### Function Parameters
• **startAt** (Optional): The index of the first item to return in a page of results (page offset).
• **maxResults** (Optional): The maximum number of items to return per page.
• **notificationSchemeId** (Optional): The list of notifications scheme IDs to be filtered out
• **projectId** (Optional): The list of project IDs to be filtered out

### Expected Output
Structured table with expanded JSON data ready for Excel analysis

## Related Endpoints
See other endpoints in the same category for related functionality

---
*This documentation corresponds to the Jira API endpoint: `/rest/api/3/notificationscheme/project`*
