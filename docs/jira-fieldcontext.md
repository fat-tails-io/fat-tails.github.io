---
title: Custom Field Contexts
description: Returns a [paginated](#pagination) list of [ contexts](https://confluence.atlassian.com/adminjiracloud/what-are-custom-field-contexts-991923859.html) ...
nav_order: 999
draft: true
---

# Custom Field Contexts

## Purpose
Extract specific data from Jira for project analysis and reporting

## When to Use
When you need this specific data point for project analysis or reporting requirements

## Key Data Points
• **fieldId**: The ID of the custom field.
• **isAnyIssueType**: Whether to return contexts that apply to all issue types.
• **isGlobalContext**: Whether to return contexts that apply to all projects.

## Project Analysis Value
Provides valuable data insights that support project management decision-making and performance analysis

## Usage Examples
• Custom reports and dashboards
• Data analysis and trend identification
• Performance monitoring and tracking

## Implementation
To use this data in Excel Power Query:

1. **Load the M code**: Use the function `JiraGetFieldContext` from [jira-fieldcontext.m](../assets/jira-fieldcontext.m)
2. **Configure authentication**: Ensure your Parameters table includes Jira credentials
3. **Execute the query**: The function will return structured data ready for analysis

### Function Parameters
• **fieldId** (Required): The ID of the custom field.
• **isAnyIssueType** (Optional): Whether to return contexts that apply to all issue types.
• **isGlobalContext** (Optional): Whether to return contexts that apply to all projects.
• **contextId** (Optional): The list of context IDs. To include multiple contexts, separate IDs with ampersand: `contextId=10000&contextId=10001`.
• **startAt** (Optional): The index of the first item to return in a page of results (page offset).
• **maxResults** (Optional): The maximum number of items to return per page.

### Expected Output
Structured table with expanded JSON data ready for Excel analysis

## Related Endpoints
See other endpoints in the same category for related functionality

---
*This documentation corresponds to the Jira API endpoint: `/rest/api/3/field/{fieldId}/context`*
