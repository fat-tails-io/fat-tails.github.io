---
title: Project Category By Id
description: |-
  Returns a project category.
  
  **[Permissions](#permissions) required:** Permission to access Jira.
nav_order: 999
published: false
---

# Project Category By Id

## API Description
Returns a project category.

**[Permissions](#permissions) required:** Permission to access Jira.

## Purpose
Retrieve essential project information for management oversight and analysis

## When to Use
When you need to analyze project performance, track project metrics, or generate executive reports on project portfolio health

## Key Data Points
• **id**: The ID of the project category.

## Project Analysis Value
Enables forensic analysis of project setup, configuration, and performance metrics. Critical for understanding project success factors and identifying patterns in high-performing vs struggling projects

## Usage Examples
• Executive dashboard showing project health across portfolio
• Project audit reports for compliance
• Resource allocation analysis by project
• Project timeline and milestone tracking

## Implementation
To use this data in Excel Power Query:

1. **Load the M code**: Use the function `JiraGetProjectcategory` from [jira-projectcategory.m](../assets/jira-projectcategory.m)
2. **Configure authentication**: Ensure your Parameters table includes Jira credentials
3. **Execute the query**: The function will return structured data ready for analysis

### Function Parameters
• **id** (Required): The ID of the project category.

### Expected Output
Structured table with expanded JSON data ready for Excel analysis

## Related Endpoints
See other endpoints in the same category for related functionality

---
*This documentation corresponds to the Jira API endpoint: `/rest/api/3/projectCategory/{id}`*
