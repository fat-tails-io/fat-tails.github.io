---
title: Component Issues Count
description: |-
  Returns the counts of issues assigned to the component.
  
  This operation can be accessed anonymously.
  
  **Deprecation notice:** The required OAuth 2.0 scopes will be updated on June 15, 2024.
  
   *  **Classic**: `read:jira-work`
   *  **Granular**: `read:field:jira`, `read:project.component:jira`
  
  **[Permissions](#permissions) required:** None.
nav_order: 999
published: false
---

# Component Issues Count

## API Description
Returns the counts of issues assigned to the component.

This operation can be accessed anonymously.

**Deprecation notice:** The required OAuth 2.0 scopes will be updated on June 15, 2024.

 *  **Classic**: `read:jira-work`
 *  **Granular**: `read:field:jira`, `read:project.component:jira`

**[Permissions](#permissions) required:** None.

## Purpose
Analyze project components and their associated issues for better project organization understanding

## When to Use
When you need this specific data point for project analysis or reporting requirements

## Key Data Points
• **id**: The ID of the component.

## Project Analysis Value
Provides valuable data insights that support project management decision-making and performance analysis

## Usage Examples
• Custom reports and dashboards
• Data analysis and trend identification
• Performance monitoring and tracking

## Implementation
To use this data in Excel Power Query:

1. **Load the M code**: Use the function `JiraGetComponentRelatedissuecounts` from [jira-componentrelatedissuecounts.m](../assets/jira-componentrelatedissuecounts.m)
2. **Configure authentication**: Ensure your Parameters table includes Jira credentials
3. **Execute the query**: The function will return structured data ready for analysis

### Function Parameters
• **id** (Required): The ID of the component.

### Expected Output
Structured table with expanded JSON data ready for Excel analysis

## Related Endpoints
See other endpoints in the same category for related functionality

---
*This documentation corresponds to the Jira API endpoint: `/rest/api/3/component/{id}/relatedIssueCounts`*
