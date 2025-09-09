---
title: Search Priorities
description: Returns a [paginated](#pagination) list of priorities. The list can contain all priorities or a subset determined by any combination of these criteria...
nav_order: 999
published: false
---

# Search Priorities

## Purpose
Execute complex queries to extract specific data sets for targeted analysis

## When to Use
When you need to perform advanced filtering and data extraction for specialized reports or custom analysis scenarios

## Key Data Points
• **startAt**: The index of the first item to return in a page of results (page offset).
• **maxResults**: The maximum number of items to return per page.
• **id**: The list of priority IDs. To include multiple IDs, provide an ampersand-separated list. For example, `id=2&id=3`.

## Project Analysis Value
Provides flexible data extraction capabilities for custom analysis scenarios, enabling sophisticated filtering and reporting beyond standard metrics

## Usage Examples
• Custom filtered reports for stakeholders
• Advanced trend analysis with specific criteria
• Compliance reporting with complex filters
• Ad-hoc analysis for specific business questions

## Implementation
To use this data in Excel Power Query:

1. **Load the M code**: Use the function `JiraGetPrioritySearch` from [jira-prioritysearch.m](../assets/jira-prioritysearch.m)
2. **Configure authentication**: Ensure your Parameters table includes Jira credentials
3. **Execute the query**: The function will return structured data ready for analysis

### Function Parameters
• **startAt** (Optional): The index of the first item to return in a page of results (page offset).
• **maxResults** (Optional): The maximum number of items to return per page.
• **id** (Optional): The list of priority IDs. To include multiple IDs, provide an ampersand-separated list. For example, `id=2&id=3`.
• **projectId** (Optional): The list of projects IDs. To include multiple IDs, provide an ampersand-separated list. For example, `projectId=10010&projectId=10111`.
• **priorityName** (Optional): The name of priority to search for.
• **onlyDefault** (Optional): Whether only the default priority is returned.
• **expand** (Optional): Use `schemes` to return the associated priority schemes for each priority. Limited to returning first 15 priority schemes per priority.

### Expected Output
Structured table with expanded JSON data ready for Excel analysis

## Related Endpoints
See other endpoints in the same category for related functionality

---
*This documentation corresponds to the Jira API endpoint: `/rest/api/3/priority/search`*
