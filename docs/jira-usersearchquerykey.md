---
title: Find User Keys By Query
description: Finds users with a structured query and returns a [paginated](#pagination) list of user keys.

This operation takes the users in the range defined by ...
nav_order: 999
draft: true
---

# Find User Keys By Query

## Purpose
Execute complex queries to extract specific data sets for targeted analysis

## When to Use
When you need to perform advanced filtering and data extraction for specialized reports or custom analysis scenarios

## Key Data Points
• **query**: The search query.
• **startAt**: The index of the first item to return in a page of results (page offset).
• **maxResult**: The maximum number of items to return per page.

## Project Analysis Value
Provides flexible data extraction capabilities for custom analysis scenarios, enabling sophisticated filtering and reporting beyond standard metrics

## Usage Examples
• Custom filtered reports for stakeholders
• Advanced trend analysis with specific criteria
• Compliance reporting with complex filters
• Ad-hoc analysis for specific business questions

## Implementation
To use this data in Excel Power Query:

1. **Load the M code**: Use the function `JiraGetUserSearchQueryKey` from [jira-usersearchquerykey.m](../assets/jira-usersearchquerykey.m)
2. **Configure authentication**: Ensure your Parameters table includes Jira credentials
3. **Execute the query**: The function will return structured data ready for analysis

### Function Parameters
• **query** (Required): The search query.
• **startAt** (Optional): The index of the first item to return in a page of results (page offset).
• **maxResult** (Optional): The maximum number of items to return per page.

### Expected Output
Structured table with expanded JSON data ready for Excel analysis

## Related Endpoints
See other endpoints in the same category for related functionality

---
*This documentation corresponds to the Jira API endpoint: `/rest/api/3/user/search/query/key`*
