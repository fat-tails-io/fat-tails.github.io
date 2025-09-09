---
title: Precomputations (Apps)
description: Returns the list of a function's precomputations along with information about when they were created, updated, and last used. Each precomputation has ...
nav_order: 999
published: false
---

# Precomputations (Apps)

## Purpose
Extract specific data from Jira for project analysis and reporting

## When to Use
When you need this specific data point for project analysis or reporting requirements

## Key Data Points
• **functionKey**: The function key in format:

 *  Forge: `ari:cloud:ecosystem::extension/[App ID]/[Environment ID]/static/[Function key from manifest]`
 *  Connect: `[App key]__[Module key]`
• **startAt**: The index of the first item to return in a page of results (page offset).
• **maxResults**: The maximum number of items to return per page.

## Project Analysis Value
Provides valuable data insights that support project management decision-making and performance analysis

## Usage Examples
• Custom reports and dashboards
• Data analysis and trend identification
• Performance monitoring and tracking

## Implementation
To use this data in Excel Power Query:

1. **Load the M code**: Use the function `JiraGetJqlFunctionComputation` from [jira-jqlfunctioncomputation.m](../assets/jira-jqlfunctioncomputation.m)
2. **Configure authentication**: Ensure your Parameters table includes Jira credentials
3. **Execute the query**: The function will return structured data ready for analysis

### Function Parameters
• **functionKey** (Optional): The function key in format:

 *  Forge: `ari:cloud:ecosystem::extension/[App ID]/[Environment ID]/static/[Function key from manifest]`
 *  Connect: `[App key]__[Module key]`
• **startAt** (Optional): The index of the first item to return in a page of results (page offset).
• **maxResults** (Optional): The maximum number of items to return per page.
• **orderBy** (Optional): [Order](#ordering) the results by a field:

 *  `functionKey` Sorts by the functionKey.
 *  `used` Sorts by the used timestamp.
 *  `created` Sorts by the created timestamp.
 *  `updated` Sorts by the updated timestamp.

### Expected Output
Structured table with expanded JSON data ready for Excel analysis

## Related Endpoints
See other endpoints in the same category for related functionality

---
*This documentation corresponds to the Jira API endpoint: `/rest/api/3/jql/function/computation`*
