---
title: Project Property
description: |-
  Returns the value of a [project property](https://developer.atlassian.com/cloud/jira/platform/storing-data-without-a-database/#a-id-jira-entity-properties-a-jira-entity-properties).
  
  This operation can be accessed anonymously.
  
  **[Permissions](#permissions) required:** *Browse Projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for the project containing the property.
nav_order: 999
published: false
---

# Project Property

## API Description
Returns the value of a [project property](https://developer.atlassian.com/cloud/jira/platform/storing-data-without-a-database/#a-id-jira-entity-properties-a-jira-entity-properties).

This operation can be accessed anonymously.

**[Permissions](#permissions) required:** *Browse Projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for the project containing the property.

## Purpose
Retrieve essential project information for management oversight and analysis

## When to Use
When you need to analyze project performance, track project metrics, or generate executive reports on project portfolio health

## Key Data Points
• **projectIdOrKey**: The project ID or project key (case sensitive).
• **propertyKey**: The project property key. Use [Get project property keys](#api-rest-api-3-project-projectIdOrKey-properties-get) to get a list of all project property keys.

## Project Analysis Value
Enables forensic analysis of project setup, configuration, and performance metrics. Critical for understanding project success factors and identifying patterns in high-performing vs struggling projects

## Usage Examples
• Executive dashboard showing project health across portfolio
• Project audit reports for compliance
• Resource allocation analysis by project
• Project timeline and milestone tracking

## Implementation
To use this data in Excel Power Query:

1. **Load the M code**: Use the function `JiraGetProjectProperties` from [jira-projectproperties.m](../assets/jira-projectproperties.m)
2. **Configure authentication**: Ensure your Parameters table includes Jira credentials
3. **Execute the query**: The function will return structured data ready for analysis

### Function Parameters
• **projectIdOrKey** (Required): The project ID or project key (case sensitive).
• **propertyKey** (Required): The project property key. Use [Get project property keys](#api-rest-api-3-project-projectIdOrKey-properties-get) to get a list of all project property keys.

### Expected Output
Structured table with expanded JSON data ready for Excel analysis

## Related Endpoints
See other endpoints in the same category for related functionality

---
*This documentation corresponds to the Jira API endpoint: `/rest/api/3/project/{projectIdOrKey}/properties/{propertyKey}`*
