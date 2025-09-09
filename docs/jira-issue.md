---
title: Issue
description: Returns the details for an issue.

The issue is identified by its ID or key, however, if the identifier doesn't match an issue, a case-insensitive sea...
nav_order: 999
draft: true
---

# Issue

## Purpose
Access detailed issue data for project analysis and performance tracking

## When to Use
When conducting deep-dive analysis of project delivery, identifying bottlenecks, or measuring team productivity and issue resolution patterns

## Key Data Points
• **issueIdOrKey**: The ID or key of the issue.
• **fields**: A list of fields to return for the issue. This parameter accepts a comma-separated list. Use it to retrieve a subset of fields. Allowed values:

 *  `*all` Returns all fields.
 *  `*navigable` Returns navigable fields.
 *  Any issue field, prefixed with a minus to exclude.

Examples:

 *  `summary,comment` Returns only the summary and comments fields.
 *  `-description` Returns all (default) fields except description.
 *  `*navigable,-comment` Returns all navigable fields except comment.

This parameter may be specified multiple times. For example, `fields=field1,field2& fields=field3`.

Note: All fields are returned by default. This differs from [Search for issues using JQL (GET)](#api-rest-api-3-search-get) and [Search for issues using JQL (POST)](#api-rest-api-3-search-post) where the default is all navigable fields.
• **fieldsByKeys**: Whether fields in `fields` are referenced by keys rather than IDs. This parameter is useful where fields have been added by a connect app and a field's key may differ from its ID.

## Project Analysis Value
Provides granular insights into project execution, enabling identification of process inefficiencies, resource constraints, and quality patterns that impact project success

## Usage Examples
• Burndown analysis and sprint performance
• Issue aging and resolution time analysis
• Quality metrics and defect tracking
• Team productivity and workload analysis

## Implementation
To use this data in Excel Power Query:

1. **Load the M code**: Use the function `JiraGetIssue` from [jira-issue.m](../assets/jira-issue.m)
2. **Configure authentication**: Ensure your Parameters table includes Jira credentials
3. **Execute the query**: The function will return structured data ready for analysis

### Function Parameters
• **issueIdOrKey** (Required): The ID or key of the issue.
• **fields** (Optional): A list of fields to return for the issue. This parameter accepts a comma-separated list. Use it to retrieve a subset of fields. Allowed values:

 *  `*all` Returns all fields.
 *  `*navigable` Returns navigable fields.
 *  Any issue field, prefixed with a minus to exclude.

Examples:

 *  `summary,comment` Returns only the summary and comments fields.
 *  `-description` Returns all (default) fields except description.
 *  `*navigable,-comment` Returns all navigable fields except comment.

This parameter may be specified multiple times. For example, `fields=field1,field2& fields=field3`.

Note: All fields are returned by default. This differs from [Search for issues using JQL (GET)](#api-rest-api-3-search-get) and [Search for issues using JQL (POST)](#api-rest-api-3-search-post) where the default is all navigable fields.
• **fieldsByKeys** (Optional): Whether fields in `fields` are referenced by keys rather than IDs. This parameter is useful where fields have been added by a connect app and a field's key may differ from its ID.
• **expand** (Optional): Use [expand](#expansion) to include additional information about the issues in the response. This parameter accepts a comma-separated list. Expand options include:

 *  `renderedFields` Returns field values rendered in HTML format.
 *  `names` Returns the display name of each field.
 *  `schema` Returns the schema describing a field type.
 *  `transitions` Returns all possible transitions for the issue.
 *  `editmeta` Returns information about how each field can be edited.
 *  `changelog` Returns a list of recent updates to an issue, sorted by date, starting from the most recent.
 *  `versionedRepresentations` Returns a JSON array for each version of a field's value, with the highest number representing the most recent version. Note: When included in the request, the `fields` parameter is ignored.
• **properties** (Optional): A list of issue properties to return for the issue. This parameter accepts a comma-separated list. Allowed values:

 *  `*all` Returns all issue properties.
 *  Any issue property key, prefixed with a minus to exclude.

Examples:

 *  `*all` Returns all properties.
 *  `*all,-prop1` Returns all properties except `prop1`.
 *  `prop1,prop2` Returns `prop1` and `prop2` properties.

This parameter may be specified multiple times. For example, `properties=prop1,prop2& properties=prop3`.
• **updateHistory** (Optional): Whether the project in which the issue is created is added to the user's **Recently viewed** project list, as shown under **Projects** in Jira. This also populates the [JQL issues search](#api-rest-api-3-search-get) `lastViewed` field.
• **failFast** (Optional): Whether to fail the request quickly in case of an error while loading fields for an issue. For `failFast=true`, if one field fails, the entire operation fails. For `failFast=false`, the operation will continue even if a field fails. It will return a valid response, but without values for the failed field(s).

### Expected Output
Structured table with expanded JSON data ready for Excel analysis

## Related Endpoints
See other endpoints in the same category for related functionality

---
*This documentation corresponds to the Jira API endpoint: `/rest/api/3/issue/{issueIdOrKey}`*
