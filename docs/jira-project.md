---
title: Project
description: Returns the [project details](https://confluence.atlassian.com/x/ahLpNw) for a project.

This operation can be accessed anonymously.

**[Permissions](...
nav_order: 999
---

# Project

## Purpose
Retrieve essential project information for management oversight and analysis

## When to Use
When you need to analyze project performance, track project metrics, or generate executive reports on project portfolio health

## Key Data Points
• **projectIdOrKey**: The project ID or project key (case sensitive).
• **expand**: Use [expand](#expansion) to include additional information in the response. This parameter accepts a comma-separated list. Note that the project description, issue types, and project lead are included in all responses by default. Expand options include:

 *  `description` The project description.
 *  `issueTypes` The issue types associated with the project.
 *  `lead` The project lead.
 *  `projectKeys` All project keys associated with the project.
 *  `issueTypeHierarchy` The project issue type hierarchy.
• **properties**: A list of project properties to return for the project. This parameter accepts a comma-separated list.

## Project Analysis Value
Enables forensic analysis of project setup, configuration, and performance metrics. Critical for understanding project success factors and identifying patterns in high-performing vs struggling projects

## Usage Examples
• Executive dashboard showing project health across portfolio
• Project audit reports for compliance
• Resource allocation analysis by project
• Project timeline and milestone tracking

## Implementation
To use this data in Excel Power Query:

1. **Load the M code**: Use the function `JiraGetProject` from [jira-project.m](../assets/jira-project.m)
2. **Configure authentication**: Ensure your Parameters table includes Jira credentials
3. **Execute the query**: The function will return structured data ready for analysis

### Function Parameters
• **projectIdOrKey** (Required): The project ID or project key (case sensitive).
• **expand** (Optional): Use [expand](#expansion) to include additional information in the response. This parameter accepts a comma-separated list. Note that the project description, issue types, and project lead are included in all responses by default. Expand options include:

 *  `description` The project description.
 *  `issueTypes` The issue types associated with the project.
 *  `lead` The project lead.
 *  `projectKeys` All project keys associated with the project.
 *  `issueTypeHierarchy` The project issue type hierarchy.
• **properties** (Optional): A list of project properties to return for the project. This parameter accepts a comma-separated list.

### Expected Output
Structured table with expanded JSON data ready for Excel analysis

## Related Endpoints
See other endpoints in the same category for related functionality

---
*This documentation corresponds to the Jira API endpoint: `/rest/api/3/project/{projectIdOrKey}`*
