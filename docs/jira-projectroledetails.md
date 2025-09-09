---
title: Project Role Details
description: Returns all [project roles](https://support.atlassian.com/jira-cloud-administration/docs/manage-project-roles/) and the details for each role. Note th...
nav_order: 999
---

# Project Role Details

## Purpose
Understand project roles, permissions, and team structure for governance analysis

## When to Use
When you need to analyze project performance, track project metrics, or generate executive reports on project portfolio health

## Key Data Points
• **projectIdOrKey**: The project ID or project key (case sensitive).
• **currentMember**: Whether the roles should be filtered to include only those the user is assigned to.

## Project Analysis Value
Enables forensic analysis of project setup, configuration, and performance metrics. Critical for understanding project success factors and identifying patterns in high-performing vs struggling projects

## Usage Examples
• Executive dashboard showing project health across portfolio
• Project audit reports for compliance
• Resource allocation analysis by project
• Project timeline and milestone tracking

## Implementation
To use this data in Excel Power Query:

1. **Load the M code**: Use the function `JiraGetProjectRoledetails` from [jira-projectroledetails.m](../assets/jira-projectroledetails.m)
2. **Configure authentication**: Ensure your Parameters table includes Jira credentials
3. **Execute the query**: The function will return structured data ready for analysis

### Function Parameters
• **projectIdOrKey** (Required): The project ID or project key (case sensitive).
• **currentMember** (Optional): Whether the roles should be filtered to include only those the user is assigned to.
• **excludeConnectAddons** (Optional): 

### Expected Output
Structured table with expanded JSON data ready for Excel analysis

## Related Endpoints
See other endpoints in the same category for related functionality

---
*This documentation corresponds to the Jira API endpoint: `/rest/api/3/project/{projectIdOrKey}/roledetails`*
