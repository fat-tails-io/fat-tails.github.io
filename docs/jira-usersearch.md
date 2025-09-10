---
title: Find Users
description: |-
  Returns a list of active users that match the search string and property.
  
  This operation first applies a filter to match the search string and property, and then takes the filtered users in the range defined by `startAt` and `maxResults`, up to the thousandth user. To get all the users who match the search string and property, use [Get all users](#api-rest-api-3-users-search-get) and filter the records in your code.
  
  This operation can be accessed anonymously.
  
  Privacy controls are applied to the response based on the users' preferences. This could mean, for example, that the user's email address is hidden. See the [Profile visibility overview](https://developer.atlassian.com/cloud/jira/platform/profile-visibility/) for more details.
  
  **[Permissions](#permissions) required:** *Browse users and groups* [global permission](https://confluence.atlassian.com/x/x4dKLg). Anonymous calls or calls by users without the required permission return empty search results.
nav_order: 999
published: false
---

# Find Users

## API Description
Returns a list of active users that match the search string and property.

This operation first applies a filter to match the search string and property, and then takes the filtered users in the range defined by `startAt` and `maxResults`, up to the thousandth user. To get all the users who match the search string and property, use [Get all users](#api-rest-api-3-users-search-get) and filter the records in your code.

This operation can be accessed anonymously.

Privacy controls are applied to the response based on the users' preferences. This could mean, for example, that the user's email address is hidden. See the [Profile visibility overview](https://developer.atlassian.com/cloud/jira/platform/profile-visibility/) for more details.

**[Permissions](#permissions) required:** *Browse users and groups* [global permission](https://confluence.atlassian.com/x/x4dKLg). Anonymous calls or calls by users without the required permission return empty search results.

## Purpose
Execute complex queries to extract specific data sets for targeted analysis

## When to Use
When you need to perform advanced filtering and data extraction for specialized reports or custom analysis scenarios

## Key Data Points
• **query**: A query string that is matched against user attributes ( `displayName`, and `emailAddress`) to find relevant users. The string can match the prefix of the attribute's value. For example, *query=john* matches a user with a `displayName` of *John Smith* and a user with an `emailAddress` of *johnson@example.com*. Required, unless `accountId` or `property` is specified.
• **accountId**: A query string that is matched exactly against a user `accountId`. Required, unless `query` or `property` is specified.

## Project Analysis Value
Provides flexible data extraction capabilities for custom analysis scenarios, enabling sophisticated filtering and reporting beyond standard metrics

## Usage Examples
• Custom filtered reports for stakeholders
• Advanced trend analysis with specific criteria
• Compliance reporting with complex filters
• Ad-hoc analysis for specific business questions

## Implementation
To use this data in Excel Power Query:

1. **Load the M code**: Use the function `JiraGetUserSearch` from [jira-usersearch.m](../assets/jira-usersearch.m)
2. **Configure authentication**: Ensure your Parameters table includes Jira credentials
3. **Execute the query**: The function will return structured data ready for analysis

### Function Parameters
• **query** (Optional): A query string that is matched against user attributes ( `displayName`, and `emailAddress`) to find relevant users. The string can match the prefix of the attribute's value. For example, *query=john* matches a user with a `displayName` of *John Smith* and a user with an `emailAddress` of *johnson@example.com*. Required, unless `accountId` or `property` is specified.
• **username** (Optional): 
• **accountId** (Optional): A query string that is matched exactly against a user `accountId`. Required, unless `query` or `property` is specified.
• **startAt** (Optional): The index of the first item to return in a page of filtered results (page offset).
• **maxResults** (Optional): The maximum number of items to return per page.
• **property** (Optional): A query string used to search properties. Property keys are specified by path, so property keys containing dot (.) or equals (=) characters cannot be used. The query string cannot be specified using a JSON object. Example: To search for the value of `nested` from `{"something":{"nested":1,"other":2}}` use `thepropertykey.something.nested=1`. Required, unless `accountId` or `query` is specified.

### Expected Output
Structured table with expanded JSON data ready for Excel analysis

## Related Endpoints
See other endpoints in the same category for related functionality

---
*This documentation corresponds to the Jira API endpoint: `/rest/api/3/user/search`*
