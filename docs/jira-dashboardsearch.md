---
title: Search For Dashboards
description: Returns a [paginated](#pagination) list of dashboards. This operation is similar to [Get dashboards](#api-rest-api-3-dashboard-get) except that the re...
nav_order: 999
draft: true
---

# Search For Dashboards

## Purpose
Execute complex queries to extract specific data sets for targeted analysis

## When to Use
When you need to perform advanced filtering and data extraction for specialized reports or custom analysis scenarios

## Key Data Points
• **dashboardName**: String used to perform a case-insensitive partial match with `name`.
• **accountId**: User account ID used to return dashboards with the matching `owner.accountId`. This parameter cannot be used with the `owner` parameter.
• **owner**: This parameter is deprecated because of privacy changes. Use `accountId` instead. See the [migration guide](https://developer.atlassian.com/cloud/jira/platform/deprecation-notice-user-privacy-api-migration-guide/) for details. User name used to return dashboards with the matching `owner.name`. This parameter cannot be used with the `accountId` parameter.

## Project Analysis Value
Provides flexible data extraction capabilities for custom analysis scenarios, enabling sophisticated filtering and reporting beyond standard metrics

## Usage Examples
• Custom filtered reports for stakeholders
• Advanced trend analysis with specific criteria
• Compliance reporting with complex filters
• Ad-hoc analysis for specific business questions

## Implementation
To use this data in Excel Power Query:

1. **Load the M code**: Use the function `JiraGetDashboardSearch` from [jira-dashboardsearch.m](../assets/jira-dashboardsearch.m)
2. **Configure authentication**: Ensure your Parameters table includes Jira credentials
3. **Execute the query**: The function will return structured data ready for analysis

### Function Parameters
• **dashboardName** (Optional): String used to perform a case-insensitive partial match with `name`.
• **accountId** (Optional): User account ID used to return dashboards with the matching `owner.accountId`. This parameter cannot be used with the `owner` parameter.
• **owner** (Optional): This parameter is deprecated because of privacy changes. Use `accountId` instead. See the [migration guide](https://developer.atlassian.com/cloud/jira/platform/deprecation-notice-user-privacy-api-migration-guide/) for details. User name used to return dashboards with the matching `owner.name`. This parameter cannot be used with the `accountId` parameter.
• **groupname** (Optional): As a group's name can change, use of `groupId` is recommended. Group name used to return dashboards that are shared with a group that matches `sharePermissions.group.name`. This parameter cannot be used with the `groupId` parameter.
• **groupId** (Optional): Group ID used to return dashboards that are shared with a group that matches `sharePermissions.group.groupId`. This parameter cannot be used with the `groupname` parameter.
• **projectId** (Optional): Project ID used to returns dashboards that are shared with a project that matches `sharePermissions.project.id`.
• **orderBy** (Optional): [Order](#ordering) the results by a field:

 *  `description` Sorts by dashboard description. Note that this sort works independently of whether the expand to display the description field is in use.
 *  `favourite_count` Sorts by dashboard popularity.
 *  `id` Sorts by dashboard ID.
 *  `is_favourite` Sorts by whether the dashboard is marked as a favorite.
 *  `name` Sorts by dashboard name.
 *  `owner` Sorts by dashboard owner name.
• **startAt** (Optional): The index of the first item to return in a page of results (page offset).
• **maxResults** (Optional): The maximum number of items to return per page.
• **status** (Optional): The status to filter by. It may be active, archived or deleted.
• **expand** (Optional): Use [expand](#expansion) to include additional information about dashboard in the response. This parameter accepts a comma-separated list. Expand options include:

 *  `description` Returns the description of the dashboard.
 *  `owner` Returns the owner of the dashboard.
 *  `viewUrl` Returns the URL that is used to view the dashboard.
 *  `favourite` Returns `isFavourite`, an indicator of whether the user has set the dashboard as a favorite.
 *  `favouritedCount` Returns `popularity`, a count of how many users have set this dashboard as a favorite.
 *  `sharePermissions` Returns details of the share permissions defined for the dashboard.
 *  `editPermissions` Returns details of the edit permissions defined for the dashboard.
 *  `isWritable` Returns whether the current user has permission to edit the dashboard.

### Expected Output
Structured table with expanded JSON data ready for Excel analysis

## Related Endpoints
See other endpoints in the same category for related functionality

---
*This documentation corresponds to the Jira API endpoint: `/rest/api/3/dashboard/search`*
