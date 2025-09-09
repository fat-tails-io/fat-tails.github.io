---
title: The Default Data Classification Level Of A Project
description: Returns the default data classification for a project.

**[Permissions](#permissions) required:**

 *  *Browse Projects* [project permission](https://...
nav_order: 999
---

# The Default Data Classification Level Of A Project

## Purpose
Retrieve essential project information for management oversight and analysis

## When to Use
When you need to analyze project performance, track project metrics, or generate executive reports on project portfolio health

## Key Data Points
• **projectIdOrKey**: The project ID or project key (case-sensitive).

## Project Analysis Value
Enables forensic analysis of project setup, configuration, and performance metrics. Critical for understanding project success factors and identifying patterns in high-performing vs struggling projects

## Usage Examples
• Executive dashboard showing project health across portfolio
• Project audit reports for compliance
• Resource allocation analysis by project
• Project timeline and milestone tracking

## Implementation
To use this data in Excel Power Query:

1. **Load the M code**: Use the function `JiraGetProjectClassificationLevelDefault` from [jira-projectclassificationleveldefault.m](../assets/jira-projectclassificationleveldefault.m)
2. **Configure authentication**: Ensure your Parameters table includes Jira credentials
3. **Execute the query**: The function will return structured data ready for analysis

### Function Parameters
• **projectIdOrKey** (Required): The project ID or project key (case-sensitive).

### Expected Output
Structured table with expanded JSON data ready for Excel analysis

## Related Endpoints
See other endpoints in the same category for related functionality

---
*This documentation corresponds to the Jira API endpoint: `/rest/api/3/project/{projectIdOrKey}/classification-level/default`*
