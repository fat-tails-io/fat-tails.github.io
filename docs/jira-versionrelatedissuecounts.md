---
title: Version'S Related Issues Count
description: |-
  Returns the following counts for a version:
  
   *  Number of issues where the `fixVersion` is set to the version.
   *  Number of issues where the `affectedVersion` is set to the version.
   *  Number of issues where a version custom field is set to the version.
  
  This operation can be accessed anonymously.
  
  **[Permissions](#permissions) required:** *Browse projects* project permission for the project that contains the version.
nav_order: 999
published: false
---

# Version'S Related Issues Count

## API Description
Returns the following counts for a version:

 *  Number of issues where the `fixVersion` is set to the version.
 *  Number of issues where the `affectedVersion` is set to the version.
 *  Number of issues where a version custom field is set to the version.

This operation can be accessed anonymously.

**[Permissions](#permissions) required:** *Browse projects* project permission for the project that contains the version.

## Purpose
Track project versions, releases, and associated delivery metrics

## When to Use
When you need this specific data point for project analysis or reporting requirements

## Key Data Points
• **id**: The ID of the version.

## Project Analysis Value
Provides valuable data insights that support project management decision-making and performance analysis

## Usage Examples
• Custom reports and dashboards
• Data analysis and trend identification
• Performance monitoring and tracking

## Implementation
To use this data in Excel Power Query:

1. **Load the M code**: Use the function `JiraGetVersionRelatedissuecounts` from [jira-versionrelatedissuecounts.m](../assets/jira-versionrelatedissuecounts.m)
2. **Configure authentication**: Ensure your Parameters table includes Jira credentials
3. **Execute the query**: The function will return structured data ready for analysis

### Function Parameters
• **id** (Required): The ID of the version.

### Expected Output
Structured table with expanded JSON data ready for Excel analysis

## Related Endpoints
See other endpoints in the same category for related functionality

---
*This documentation corresponds to the Jira API endpoint: `/rest/api/3/version/{id}/relatedIssueCounts`*
