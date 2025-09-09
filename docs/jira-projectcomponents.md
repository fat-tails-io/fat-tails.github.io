---
title: Project Components
description: Returns all components in a project. See the [Get project components paginated](#api-rest-api-3-project-projectIdOrKey-component-get) resource if you ...
nav_order: 999
---

# Project Components

## Purpose
Analyze project components and their associated issues for better project organization understanding

## When to Use
When you need to analyze project performance, track project metrics, or generate executive reports on project portfolio health

## Key Data Points
• **projectIdOrKey**: The project ID or project key (case sensitive).
• **componentSource**: The source of the components to return. Can be `jira` (default), `compass` or `auto`. When `auto` is specified, the API will return connected Compass components if the project is opted into Compass, otherwise it will return Jira components. Defaults to `jira`.

## Project Analysis Value
Enables forensic analysis of project setup, configuration, and performance metrics. Critical for understanding project success factors and identifying patterns in high-performing vs struggling projects

## Usage Examples
• Executive dashboard showing project health across portfolio
• Project audit reports for compliance
• Resource allocation analysis by project
• Project timeline and milestone tracking

## Implementation
To use this data in Excel Power Query:

1. **Load the M code**: Use the function `JiraGetProjectComponents` from [jira-projectcomponents.m](../assets/jira-projectcomponents.m)
2. **Configure authentication**: Ensure your Parameters table includes Jira credentials
3. **Execute the query**: The function will return structured data ready for analysis

### Function Parameters
• **projectIdOrKey** (Required): The project ID or project key (case sensitive).
• **componentSource** (Optional): The source of the components to return. Can be `jira` (default), `compass` or `auto`. When `auto` is specified, the API will return connected Compass components if the project is opted into Compass, otherwise it will return Jira components. Defaults to `jira`.

### Expected Output
Structured table with expanded JSON data ready for Excel analysis

## Related Endpoints
See other endpoints in the same category for related functionality

---
*This documentation corresponds to the Jira API endpoint: `/rest/api/3/project/{projectIdOrKey}/components`*
