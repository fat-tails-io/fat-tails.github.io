---
title: Find Users And Groups
description: |-
  Returns a list of users and groups matching a string. The string is used:
  
   *  for users, to find a case-insensitive match with display name and e-mail address. Note that if a user has hidden their email address in their user profile, partial matches of the email address will not find the user. An exact match is required.
   *  for groups, to find a case-sensitive match with group name.
  
  For example, if the string *tin* is used, records with the display name *Tina*, email address *sarah@tinplatetraining.com*, and the group *accounting* would be returned.
  
  Optionally, the search can be refined to:
  
   *  the projects and issue types associated with a custom field, such as a user picker. The search can then be further refined to return only users and groups that have permission to view specific:
      
       *  projects.
       *  issue types.
      
      If multiple projects or issue types are specified, they must be a subset of those enabled for the custom field or no results are returned. For example, if a field is enabled for projects A, B, and C then the search could be limited to projects B and C. However, if the search is limited to projects B and D, nothing is returned.
   *  not return Connect app users and groups.
   *  return groups that have a case-insensitive match with the query.
  
  The primary use case for this resource is to populate a picker field suggestion list with users or groups. To this end, the returned object includes an `html` field for each list. This field highlights the matched query term in the item name with the HTML strong tag. Also, each list is wrapped in a response object that contains a header for use in a picker, specifically *Showing X of Y matching groups*.
  
  This operation can be accessed anonymously.
  
  **[Permissions](#permissions) required:** *Browse users and groups* [global permission](https://confluence.atlassian.com/x/yodKLg).
nav_order: 999
published: false
---

# Find Users And Groups

## API Description
Returns a list of users and groups matching a string. The string is used:

 *  for users, to find a case-insensitive match with display name and e-mail address. Note that if a user has hidden their email address in their user profile, partial matches of the email address will not find the user. An exact match is required.
 *  for groups, to find a case-sensitive match with group name.

For example, if the string *tin* is used, records with the display name *Tina*, email address *sarah@tinplatetraining.com*, and the group *accounting* would be returned.

Optionally, the search can be refined to:

 *  the projects and issue types associated with a custom field, such as a user picker. The search can then be further refined to return only users and groups that have permission to view specific:
    
     *  projects.
     *  issue types.
    
    If multiple projects or issue types are specified, they must be a subset of those enabled for the custom field or no results are returned. For example, if a field is enabled for projects A, B, and C then the search could be limited to projects B and C. However, if the search is limited to projects B and D, nothing is returned.
 *  not return Connect app users and groups.
 *  return groups that have a case-insensitive match with the query.

The primary use case for this resource is to populate a picker field suggestion list with users or groups. To this end, the returned object includes an `html` field for each list. This field highlights the matched query term in the item name with the HTML strong tag. Also, each list is wrapped in a response object that contains a header for use in a picker, specifically *Showing X of Y matching groups*.

This operation can be accessed anonymously.

**[Permissions](#permissions) required:** *Browse users and groups* [global permission](https://confluence.atlassian.com/x/yodKLg).

## Purpose
Extract specific data from Jira for project analysis and reporting

## When to Use
When you need this specific data point for project analysis or reporting requirements

## Key Data Points
• **query**: The search string.
• **maxResults**: The maximum number of items to return in each list.
• **showAvatar**: Whether the user avatar should be returned. If an invalid value is provided, the default value is used.

## Project Analysis Value
Provides valuable data insights that support project management decision-making and performance analysis

## Usage Examples
• Custom reports and dashboards
• Data analysis and trend identification
• Performance monitoring and tracking

## Implementation
To use this data in Excel Power Query:

1. **Load the M code**: Use the function `JiraGetGroupuserpicker` from [jira-groupuserpicker.m](../assets/jira-groupuserpicker.m)
2. **Configure authentication**: Ensure your Parameters table includes Jira credentials
3. **Execute the query**: The function will return structured data ready for analysis

### Function Parameters
• **query** (Required): The search string.
• **maxResults** (Optional): The maximum number of items to return in each list.
• **showAvatar** (Optional): Whether the user avatar should be returned. If an invalid value is provided, the default value is used.
• **fieldId** (Optional): The custom field ID of the field this request is for.
• **projectId** (Optional): The ID of a project that returned users and groups must have permission to view. To include multiple projects, provide an ampersand-separated list. For example, `projectId=10000&projectId=10001`. This parameter is only used when `fieldId` is present.
• **issueTypeId** (Optional): The ID of an issue type that returned users and groups must have permission to view. To include multiple issue types, provide an ampersand-separated list. For example, `issueTypeId=10000&issueTypeId=10001`. Special values, such as `-1` (all standard issue types) and `-2` (all subtask issue types), are supported. This parameter is only used when `fieldId` is present.
• **avatarSize** (Optional): The size of the avatar to return. If an invalid value is provided, the default value is used.
• **caseInsensitive** (Optional): Whether the search for groups should be case insensitive.
• **excludeConnectAddons** (Optional): Whether Connect app users and groups should be excluded from the search results. If an invalid value is provided, the default value is used.

### Expected Output
Structured table with expanded JSON data ready for Excel analysis

## Related Endpoints
See other endpoints in the same category for related functionality

---
*This documentation corresponds to the Jira API endpoint: `/rest/api/3/groupuserpicker`*
