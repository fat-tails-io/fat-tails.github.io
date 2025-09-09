---
title: Project Role For Project
description: Returns a project role's details and actors associated with the project. The list of actors is sorted by display name.

To check whether a user belong...
nav_order: 999
draft: true
---

# Project Role For Project

## Purpose
Understand project roles, permissions, and team structure for governance analysis

## When to Use
When you need to analyze project performance, track project metrics, or generate executive reports on project portfolio health

## Key Data Points
• **projectIdOrKey**: The project ID or project key (case sensitive).
• **id**: The ID of the project role. Use [Get all project roles](#api-rest-api-3-role-get) to get a list of project role IDs.
• **excludeInactiveUsers**: Exclude inactive users.

## Project Analysis Value
Enables forensic analysis of project setup, configuration, and performance metrics. Critical for understanding project success factors and identifying patterns in high-performing vs struggling projects

## Usage Examples
• Executive dashboard showing project health across portfolio
• Project audit reports for compliance
• Resource allocation analysis by project
• Project timeline and milestone tracking

## Implementation
To use this data in Excel Power Query:

1. **Load the M code**: Use the function `JiraGetProjectRole` from [jira-projectrole.m](../assets/jira-projectrole.m)
2. **Configure authentication**: Ensure your Parameters table includes Jira credentials
3. **Execute the query**: The function will return structured data ready for analysis

### Function Parameters
• **projectIdOrKey** (Required): The project ID or project key (case sensitive).
• **id** (Required): The ID of the project role. Use [Get all project roles](#api-rest-api-3-role-get) to get a list of project role IDs.
• **excludeInactiveUsers** (Optional): Exclude inactive users.

### Expected Output
Structured table with expanded JSON data ready for Excel analysis

## Related Endpoints
See other endpoints in the same category for related functionality

---
*This documentation corresponds to the Jira API endpoint: `/rest/api/3/project/{projectIdOrKey}/role/{id}`*
