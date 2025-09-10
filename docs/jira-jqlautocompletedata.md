---
title: Field Reference Data (Get)
description: |-
  Returns reference data for JQL searches. This is a downloadable version of the documentation provided in [Advanced searching - fields reference](https://confluence.atlassian.com/x/gwORLQ) and [Advanced searching - functions reference](https://confluence.atlassian.com/x/hgORLQ), along with a list of JQL-reserved words. Use this information to assist with the programmatic creation of JQL queries or the validation of queries built in a custom query builder.
  
  To filter visible field details by project or collapse non-unique fields by field type then [Get field reference data (POST)](#api-rest-api-3-jql-autocompletedata-post) can be used.
  
  This operation can be accessed anonymously.
  
  **[Permissions](#permissions) required:** None.
nav_order: 999
published: false
---

# Field Reference Data (Get)

## API Description
Returns reference data for JQL searches. This is a downloadable version of the documentation provided in [Advanced searching - fields reference](https://confluence.atlassian.com/x/gwORLQ) and [Advanced searching - functions reference](https://confluence.atlassian.com/x/hgORLQ), along with a list of JQL-reserved words. Use this information to assist with the programmatic creation of JQL queries or the validation of queries built in a custom query builder.

To filter visible field details by project or collapse non-unique fields by field type then [Get field reference data (POST)](#api-rest-api-3-jql-autocompletedata-post) can be used.

This operation can be accessed anonymously.

**[Permissions](#permissions) required:** None.

## Purpose
Extract specific data from Jira for project analysis and reporting

## When to Use
When you need this specific data point for project analysis or reporting requirements

## Key Data Points
• Structured data from Jira API endpoint
• Automatically expanded nested information
• Ready for Excel analysis and reporting

## Project Analysis Value
Provides valuable data insights that support project management decision-making and performance analysis

## Usage Examples
• Custom reports and dashboards
• Data analysis and trend identification
• Performance monitoring and tracking

## Implementation
To use this data in Excel Power Query:

1. **Load the M code**: Use the function `JiraGetJqlAutocompletedata` from [jira-jqlautocompletedata.m](../assets/jira-jqlautocompletedata.m)
2. **Configure authentication**: Ensure your Parameters table includes Jira credentials
3. **Execute the query**: The function will return structured data ready for analysis

### Function Parameters
• No additional parameters required

### Expected Output
Structured table with expanded JSON data ready for Excel analysis

## Related Endpoints
See other endpoints in the same category for related functionality

---
*This documentation corresponds to the Jira API endpoint: `/rest/api/3/jql/autocompletedata`*
