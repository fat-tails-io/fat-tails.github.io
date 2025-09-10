---
title: Currently Being Removed. Search For Issues Using Jql (Get)
description: |-
  Endpoint is currently being removed. [More details](https://developer.atlassian.com/changelog/#CHANGE-2046)
  
  Searches for issues using [JQL](https://confluence.atlassian.com/x/egORLQ).
  
  If the JQL query expression is too large to be encoded as a query parameter, use the [POST](#api-rest-api-3-search-post) version of this resource.
  
  This operation can be accessed anonymously.
  
  **[Permissions](#permissions) required:** Issues are included in the response where the user has:
  
   *  *Browse projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for the project containing the issue.
   *  If [issue-level security](https://confluence.atlassian.com/x/J4lKLg) is configured, issue-level security permission to view the issue.
nav_order: 999
published: false
---

# Currently Being Removed. Search For Issues Using Jql (Get)

## API Description
Endpoint is currently being removed. [More details](https://developer.atlassian.com/changelog/#CHANGE-2046)

Searches for issues using [JQL](https://confluence.atlassian.com/x/egORLQ).

If the JQL query expression is too large to be encoded as a query parameter, use the [POST](#api-rest-api-3-search-post) version of this resource.

This operation can be accessed anonymously.

**[Permissions](#permissions) required:** Issues are included in the response where the user has:

 *  *Browse projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for the project containing the issue.
 *  If [issue-level security](https://confluence.atlassian.com/x/J4lKLg) is configured, issue-level security permission to view the issue.

## Purpose
Execute complex queries to extract specific data sets for targeted analysis

## When to Use
When you need to perform advanced filtering and data extraction for specialized reports or custom analysis scenarios

## Key Data Points
• **jql**: The [JQL](https://confluence.atlassian.com/x/egORLQ) that defines the search. Note:

 *  If no JQL expression is provided, all issues are returned.
 *  `username` and `userkey` cannot be used as search terms due to privacy reasons. Use `accountId` instead.
 *  If a user has hidden their email address in their user profile, partial matches of the email address will not find the user. An exact match is required.
• **startAt**: The index of the first item to return in a page of results (page offset).
• **maxResults**: The maximum number of items to return per page. To manage page size, Jira may return fewer items per page where a large number of fields or properties are requested. The greatest number of items returned per page is achieved when requesting `id` or `key` only.

## Project Analysis Value
Provides flexible data extraction capabilities for custom analysis scenarios, enabling sophisticated filtering and reporting beyond standard metrics

## Usage Examples
• Custom filtered reports for stakeholders
• Advanced trend analysis with specific criteria
• Compliance reporting with complex filters
• Ad-hoc analysis for specific business questions

## Implementation
To use this data in Excel Power Query:

1. **Load the M code**: Use the function `JiraGetSearch` from [jira-search.m](../assets/jira-search.m)
2. **Configure authentication**: Ensure your Parameters table includes Jira credentials
3. **Execute the query**: The function will return structured data ready for analysis

### Function Parameters
• **jql** (Optional): The [JQL](https://confluence.atlassian.com/x/egORLQ) that defines the search. Note:

 *  If no JQL expression is provided, all issues are returned.
 *  `username` and `userkey` cannot be used as search terms due to privacy reasons. Use `accountId` instead.
 *  If a user has hidden their email address in their user profile, partial matches of the email address will not find the user. An exact match is required.
• **startAt** (Optional): The index of the first item to return in a page of results (page offset).
• **maxResults** (Optional): The maximum number of items to return per page. To manage page size, Jira may return fewer items per page where a large number of fields or properties are requested. The greatest number of items returned per page is achieved when requesting `id` or `key` only.
• **validateQuery** (Optional): Determines how to validate the JQL query and treat the validation results. Supported values are:

 *  `strict` Returns a 400 response code if any errors are found, along with a list of all errors (and warnings).
 *  `warn` Returns all errors as warnings.
 *  `none` No validation is performed.
 *  `true` *Deprecated* A legacy synonym for `strict`.
 *  `false` *Deprecated* A legacy synonym for `warn`.

Note: If the JQL is not correctly formed a 400 response code is returned, regardless of the `validateQuery` value.
• **fields** (Optional): A list of fields to return for each issue, use it to retrieve a subset of fields. This parameter accepts a comma-separated list. Expand options include:

 *  `*all` Returns all fields.
 *  `*navigable` Returns navigable fields.
 *  Any issue field, prefixed with a minus to exclude.

Examples:

 *  `summary,comment` Returns only the summary and comments fields.
 *  `-description` Returns all navigable (default) fields except description.
 *  `*all,-comment` Returns all fields except comments.

This parameter may be specified multiple times. For example, `fields=field1,field2&fields=field3`.

Note: All navigable fields are returned by default. This differs from [GET issue](#api-rest-api-3-issue-issueIdOrKey-get) where the default is all fields.
• **expand** (Optional): Use [expand](#expansion) to include additional information about issues in the response. This parameter accepts a comma-separated list. Expand options include:

 *  `renderedFields` Returns field values rendered in HTML format.
 *  `names` Returns the display name of each field.
 *  `schema` Returns the schema describing a field type.
 *  `transitions` Returns all possible transitions for the issue.
 *  `operations` Returns all possible operations for the issue.
 *  `editmeta` Returns information about how each field can be edited.
 *  `changelog` Returns a list of recent updates to an issue, sorted by date, starting from the most recent.
 *  `versionedRepresentations` Instead of `fields`, returns `versionedRepresentations` a JSON array containing each version of a field's value, with the highest numbered item representing the most recent version.
• **properties** (Optional): A list of issue property keys for issue properties to include in the results. This parameter accepts a comma-separated list. Multiple properties can also be provided using an ampersand separated list. For example, `properties=prop1,prop2&properties=prop3`. A maximum of 5 issue property keys can be specified.
• **fieldsByKeys** (Optional): Reference fields by their key (rather than ID).
• **failFast** (Optional): Whether to fail the request quickly in case of an error while loading fields for an issue. For `failFast=true`, if one field fails, the entire operation fails. For `failFast=false`, the operation will continue even if a field fails. It will return a valid response, but without values for the failed field(s).

### Expected Output
Structured table with expanded JSON data ready for Excel analysis

## Related Endpoints
See other endpoints in the same category for related functionality

---
*This documentation corresponds to the Jira API endpoint: `/rest/api/3/search`*
