---
title: Recent Projects
description: Returns a list of up to 20 projects recently viewed by the user that are still visible to the user.

This operation can be accessed anonymously.

**[P...
nav_order: 999
---

# Recent Projects

## Purpose
Retrieve essential project information for management oversight and analysis

## When to Use
When you need to analyze project performance, track project metrics, or generate executive reports on project portfolio health

## Key Data Points
• **expand**: Use [expand](#expansion) to include additional information in the response. This parameter accepts a comma-separated list. Expanded options include:

 *  `description` Returns the project description.
 *  `projectKeys` Returns all project keys associated with a project.
 *  `lead` Returns information about the project lead.
 *  `issueTypes` Returns all issue types associated with the project.
 *  `url` Returns the URL associated with the project.
 *  `permissions` Returns the permissions associated with the project.
 *  `insight` EXPERIMENTAL. Returns the insight details of total issue count and last issue update time for the project.
 *  `*` Returns the project with all available expand options.
• **properties**: EXPERIMENTAL. A list of project properties to return for the project. This parameter accepts a comma-separated list. Invalid property names are ignored.

## Project Analysis Value
Enables forensic analysis of project setup, configuration, and performance metrics. Critical for understanding project success factors and identifying patterns in high-performing vs struggling projects

## Usage Examples
• Executive dashboard showing project health across portfolio
• Project audit reports for compliance
• Resource allocation analysis by project
• Project timeline and milestone tracking

## Implementation
To use this data in Excel Power Query:

1. **Load the M code**: Use the function `JiraGetProjectRecent` from [jira-projectrecent.m](../assets/jira-projectrecent.m)
2. **Configure authentication**: Ensure your Parameters table includes Jira credentials
3. **Execute the query**: The function will return structured data ready for analysis

### Function Parameters
• **expand** (Optional): Use [expand](#expansion) to include additional information in the response. This parameter accepts a comma-separated list. Expanded options include:

 *  `description` Returns the project description.
 *  `projectKeys` Returns all project keys associated with a project.
 *  `lead` Returns information about the project lead.
 *  `issueTypes` Returns all issue types associated with the project.
 *  `url` Returns the URL associated with the project.
 *  `permissions` Returns the permissions associated with the project.
 *  `insight` EXPERIMENTAL. Returns the insight details of total issue count and last issue update time for the project.
 *  `*` Returns the project with all available expand options.
• **properties** (Optional): EXPERIMENTAL. A list of project properties to return for the project. This parameter accepts a comma-separated list. Invalid property names are ignored.

### Expected Output
Structured table with expanded JSON data ready for Excel analysis

## Related Endpoints
See other endpoints in the same category for related functionality

---
*This documentation corresponds to the Jira API endpoint: `/rest/api/3/project/recent`*
