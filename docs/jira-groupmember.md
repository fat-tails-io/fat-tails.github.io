---
title: Users From Group
description: |-
  Returns a [paginated](#pagination) list of all users in a group.
  
  Note that users are ordered by username, however the username is not returned in the results due to privacy reasons.
  
  **[Permissions](#permissions) required:** either of:
  
   *  *Browse users and groups* [global permission](https://confluence.atlassian.com/x/x4dKLg).
   *  *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
nav_order: 999
published: false
---

# Users From Group

## API Description
Returns a [paginated](#pagination) list of all users in a group.

Note that users are ordered by username, however the username is not returned in the results due to privacy reasons.

**[Permissions](#permissions) required:** either of:

 *  *Browse users and groups* [global permission](https://confluence.atlassian.com/x/x4dKLg).
 *  *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

## Purpose
Extract specific data from Jira for project analysis and reporting

## When to Use
When you need this specific data point for project analysis or reporting requirements

## Key Data Points
• **groupname**: As a group's name can change, use of `groupId` is recommended to identify a group.  
The name of the group. This parameter cannot be used with the `groupId` parameter.
• **groupId**: The ID of the group. This parameter cannot be used with the `groupName` parameter.
• **includeInactiveUsers**: Include inactive users.

## Project Analysis Value
Provides valuable data insights that support project management decision-making and performance analysis

## Usage Examples
• Custom reports and dashboards
• Data analysis and trend identification
• Performance monitoring and tracking

## Implementation
To use this data in Excel Power Query:

1. **Load the M code**: Use the function `JiraGetGroupMember` from [jira-groupmember.m](../assets/jira-groupmember.m)
2. **Configure authentication**: Ensure your Parameters table includes Jira credentials
3. **Execute the query**: The function will return structured data ready for analysis

### Function Parameters
• **groupname** (Optional): As a group's name can change, use of `groupId` is recommended to identify a group.  
The name of the group. This parameter cannot be used with the `groupId` parameter.
• **groupId** (Optional): The ID of the group. This parameter cannot be used with the `groupName` parameter.
• **includeInactiveUsers** (Optional): Include inactive users.
• **startAt** (Optional): The index of the first item to return in a page of results (page offset).
• **maxResults** (Optional): The maximum number of items to return per page (number should be between 1 and 50).

### Expected Output
Structured table with expanded JSON data ready for Excel analysis

## Related Endpoints
See other endpoints in the same category for related functionality

---
*This documentation corresponds to the Jira API endpoint: `/rest/api/3/group/member`*
