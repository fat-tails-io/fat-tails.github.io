---
title: Gets A Custom Project Template
description: Get custom template

This API endpoint allows you to get a live custom project template details by either templateKey or projectId

***Note: Custom Te...
nav_order: 999
published: false
---

# Gets A Custom Project Template

## Purpose
Retrieve essential project information for management oversight and analysis

## When to Use
When you need to analyze project performance, track project metrics, or generate executive reports on project portfolio health

## Key Data Points
• **projectId**: optional - The \{@link String\} containing the project key linked to the custom template to retrieve
• **templateKey**: optional - The \{@link String\} containing the key of the custom template to retrieve

## Project Analysis Value
Enables forensic analysis of project setup, configuration, and performance metrics. Critical for understanding project success factors and identifying patterns in high-performing vs struggling projects

## Usage Examples
• Executive dashboard showing project health across portfolio
• Project audit reports for compliance
• Resource allocation analysis by project
• Project timeline and milestone tracking

## Implementation
To use this data in Excel Power Query:

1. **Load the M code**: Use the function `JiraGetProjectTemplateLiveTemplate` from [jira-projecttemplatelivetemplate.m](../assets/jira-projecttemplatelivetemplate.m)
2. **Configure authentication**: Ensure your Parameters table includes Jira credentials
3. **Execute the query**: The function will return structured data ready for analysis

### Function Parameters
• **projectId** (Optional): optional - The \{@link String\} containing the project key linked to the custom template to retrieve
• **templateKey** (Optional): optional - The \{@link String\} containing the key of the custom template to retrieve

### Expected Output
Structured table with expanded JSON data ready for Excel analysis

## Related Endpoints
See other endpoints in the same category for related functionality

---
*This documentation corresponds to the Jira API endpoint: `/rest/api/3/project-template/live-template`*
