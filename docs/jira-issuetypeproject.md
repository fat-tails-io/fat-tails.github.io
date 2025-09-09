---
title: Issue Types For Project
description: Returns issue types for a project.

This operation can be accessed anonymously.

**[Permissions](#permissions) required:** *Browse projects* [project ...
nav_order: 999
---

# Issue Types For Project

## Purpose
Retrieve essential project information for management oversight and analysis

## When to Use
When you need to analyze project performance, track project metrics, or generate executive reports on project portfolio health

## Key Data Points
• **projectId**: The ID of the project.
• **level**: The level of the issue type to filter by. Use:

 *  `-1` for Subtask.
 *  `0` for Base.
 *  `1` for Epic.

## Project Analysis Value
Enables forensic analysis of project setup, configuration, and performance metrics. Critical for understanding project success factors and identifying patterns in high-performing vs struggling projects

## Usage Examples
• Executive dashboard showing project health across portfolio
• Project audit reports for compliance
• Resource allocation analysis by project
• Project timeline and milestone tracking

## Implementation
To use this data in Excel Power Query:

1. **Load the M code**: Use the function `JiraGetIssuetypeProject` from [jira-issuetypeproject.m](../assets/jira-issuetypeproject.m)
2. **Configure authentication**: Ensure your Parameters table includes Jira credentials
3. **Execute the query**: The function will return structured data ready for analysis

### Function Parameters
• **projectId** (Required): The ID of the project.
• **level** (Optional): The level of the issue type to filter by. Use:

 *  `-1` for Subtask.
 *  `0` for Base.
 *  `1` for Epic.

### Expected Output
Structured table with expanded JSON data ready for Excel analysis

## Related Endpoints
See other endpoints in the same category for related functionality

---
*This documentation corresponds to the Jira API endpoint: `/rest/api/3/issuetype/project`*
