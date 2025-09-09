---
title: Project Mappings For Custom Field Context
description: Returns a [paginated](#pagination) list of context to project mappings for a custom field. The result can be filtered by `contextId`. Otherwise, all m...
nav_order: 999
published: false
---

# Project Mappings For Custom Field Context

## Purpose
Retrieve essential project information for management oversight and analysis

## When to Use
When you need to analyze project performance, track project metrics, or generate executive reports on project portfolio health

## Key Data Points
• **fieldId**: The ID of the custom field, for example `customfield\_10000`.
• **contextId**: The list of context IDs. To include multiple context, separate IDs with ampersand: `contextId=10000&contextId=10001`.
• **startAt**: The index of the first item to return in a page of results (page offset).

## Project Analysis Value
Enables forensic analysis of project setup, configuration, and performance metrics. Critical for understanding project success factors and identifying patterns in high-performing vs struggling projects

## Usage Examples
• Executive dashboard showing project health across portfolio
• Project audit reports for compliance
• Resource allocation analysis by project
• Project timeline and milestone tracking

## Implementation
To use this data in Excel Power Query:

1. **Load the M code**: Use the function `JiraGetFieldContextProjectmapping` from [jira-fieldcontextprojectmapping.m](../assets/jira-fieldcontextprojectmapping.m)
2. **Configure authentication**: Ensure your Parameters table includes Jira credentials
3. **Execute the query**: The function will return structured data ready for analysis

### Function Parameters
• **fieldId** (Required): The ID of the custom field, for example `customfield\_10000`.
• **contextId** (Optional): The list of context IDs. To include multiple context, separate IDs with ampersand: `contextId=10000&contextId=10001`.
• **startAt** (Optional): The index of the first item to return in a page of results (page offset).
• **maxResults** (Optional): The maximum number of items to return per page.

### Expected Output
Structured table with expanded JSON data ready for Excel analysis

## Related Endpoints
See other endpoints in the same category for related functionality

---
*This documentation corresponds to the Jira API endpoint: `/rest/api/3/field/{fieldId}/context/projectmapping`*
