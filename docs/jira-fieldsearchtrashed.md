---
title: Fields In Trash Paginated
description: Returns a [paginated](#pagination) list of fields in the trash. The list may be restricted to fields whose field name or description partially match a...
nav_order: 999
published: false
---

# Fields In Trash Paginated

## Purpose
Execute complex queries to extract specific data sets for targeted analysis

## When to Use
When you need to perform advanced filtering and data extraction for specialized reports or custom analysis scenarios

## Key Data Points
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

1. **Load the M code**: Use the function `JiraGetFieldSearchTrashed` from [jira-fieldsearchtrashed.m](../assets/jira-fieldsearchtrashed.m)
2. **Configure authentication**: Ensure your Parameters table includes Jira credentials
3. **Execute the query**: The function will return structured data ready for analysis

### Function Parameters
• **startAt** (Optional): The index of the first item to return in a page of results (page offset).
• **maxResults** (Optional): The maximum number of items to return per page.
• **id** (Optional): 
• **query** (Optional): String used to perform a case-insensitive partial match with field names or descriptions.
• **expand** (Optional): 
• **orderBy** (Optional): [Order](#ordering) the results by a field:

 *  `name` sorts by the field name
 *  `trashDate` sorts by the date the field was moved to the trash
 *  `plannedDeletionDate` sorts by the planned deletion date

### Expected Output
Structured table with expanded JSON data ready for Excel analysis

## Related Endpoints
See other endpoints in the same category for related functionality

---
*This documentation corresponds to the Jira API endpoint: `/rest/api/3/field/search/trashed`*
