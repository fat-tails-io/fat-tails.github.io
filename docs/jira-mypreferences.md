---
title: Preference
description: |-
  Returns the value of a preference of the current user.
  
  Note that these keys are deprecated:
  
   *  *jira.user.locale* The locale of the user. By default this is not set and the user takes the locale of the instance.
   *  *jira.user.timezone* The time zone of the user. By default this is not set and the user takes the timezone of the instance.
  
  These system preferences keys will be deprecated by 15/07/2024. You can still retrieve these keys, but it will not have any impact on Notification behaviour.
  
   *  *user.notifications.watcher* Whether the user gets notified when they are watcher.
   *  *user.notifications.assignee* Whether the user gets notified when they are assignee.
   *  *user.notifications.reporter* Whether the user gets notified when they are reporter.
   *  *user.notifications.mentions* Whether the user gets notified when they are mentions.
  
  Use [ Update a user profile](https://developer.atlassian.com/cloud/admin/user-management/rest/#api-users-account-id-manage-profile-patch) from the user management REST API to manage timezone and locale instead.
  
  **[Permissions](#permissions) required:** Permission to access Jira.
nav_order: 999
published: false
---

# Preference

## API Description
Returns the value of a preference of the current user.

Note that these keys are deprecated:

 *  *jira.user.locale* The locale of the user. By default this is not set and the user takes the locale of the instance.
 *  *jira.user.timezone* The time zone of the user. By default this is not set and the user takes the timezone of the instance.

These system preferences keys will be deprecated by 15/07/2024. You can still retrieve these keys, but it will not have any impact on Notification behaviour.

 *  *user.notifications.watcher* Whether the user gets notified when they are watcher.
 *  *user.notifications.assignee* Whether the user gets notified when they are assignee.
 *  *user.notifications.reporter* Whether the user gets notified when they are reporter.
 *  *user.notifications.mentions* Whether the user gets notified when they are mentions.

Use [ Update a user profile](https://developer.atlassian.com/cloud/admin/user-management/rest/#api-users-account-id-manage-profile-patch) from the user management REST API to manage timezone and locale instead.

**[Permissions](#permissions) required:** Permission to access Jira.

## Purpose
Extract specific data from Jira for project analysis and reporting

## When to Use
When you need this specific data point for project analysis or reporting requirements

## Key Data Points
• **key**: The key of the preference.

## Project Analysis Value
Provides valuable data insights that support project management decision-making and performance analysis

## Usage Examples
• Custom reports and dashboards
• Data analysis and trend identification
• Performance monitoring and tracking

## Implementation
To use this data in Excel Power Query:

1. **Load the M code**: Use the function `JiraGetMypreferences` from [jira-mypreferences.m](../assets/jira-mypreferences.m)
2. **Configure authentication**: Ensure your Parameters table includes Jira credentials
3. **Execute the query**: The function will return structured data ready for analysis

### Function Parameters
• **key** (Required): The key of the preference.

### Expected Output
Structured table with expanded JSON data ready for Excel analysis

## Related Endpoints
See other endpoints in the same category for related functionality

---
*This documentation corresponds to the Jira API endpoint: `/rest/api/3/mypreferences`*
