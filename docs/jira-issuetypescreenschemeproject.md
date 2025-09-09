---
title: Issue Type Screen Scheme Projects
description: Returns a [paginated](#pagination) list of projects associated with an issue type screen scheme.

Only company-managed projects associated with an iss...
nav_order: 999
---

# Issue Type Screen Scheme Projects

## Purpose
Retrieve essential project information for management oversight and analysis

## When to Use
When you need to analyze project performance, track project metrics, or generate executive reports on project portfolio health

## Key Data Points
• **issueTypeScreenSchemeId**: The ID of the issue type screen scheme.
• **startAt**: The index of the first item to return in a page of results (page offset).
• **maxResults**: The maximum number of items to return per page.

## Project Analysis Value
Enables forensic analysis of project setup, configuration, and performance metrics. Critical for understanding project success factors and identifying patterns in high-performing vs struggling projects

## Usage Examples
• Executive dashboard showing project health across portfolio
• Project audit reports for compliance
• Resource allocation analysis by project
• Project timeline and milestone tracking

## Implementation
To use this data in Excel Power Query:

1. **Load the M code**: Use the function `JiraGetIssuetypescreenschemeProject` from [jira-issuetypescreenschemeproject.m](../assets/jira-issuetypescreenschemeproject.m)
2. **Configure authentication**: Ensure your Parameters table includes Jira credentials
3. **Execute the query**: The function will return structured data ready for analysis

### Function Parameters
• **issueTypeScreenSchemeId** (Required): The ID of the issue type screen scheme.
• **startAt** (Optional): The index of the first item to return in a page of results (page offset).
• **maxResults** (Optional): The maximum number of items to return per page.
• **query** (Optional): 

### Expected Output
Structured table with expanded JSON data ready for Excel analysis

## Related Endpoints
See other endpoints in the same category for related functionality

---
*This documentation corresponds to the Jira API endpoint: `/rest/api/3/issuetypescreenscheme/{issueTypeScreenSchemeId}/project`*
