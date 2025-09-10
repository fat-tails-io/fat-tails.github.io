---
title: App Property
description: Returns the key and value of an app's property.

**[Permissions](#permissions) required:** Only a Connect app whose key matches `addonKey` can make th...
nav_order: 999
published: false
---

# App Property

## Purpose
Extract specific data from Jira for project analysis and reporting

## When to Use
When you need this specific data point for project analysis or reporting requirements

## Key Data Points
• **addonKey**: The key of the app, as defined in its descriptor.
• **propertyKey**: The key of the property.

## Project Analysis Value
Provides valuable data insights that support project management decision-making and performance analysis

## Usage Examples
• Custom reports and dashboards
• Data analysis and trend identification
• Performance monitoring and tracking

## Implementation
To use this data in Excel Power Query:

1. **Load the M code**: Use the function `JiraGetAtlassianConnect1AddonsProperties` from [jira-atlassianconnect1addonsproperties.m](../assets/jira-atlassianconnect1addonsproperties.m)
2. **Configure authentication**: Ensure your Parameters table includes Jira credentials
3. **Execute the query**: The function will return structured data ready for analysis

### Function Parameters
• **addonKey** (Required): The key of the app, as defined in its descriptor.
• **propertyKey** (Required): The key of the property.

### Expected Output
Structured table with expanded JSON data ready for Excel analysis

## Related Endpoints
See other endpoints in the same category for related functionality

---
*This documentation corresponds to the Jira API endpoint: `/rest/atlassian-connect/1/addons/{addonKey}/properties/{propertyKey}`*
