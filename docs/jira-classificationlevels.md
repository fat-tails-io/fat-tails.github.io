---
title: All Classification Levels
description: Returns all classification levels.

**[Permissions](#permissions) required:** None.
nav_order: 999
draft: true
---

# All Classification Levels

## Purpose
Extract specific data from Jira for project analysis and reporting

## When to Use
When you need this specific data point for project analysis or reporting requirements

## Key Data Points
• **status**: Optional set of statuses to filter by.
• **orderBy**: Ordering of the results by a given field. If not provided, values will not be sorted.

## Project Analysis Value
Provides valuable data insights that support project management decision-making and performance analysis

## Usage Examples
• Custom reports and dashboards
• Data analysis and trend identification
• Performance monitoring and tracking

## Implementation
To use this data in Excel Power Query:

1. **Load the M code**: Use the function `JiraGetClassificationLevels` from [jira-classificationlevels.m](../assets/jira-classificationlevels.m)
2. **Configure authentication**: Ensure your Parameters table includes Jira credentials
3. **Execute the query**: The function will return structured data ready for analysis

### Function Parameters
• **status** (Optional): Optional set of statuses to filter by.
• **orderBy** (Optional): Ordering of the results by a given field. If not provided, values will not be sorted.

### Expected Output
Structured table with expanded JSON data ready for Excel analysis

## Related Endpoints
See other endpoints in the same category for related functionality

---
*This documentation corresponds to the Jira API endpoint: `/rest/api/3/classification-levels`*
