---
title: Projects Paginated
description: Returns a [paginated](#pagination) list of projects visible to the user.

This operation can be accessed anonymously.

**[Permissions](#permissions) r...
nav_order: 999
published: false
---

# Projects Paginated

## Purpose
Retrieve essential project information for management oversight and analysis

## When to Use
When you need to analyze project performance, track project metrics, or generate executive reports on project portfolio health

## Key Data Points
• **startAt**: The index of the first item to return in a page of results (page offset).
• **maxResults**: The maximum number of items to return per page. Must be less than or equal to 100. If a value greater than 100 is provided, the `maxResults` parameter will default to 100.
• **orderBy**: [Order](#ordering) the results by a field.

 *  `category` Sorts by project category. A complete list of category IDs is found using [Get all project categories](#api-rest-api-3-projectCategory-get).
 *  `issueCount` Sorts by the total number of issues in each project.
 *  `key` Sorts by project key.
 *  `lastIssueUpdatedTime` Sorts by the last issue update time.
 *  `name` Sorts by project name.
 *  `owner` Sorts by project lead.
 *  `archivedDate` EXPERIMENTAL. Sorts by project archived date.
 *  `deletedDate` EXPERIMENTAL. Sorts by project deleted date.

## Project Analysis Value
Enables forensic analysis of project setup, configuration, and performance metrics. Critical for understanding project success factors and identifying patterns in high-performing vs struggling projects

## Usage Examples
• Executive dashboard showing project health across portfolio
• Project audit reports for compliance
• Resource allocation analysis by project
• Project timeline and milestone tracking

## Implementation
To use this data in Excel Power Query:

1. **Load the M code**: Use the function `JiraGetProjectSearch` from [jira-projectsearch.m](../assets/jira-projectsearch.m)
2. **Configure authentication**: Ensure your Parameters table includes Jira credentials
3. **Execute the query**: The function will return structured data ready for analysis

### Function Parameters
• **startAt** (Optional): The index of the first item to return in a page of results (page offset).
• **maxResults** (Optional): The maximum number of items to return per page. Must be less than or equal to 100. If a value greater than 100 is provided, the `maxResults` parameter will default to 100.
• **orderBy** (Optional): [Order](#ordering) the results by a field.

 *  `category` Sorts by project category. A complete list of category IDs is found using [Get all project categories](#api-rest-api-3-projectCategory-get).
 *  `issueCount` Sorts by the total number of issues in each project.
 *  `key` Sorts by project key.
 *  `lastIssueUpdatedTime` Sorts by the last issue update time.
 *  `name` Sorts by project name.
 *  `owner` Sorts by project lead.
 *  `archivedDate` EXPERIMENTAL. Sorts by project archived date.
 *  `deletedDate` EXPERIMENTAL. Sorts by project deleted date.
• **id** (Optional): The project IDs to filter the results by. To include multiple IDs, provide an ampersand-separated list. For example, `id=10000&id=10001`. Up to 50 project IDs can be provided.
• **keys** (Optional): The project keys to filter the results by. To include multiple keys, provide an ampersand-separated list. For example, `keys=PA&keys=PB`. Up to 50 project keys can be provided.
• **query** (Optional): Filter the results using a literal string. Projects with a matching `key` or `name` are returned (case insensitive).
• **typeKey** (Optional): Orders results by the [project type](https://confluence.atlassian.com/x/GwiiLQ#Jiraapplicationsoverview-Productfeaturesandprojecttypes). This parameter accepts a comma-separated list. Valid values are `business`, `service_desk`, and `software`.
• **categoryId** (Optional): The ID of the project's category. A complete list of category IDs is found using the [Get all project categories](#api-rest-api-3-projectCategory-get) operation.
• **action** (Optional): Filter results by projects for which the user can:

 *  `view` the project, meaning that they have one of the following permissions:
    
     *  *Browse projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for the project.
     *  *Administer projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for the project.
     *  *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
 *  `browse` the project, meaning that they have the *Browse projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for the project.
 *  `edit` the project, meaning that they have one of the following permissions:
    
     *  *Administer projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for the project.
     *  *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
 *  `create` the project, meaning that they have the *Create issues* [project permission](https://confluence.atlassian.com/x/yodKLg) for the project in which the issue is created.
• **expand** (Optional): Use [expand](#expansion) to include additional information in the response. This parameter accepts a comma-separated list. Expanded options include:

 *  `description` Returns the project description.
 *  `projectKeys` Returns all project keys associated with a project.
 *  `lead` Returns information about the project lead.
 *  `issueTypes` Returns all issue types associated with the project.
 *  `url` Returns the URL associated with the project.
 *  `insight` EXPERIMENTAL. Returns the insight details of total issue count and last issue update time for the project.
• **status** (Optional): EXPERIMENTAL. Filter results by project status:

 *  `live` Search live projects.
 *  `archived` Search archived projects.
 *  `deleted` Search deleted projects, those in the recycle bin.
• **properties** (Optional): EXPERIMENTAL. A list of project properties to return for the project. This parameter accepts a comma-separated list.
• **propertyQuery** (Optional): EXPERIMENTAL. A query string used to search properties. The query string cannot be specified using a JSON object. For example, to search for the value of `nested` from `{"something":{"nested":1,"other":2}}` use `[thepropertykey].something.nested=1`. Note that the propertyQuery key is enclosed in square brackets to enable searching where the propertyQuery key includes dot (.) or equals (=) characters. Note that `thepropertykey` is only returned when included in `properties`.

### Expected Output
Structured table with expanded JSON data ready for Excel analysis

## Related Endpoints
See other endpoints in the same category for related functionality

---
*This documentation corresponds to the Jira API endpoint: `/rest/api/3/project/search`*
