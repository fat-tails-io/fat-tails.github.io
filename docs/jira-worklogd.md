---
title: Ids Of Updated Worklogs
description: |-
  Returns a list of IDs and update timestamps for worklogs updated after a date and time.
  
  This resource is paginated, with a limit of 1000 worklogs per page. Each page lists worklogs from oldest to youngest. If the number of items in the date range exceeds 1000, `until` indicates the timestamp of the youngest item on the page. Also, `nextPage` provides the URL for the next page of worklogs. The `lastPage` parameter is set to true on the last page of worklogs.
  
  This resource does not return worklogs updated during the minute preceding the request.
  
  **[Permissions](#permissions) required:** Permission to access Jira, however, worklogs are only returned where either of the following is true:
  
   *  the worklog is set as *Viewable by All Users*.
   *  the user is a member of a project role or group with permission to view the worklog.
nav_order: 999
published: false
---

# Ids Of Updated Worklogs

## API Description
Returns a list of IDs and update timestamps for worklogs updated after a date and time.

This resource is paginated, with a limit of 1000 worklogs per page. Each page lists worklogs from oldest to youngest. If the number of items in the date range exceeds 1000, `until` indicates the timestamp of the youngest item on the page. Also, `nextPage` provides the URL for the next page of worklogs. The `lastPage` parameter is set to true on the last page of worklogs.

This resource does not return worklogs updated during the minute preceding the request.

**[Permissions](#permissions) required:** Permission to access Jira, however, worklogs are only returned where either of the following is true:

 *  the worklog is set as *Viewable by All Users*.
 *  the user is a member of a project role or group with permission to view the worklog.

## Purpose
Extract specific data from Jira for project analysis and reporting

## When to Use
When you need this specific data point for project analysis or reporting requirements

## Key Data Points
• **since**: The date and time, as a UNIX timestamp in milliseconds, after which updated worklogs are returned.
• **expand**: Use [expand](#expansion) to include additional information about worklogs in the response. This parameter accepts `properties` that returns the properties of each worklog.

## Project Analysis Value
Provides valuable data insights that support project management decision-making and performance analysis

## Usage Examples
• Custom reports and dashboards
• Data analysis and trend identification
• Performance monitoring and tracking

## Implementation
To use this data in Excel Power Query:

1. **Load the M code**: Use the function `JiraGetWorklogUpdated` from [jira-worklogd.m](../assets/jira-worklogd.m)
2. **Configure authentication**: Ensure your Parameters table includes Jira credentials
3. **Execute the query**: The function will return structured data ready for analysis

### Function Parameters
• **since** (Optional): The date and time, as a UNIX timestamp in milliseconds, after which updated worklogs are returned.
• **expand** (Optional): Use [expand](#expansion) to include additional information about worklogs in the response. This parameter accepts `properties` that returns the properties of each worklog.

### Expected Output
Structured table with expanded JSON data ready for Excel analysis

## Related Endpoints
See other endpoints in the same category for related functionality

---
*This documentation corresponds to the Jira API endpoint: `/rest/api/3/worklog/updated`*
