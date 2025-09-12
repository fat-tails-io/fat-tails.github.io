---
title: Project Versions Paginated
description: |-
  Returns a [paginated](#pagination) list of all versions in a project. See the [Get project versions](#api-rest-api-3-project-projectIdOrKey-versions-get) resource if you want to get a full list of versions without pagination.
  
  This operation can be accessed anonymously.
  
  **[Permissions](#permissions) required:** *Browse Projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for the project.
nav_order: 999
published: false
---

# Project Versions Paginated

## API Description
Returns a [paginated](#pagination) list of all versions in a project. See the [Get project versions](#api-rest-api-3-project-projectIdOrKey-versions-get) resource if you want to get a full list of versions without pagination.

This operation can be accessed anonymously.

**[Permissions](#permissions) required:** *Browse Projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for the project.

## Purpose
Track project versions, releases, and associated delivery metrics

## When to Use
When you need to analyze project performance, track project metrics, or generate executive reports on project portfolio health

## Key Data Points
• **projectIdOrKey**: The project ID or project key (case sensitive).
• **startAt**: The index of the first item to return in a page of results (page offset).
• **maxResults**: The maximum number of items to return per page.

## Project Analysis Value
Enables forensic analysis of project setup, configuration, and performance metrics. Critical for understanding project success factors and identifying patterns in high-performing vs struggling projects

## Usage Examples
• Executive dashboard showing project health across portfolio
• Project audit reports for compliance
• Resource allocation analysis by project
• Project timeline and milestone tracking

## Implementation
To use this data in Excel Power Query:

1. **Load the M code**: Use the function `JiraGetProjectVersion` from [jira-projectversion.m](../assets/jira-projectversion.m)
2. **Configure authentication**: Ensure your Parameters table includes Jira credentials
3. **Execute the query**: The function will return structured data ready for analysis

### Function Parameters
• **projectIdOrKey** (Required): The project ID or project key (case sensitive).
• **startAt** (Optional): The index of the first item to return in a page of results (page offset).
• **maxResults** (Optional): The maximum number of items to return per page.
• **orderBy** (Optional): [Order](#ordering) the results by a field:

 *  `description` Sorts by version description.
 *  `name` Sorts by version name.
 *  `releaseDate` Sorts by release date, starting with the oldest date. Versions with no release date are listed last.
 *  `sequence` Sorts by the order of appearance in the user interface.
 *  `startDate` Sorts by start date, starting with the oldest date. Versions with no start date are listed last.
• **query** (Optional): Filter the results using a literal string. Versions with matching `name` or `description` are returned (case insensitive).
• **status** (Optional): A list of status values used to filter the results by version status. This parameter accepts a comma-separated list. The status values are `released`, `unreleased`, and `archived`.
• **expand** (Optional): Use [expand](#expansion) to include additional information in the response. This parameter accepts a comma-separated list. Expand options include:

 *  `issuesstatus` Returns the number of issues in each status category for each version.
 *  `operations` Returns actions that can be performed on the specified version.
 *  `driver` Returns the Atlassian account ID of the version driver.
 *  `approvers` Returns a list containing the approvers for this version.

### Expected Output
Structured table with expanded JSON data ready for Excel analysis

## Related Endpoints
See other endpoints in the same category for related functionality

---
*This documentation corresponds to the Jira API endpoint: `/rest/api/3/project/{projectIdOrKey}/version`*
