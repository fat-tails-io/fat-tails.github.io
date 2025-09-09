---
title: Application Property
description: Returns all application properties or an application property.

If you specify a value for the `key` parameter, then an application property is return...
nav_order: 999
draft: true
---

# Application Property

## Purpose
Extract specific data from Jira for project analysis and reporting

## When to Use
When you need this specific data point for project analysis or reporting requirements

## Key Data Points
• **key**: The key of the application property.
• **permissionLevel**: The permission level of all items being returned in the list.
• **keyFilter**: When a `key` isn't provided, this filters the list of results by the application property `key` using a regular expression. For example, using `jira.lf.*` will return all application properties with keys that start with *jira.lf.*.

## Project Analysis Value
Provides valuable data insights that support project management decision-making and performance analysis

## Usage Examples
• Custom reports and dashboards
• Data analysis and trend identification
• Performance monitoring and tracking

## Implementation
To use this data in Excel Power Query:

1. **Load the M code**: Use the function `JiraGetApplicationProperties` from [jira-applicationproperties.m](../assets/jira-applicationproperties.m)
2. **Configure authentication**: Ensure your Parameters table includes Jira credentials
3. **Execute the query**: The function will return structured data ready for analysis

### Function Parameters
• **key** (Optional): The key of the application property.
• **permissionLevel** (Optional): The permission level of all items being returned in the list.
• **keyFilter** (Optional): When a `key` isn't provided, this filters the list of results by the application property `key` using a regular expression. For example, using `jira.lf.*` will return all application properties with keys that start with *jira.lf.*.

### Expected Output
Structured table with expanded JSON data ready for Excel analysis

## Related Endpoints
See other endpoints in the same category for related functionality

---
*This documentation corresponds to the Jira API endpoint: `/rest/api/3/application-properties`*
