---
title: Search For Issues Using Jql Enhanced Search (Get)
description: Searches for issues using [JQL](https://confluence.atlassian.com/x/egORLQ). Recent updates might not be immediately visible in the returned search res...
nav_order: 999
published: false
---

# Search For Issues Using Jql Enhanced Search (Get)

## Purpose
Execute complex queries to extract specific data sets for targeted analysis

## When to Use
When you need to perform advanced filtering and data extraction for specialized reports or custom analysis scenarios

## Key Data Points
• **jql**: A [JQL](https://confluence.atlassian.com/x/egORLQ) expression. For performance reasons, this parameter requires a bounded query. A bounded query is a query with a search restriction.

 *  Example of an unbounded query: `order by key desc`.
 *  Example of a bounded query: `assignee = currentUser() order by key`.

Additionally, `orderBy` clause can contain a maximum of 7 fields.
• **nextPageToken**: The token for a page to fetch that is not the first page. The first page has a `nextPageToken` of `null`. Use the `nextPageToken` to fetch the next page of issues.

Note: The `nextPageToken` field is **not included** in the response for the last page, indicating there is no next page.
• **maxResults**: The maximum number of items to return per page. To manage page size, API may return fewer items per page where a large number of fields or properties are requested. The greatest number of items returned per page is achieved when requesting `id` or `key` only. It returns max 5000 issues.

## Project Analysis Value
Provides flexible data extraction capabilities for custom analysis scenarios, enabling sophisticated filtering and reporting beyond standard metrics

## Usage Examples
• Custom filtered reports for stakeholders
• Advanced trend analysis with specific criteria
• Compliance reporting with complex filters
• Ad-hoc analysis for specific business questions

## Implementation
To use this data in Excel Power Query:

1. **Load the M code**: Use the function `JiraGetSearchJql` from [jira-searchjql.m](../assets/jira-searchjql.m)
2. **Configure authentication**: Ensure your Parameters table includes Jira credentials
3. **Execute the query**: The function will return structured data ready for analysis

### Function Parameters
• **jql** (Optional): A [JQL](https://confluence.atlassian.com/x/egORLQ) expression. For performance reasons, this parameter requires a bounded query. A bounded query is a query with a search restriction.

 *  Example of an unbounded query: `order by key desc`.
 *  Example of a bounded query: `assignee = currentUser() order by key`.

Additionally, `orderBy` clause can contain a maximum of 7 fields.
• **nextPageToken** (Optional): The token for a page to fetch that is not the first page. The first page has a `nextPageToken` of `null`. Use the `nextPageToken` to fetch the next page of issues.

Note: The `nextPageToken` field is **not included** in the response for the last page, indicating there is no next page.
• **maxResults** (Optional): The maximum number of items to return per page. To manage page size, API may return fewer items per page where a large number of fields or properties are requested. The greatest number of items returned per page is achieved when requesting `id` or `key` only. It returns max 5000 issues.
• **fields** (Optional): A list of fields to return for each issue, use it to retrieve a subset of fields. This parameter accepts a comma-separated list. Expand options include:

 *  `*all` Returns all fields.
 *  `*navigable` Returns navigable fields.
 *  `id` Returns only issue IDs.
 *  Any issue field, prefixed with a minus to exclude.

The default is `id`.

Examples:

 *  `summary,comment` Returns only the summary and comments fields only.
 *  `-description` Returns all navigable (default) fields except description.
 *  `*all,-comment` Returns all fields except comments.

Multiple `fields` parameters can be included in a request.

Note: By default, this resource returns IDs only. This differs from [GET issue](#api-rest-api-3-issue-issueIdOrKey-get) where the default is all fields.
• **expand** (Optional): Use [expand](#expansion) to include additional information about issues in the response. Note that, unlike the majority of instances where `expand` is specified, `expand` is defined as a comma-delimited string of values. The expand options are:

 *  `renderedFields` Returns field values rendered in HTML format.
 *  `names` Returns the display name of each field.
 *  `schema` Returns the schema describing a field type.
 *  `transitions` Returns all possible transitions for the issue.
 *  `operations` Returns all possible operations for the issue.
 *  `editmeta` Returns information about how each field can be edited.
 *  `changelog` Returns a list of recent updates to an issue, sorted by date, starting from the most recent.
 *  `versionedRepresentations` Instead of `fields`, returns `versionedRepresentations` a JSON array containing each version of a field's value, with the highest numbered item representing the most recent version.

Examples: `"names,changelog"` Returns the display name of each field as well as a list of recent updates to an issue.
• **properties** (Optional): A list of up to 5 issue properties to include in the results. This parameter accepts a comma-separated list.
• **fieldsByKeys** (Optional): Reference fields by their key (rather than ID). The default is `false`.
• **failFast** (Optional): Fail this request early if we can't retrieve all field data.
• **reconcileIssues** (Optional): Strong consistency issue ids to be reconciled with search results. Accepts max 50 ids

### Expected Output
Structured table with expanded JSON data ready for Excel analysis

## Related Endpoints
See other endpoints in the same category for related functionality

---
*This documentation corresponds to the Jira API endpoint: `/rest/api/3/search/jql`*
