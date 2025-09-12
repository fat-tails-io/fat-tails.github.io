---
title: Find Users By Query
description: |-
  Finds users with a structured query and returns a [paginated](#pagination) list of user details.
  
  This operation takes the users in the range defined by `startAt` and `maxResults`, up to the thousandth user, and then returns only the users from that range that match the structured query. This means the operation usually returns fewer users than specified in `maxResults`. To get all the users who match the structured query, use [Get all users](#api-rest-api-3-users-search-get) and filter the records in your code.
  
  **[Permissions](#permissions) required:** *Browse users and groups* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  
  The query statements are:
  
   *  `is assignee of PROJ` Returns the users that are assignees of at least one issue in project *PROJ*.
   *  `is assignee of (PROJ-1, PROJ-2)` Returns users that are assignees on the issues *PROJ-1* or *PROJ-2*.
   *  `is reporter of (PROJ-1, PROJ-2)` Returns users that are reporters on the issues *PROJ-1* or *PROJ-2*.
   *  `is watcher of (PROJ-1, PROJ-2)` Returns users that are watchers on the issues *PROJ-1* or *PROJ-2*.
   *  `is voter of (PROJ-1, PROJ-2)` Returns users that are voters on the issues *PROJ-1* or *PROJ-2*.
   *  `is commenter of (PROJ-1, PROJ-2)` Returns users that have posted a comment on the issues *PROJ-1* or *PROJ-2*.
   *  `is transitioner of (PROJ-1, PROJ-2)` Returns users that have performed a transition on issues *PROJ-1* or *PROJ-2*.
   *  `[propertyKey].entity.property.path is "property value"` Returns users with the entity property value. For example, if user property `location` is set to value `{"office": {"country": "AU", "city": "Sydney"}}`, then it's possible to use `[location].office.city is "Sydney"` to match the user.
  
  The list of issues can be extended as needed, as in *(PROJ-1, PROJ-2, ... PROJ-n)*. Statements can be combined using the `AND` and `OR` operators to form more complex queries. For example:
  
  `is assignee of PROJ AND [propertyKey].entity.property.path is "property value"`
nav_order: 999
published: false
---

# Find Users By Query

## API Description
Finds users with a structured query and returns a [paginated](#pagination) list of user details.

This operation takes the users in the range defined by `startAt` and `maxResults`, up to the thousandth user, and then returns only the users from that range that match the structured query. This means the operation usually returns fewer users than specified in `maxResults`. To get all the users who match the structured query, use [Get all users](#api-rest-api-3-users-search-get) and filter the records in your code.

**[Permissions](#permissions) required:** *Browse users and groups* [global permission](https://confluence.atlassian.com/x/x4dKLg).

The query statements are:

 *  `is assignee of PROJ` Returns the users that are assignees of at least one issue in project *PROJ*.
 *  `is assignee of (PROJ-1, PROJ-2)` Returns users that are assignees on the issues *PROJ-1* or *PROJ-2*.
 *  `is reporter of (PROJ-1, PROJ-2)` Returns users that are reporters on the issues *PROJ-1* or *PROJ-2*.
 *  `is watcher of (PROJ-1, PROJ-2)` Returns users that are watchers on the issues *PROJ-1* or *PROJ-2*.
 *  `is voter of (PROJ-1, PROJ-2)` Returns users that are voters on the issues *PROJ-1* or *PROJ-2*.
 *  `is commenter of (PROJ-1, PROJ-2)` Returns users that have posted a comment on the issues *PROJ-1* or *PROJ-2*.
 *  `is transitioner of (PROJ-1, PROJ-2)` Returns users that have performed a transition on issues *PROJ-1* or *PROJ-2*.
 *  `[propertyKey].entity.property.path is "property value"` Returns users with the entity property value. For example, if user property `location` is set to value `{"office": {"country": "AU", "city": "Sydney"}}`, then it's possible to use `[location].office.city is "Sydney"` to match the user.

The list of issues can be extended as needed, as in *(PROJ-1, PROJ-2, ... PROJ-n)*. Statements can be combined using the `AND` and `OR` operators to form more complex queries. For example:

`is assignee of PROJ AND [propertyKey].entity.property.path is "property value"`

## Purpose
Execute complex queries to extract specific data sets for targeted analysis

## When to Use
When you need to perform advanced filtering and data extraction for specialized reports or custom analysis scenarios

## Key Data Points
• **query**: The search query.
• **startAt**: The index of the first item to return in a page of results (page offset).
• **maxResults**: The maximum number of items to return per page.

## Project Analysis Value
Provides flexible data extraction capabilities for custom analysis scenarios, enabling sophisticated filtering and reporting beyond standard metrics

## Usage Examples
• Custom filtered reports for stakeholders
• Advanced trend analysis with specific criteria
• Compliance reporting with complex filters
• Ad-hoc analysis for specific business questions

## Implementation
To use this data in Excel Power Query:

1. **Load the M code**: Use the function `JiraGetUserSearchQuery` from [jira-usersearchquery.m](../assets/jira-usersearchquery.m)
2. **Configure authentication**: Ensure your Parameters table includes Jira credentials
3. **Execute the query**: The function will return structured data ready for analysis

### Function Parameters
• **query** (Required): The search query.
• **startAt** (Optional): The index of the first item to return in a page of results (page offset).
• **maxResults** (Optional): The maximum number of items to return per page.

### Expected Output
Structured table with expanded JSON data ready for Excel analysis

## Related Endpoints
See other endpoints in the same category for related functionality

---
*This documentation corresponds to the Jira API endpoint: `/rest/api/3/user/search/query`*
