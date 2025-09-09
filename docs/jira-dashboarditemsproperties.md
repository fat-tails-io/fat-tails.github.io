---
title: Dashboard Item Property
description: Returns the key and value of a dashboard item property.

A dashboard item enables an app to add user-specific information to a user dashboard. Dashboa...
nav_order: 999
draft: true
---

# Dashboard Item Property

## Purpose
Extract specific data from Jira for project analysis and reporting

## When to Use
When you need this specific data point for project analysis or reporting requirements

## Key Data Points
• **dashboardId**: The ID of the dashboard.
• **itemId**: The ID of the dashboard item.
• **propertyKey**: The key of the dashboard item property.

## Project Analysis Value
Provides valuable data insights that support project management decision-making and performance analysis

## Usage Examples
• Custom reports and dashboards
• Data analysis and trend identification
• Performance monitoring and tracking

## Implementation
To use this data in Excel Power Query:

1. **Load the M code**: Use the function `JiraGetDashboardItemsProperties` from [jira-dashboarditemsproperties.m](../assets/jira-dashboarditemsproperties.m)
2. **Configure authentication**: Ensure your Parameters table includes Jira credentials
3. **Execute the query**: The function will return structured data ready for analysis

### Function Parameters
• **dashboardId** (Required): The ID of the dashboard.
• **itemId** (Required): The ID of the dashboard item.
• **propertyKey** (Required): The key of the dashboard item property.

### Expected Output
Structured table with expanded JSON data ready for Excel analysis

## Related Endpoints
See other endpoints in the same category for related functionality

---
*This documentation corresponds to the Jira API endpoint: `/rest/api/3/dashboard/{dashboardId}/items/{itemId}/properties/{propertyKey}`*
