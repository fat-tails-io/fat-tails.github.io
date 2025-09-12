---
title: Fields Paginated
description: |-
  Returns a [paginated](#pagination) list of fields for Classic Jira projects. The list can include:
  
   *  all fields
   *  specific fields, by defining `id`
   *  fields that contain a string in the field name or description, by defining `query`
   *  specific fields that contain a string in the field name or description, by defining `id` and `query`
  
  Use `type` must be set to `custom` to show custom fields only.
  
  **[Permissions](#permissions) required:** Permission to access Jira.
nav_order: 999
published: false
---

# Fields Paginated

## API Description
Returns a [paginated](#pagination) list of fields for Classic Jira projects. The list can include:

 *  all fields
 *  specific fields, by defining `id`
 *  fields that contain a string in the field name or description, by defining `query`
 *  specific fields that contain a string in the field name or description, by defining `id` and `query`

Use `type` must be set to `custom` to show custom fields only.

**[Permissions](#permissions) required:** Permission to access Jira.

## Purpose
Execute complex queries to extract specific data sets for targeted analysis

## When to Use
When you need to perform advanced filtering and data extraction for specialized reports or custom analysis scenarios

## Key Data Points
• **startAt**: The index of the first item to return in a page of results (page offset).
• **maxResults**: The maximum number of items to return per page.
• **type**: The type of fields to search.

## Project Analysis Value
Provides flexible data extraction capabilities for custom analysis scenarios, enabling sophisticated filtering and reporting beyond standard metrics

## Usage Examples
• Custom filtered reports for stakeholders
• Advanced trend analysis with specific criteria
• Compliance reporting with complex filters
• Ad-hoc analysis for specific business questions

## Implementation
To use this data in Excel Power Query:

1. **Load the M code**: Use the function `JiraGetFieldSearch` from [jira-fieldsearch.m](../assets/jira-fieldsearch.m)
2. **Configure authentication**: Ensure your Parameters table includes Jira credentials
3. **Execute the query**: The function will return structured data ready for analysis

### Function Parameters
• **startAt** (Optional): The index of the first item to return in a page of results (page offset).
• **maxResults** (Optional): The maximum number of items to return per page.
• **type** (Optional): The type of fields to search.
• **id** (Optional): The IDs of the custom fields to return or, where `query` is specified, filter.
• **query** (Optional): String used to perform a case-insensitive partial match with field names or descriptions.
• **orderBy** (Optional): [Order](#ordering) the results by:

 *  `contextsCount` sorts by the number of contexts related to a field
 *  `lastUsed` sorts by the date when the value of the field last changed
 *  `name` sorts by the field name
 *  `screensCount` sorts by the number of screens related to a field
• **expand** (Optional): Use [expand](#expansion) to include additional information in the response. This parameter accepts a comma-separated list. Expand options include:

 *  `key` returns the key for each field
 *  `stableId` returns the stableId for each field
 *  `lastUsed` returns the date when the value of the field last changed
 *  `screensCount` returns the number of screens related to a field
 *  `contextsCount` returns the number of contexts related to a field
 *  `isLocked` returns information about whether the field is locked
 *  `searcherKey` returns the searcher key for each custom field
• **projectIds** (Optional): The IDs of the projects to filter the fields by. Fields belonging to project Ids that the user does not have access to will not be returned

### Expected Output
Structured table with expanded JSON data ready for Excel analysis

## Related Endpoints
See other endpoints in the same category for related functionality

---
*This documentation corresponds to the Jira API endpoint: `/rest/api/3/field/search`*
