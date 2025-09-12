---
title: Ui Modifications
description: |-
  Gets UI modifications. UI modifications can only be retrieved by Forge apps.
  
  **[Permissions](#permissions) required:** None.
  
  The new `read:app-data:jira` OAuth scope is 100% optional now, and not using it won't break your app. However, we recommend adding it to your app's scope list because we will eventually make it mandatory.
nav_order: 999
published: false
---

# Ui Modifications

## API Description
Gets UI modifications. UI modifications can only be retrieved by Forge apps.

**[Permissions](#permissions) required:** None.

The new `read:app-data:jira` OAuth scope is 100% optional now, and not using it won't break your app. However, we recommend adding it to your app's scope list because we will eventually make it mandatory.

## Purpose
Extract specific data from Jira for project analysis and reporting

## When to Use
When you need this specific data point for project analysis or reporting requirements

## Key Data Points
• **startAt**: The index of the first item to return in a page of results (page offset).
• **maxResults**: The maximum number of items to return per page.
• **expand**: Use expand to include additional information in the response. This parameter accepts a comma-separated list. Expand options include:

 *  `data` Returns UI modification data.
 *  `contexts` Returns UI modification contexts.

## Project Analysis Value
Provides valuable data insights that support project management decision-making and performance analysis

## Usage Examples
• Custom reports and dashboards
• Data analysis and trend identification
• Performance monitoring and tracking

## Implementation
To use this data in Excel Power Query:

1. **Load the M code**: Use the function `JiraGetUimodifications` from [jira-uimodifications.m](../assets/jira-uimodifications.m)
2. **Configure authentication**: Ensure your Parameters table includes Jira credentials
3. **Execute the query**: The function will return structured data ready for analysis

### Function Parameters
• **startAt** (Optional): The index of the first item to return in a page of results (page offset).
• **maxResults** (Optional): The maximum number of items to return per page.
• **expand** (Optional): Use expand to include additional information in the response. This parameter accepts a comma-separated list. Expand options include:

 *  `data` Returns UI modification data.
 *  `contexts` Returns UI modification contexts.

### Expected Output
Structured table with expanded JSON data ready for Excel analysis

## Related Endpoints
See other endpoints in the same category for related functionality

---
*This documentation corresponds to the Jira API endpoint: `/rest/api/3/uiModifications`*
