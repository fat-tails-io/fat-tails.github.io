---
title: Project Issue Security Levels
description: |-
  Returns all [issue security](https://confluence.atlassian.com/x/J4lKLg) levels for the project that the user has access to.
  
  This operation can be accessed anonymously.
  
  **[Permissions](#permissions) required:** *Browse projects* [global permission](https://confluence.atlassian.com/x/x4dKLg) for the project, however, issue security levels are only returned for authenticated user with *Set Issue Security* [global permission](https://confluence.atlassian.com/x/x4dKLg) for the project.
nav_order: 999
published: false
---

# Project Issue Security Levels

## API Description
Returns all [issue security](https://confluence.atlassian.com/x/J4lKLg) levels for the project that the user has access to.

This operation can be accessed anonymously.

**[Permissions](#permissions) required:** *Browse projects* [global permission](https://confluence.atlassian.com/x/x4dKLg) for the project, however, issue security levels are only returned for authenticated user with *Set Issue Security* [global permission](https://confluence.atlassian.com/x/x4dKLg) for the project.

## Purpose
Retrieve essential project information for management oversight and analysis

## When to Use
When you need to analyze project performance, track project metrics, or generate executive reports on project portfolio health

## Key Data Points
• **projectKeyOrId**: The project ID or project key (case sensitive).

## Project Analysis Value
Enables forensic analysis of project setup, configuration, and performance metrics. Critical for understanding project success factors and identifying patterns in high-performing vs struggling projects

## Usage Examples
• Executive dashboard showing project health across portfolio
• Project audit reports for compliance
• Resource allocation analysis by project
• Project timeline and milestone tracking

## Implementation
To use this data in Excel Power Query:

1. **Load the M code**: Use the function `JiraGetProjectSecuritylevel` from [jira-projectsecuritylevel.m](../assets/jira-projectsecuritylevel.m)
2. **Configure authentication**: Ensure your Parameters table includes Jira credentials
3. **Execute the query**: The function will return structured data ready for analysis

### Function Parameters
• **projectKeyOrId** (Required): The project ID or project key (case sensitive).

### Expected Output
Structured table with expanded JSON data ready for Excel analysis

## Related Endpoints
See other endpoints in the same category for related functionality

---
*This documentation corresponds to the Jira API endpoint: `/rest/api/3/project/{projectKeyOrId}/securitylevel`*
