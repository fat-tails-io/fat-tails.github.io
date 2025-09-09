---
title: Project Components Paginated
description: Returns a [paginated](#pagination) list of all components in a project. See the [Get project components](#api-rest-api-3-project-projectIdOrKey-compon...
nav_order: 999
---

# Project Components Paginated

## Purpose
Analyze project components and their associated issues for better project organization understanding

## When to Use
When you need to analyze project performance, track project metrics, or generate executive reports on project portfolio health

## Key Data Points
• **projectIdOrKey**: The project ID or project key (case sensitive).
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

1. **Load the M code**: Use the function `JiraGetProjectComponent` from [jira-projectcomponent.m](../assets/jira-projectcomponent.m)
2. **Configure authentication**: Ensure your Parameters table includes Jira credentials
3. **Execute the query**: The function will return structured data ready for analysis

### Function Parameters
• **projectIdOrKey** (Required): The project ID or project key (case sensitive).
• **startAt** (Optional): The index of the first item to return in a page of results (page offset).
• **maxResults** (Optional): The maximum number of items to return per page.
• **orderBy** (Optional): [Order](#ordering) the results by a field:

 *  `description` Sorts by the component description.
 *  `issueCount` Sorts by the count of issues associated with the component.
 *  `lead` Sorts by the user key of the component's project lead.
 *  `name` Sorts by component name.
• **componentSource** (Optional): The source of the components to return. Can be `jira` (default), `compass` or `auto`. When `auto` is specified, the API will return connected Compass components if the project is opted into Compass, otherwise it will return Jira components. Defaults to `jira`.
• **query** (Optional): Filter the results using a literal string. Components with a matching `name` or `description` are returned (case insensitive).

### Expected Output
Structured table with expanded JSON data ready for Excel analysis

## Related Endpoints
See other endpoints in the same category for related functionality

---
*This documentation corresponds to the Jira API endpoint: `/rest/api/3/project/{projectIdOrKey}/component`*
