---
title: All Screen Tab Fields
description: Returns all fields for a screen tab.

**[Permissions](#permissions) required:**

 *  *Administer Jira* [global permission](https://confluence.atlassia...
nav_order: 999
draft: true
---

# All Screen Tab Fields

## Purpose
Extract specific data from Jira for project analysis and reporting

## When to Use
When you need this specific data point for project analysis or reporting requirements

## Key Data Points
• **screenId**: The ID of the screen.
• **tabId**: The ID of the screen tab.
• **projectKey**: The key of the project.

## Project Analysis Value
Provides valuable data insights that support project management decision-making and performance analysis

## Usage Examples
• Custom reports and dashboards
• Data analysis and trend identification
• Performance monitoring and tracking

## Implementation
To use this data in Excel Power Query:

1. **Load the M code**: Use the function `JiraGetScreensTabsFields` from [jira-screenstabsfields.m](../assets/jira-screenstabsfields.m)
2. **Configure authentication**: Ensure your Parameters table includes Jira credentials
3. **Execute the query**: The function will return structured data ready for analysis

### Function Parameters
• **screenId** (Required): The ID of the screen.
• **tabId** (Required): The ID of the screen tab.
• **projectKey** (Optional): The key of the project.

### Expected Output
Structured table with expanded JSON data ready for Excel analysis

## Related Endpoints
See other endpoints in the same category for related functionality

---
*This documentation corresponds to the Jira API endpoint: `/rest/api/3/screens/{screenId}/tabs/{tabId}/fields`*
