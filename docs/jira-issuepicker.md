---
title: Issue Picker Suggestions
description: |-
  Returns lists of issues matching a query string. Use this resource to provide auto-completion suggestions when the user is looking for an issue using a word or string.
  
  This operation returns two lists:
  
   *  `History Search` which includes issues from the user's history of created, edited, or viewed issues that contain the string in the `query` parameter.
   *  `Current Search` which includes issues that match the JQL expression in `currentJQL` and contain the string in the `query` parameter.
  
  This operation can be accessed anonymously.
  
  **[Permissions](#permissions) required:** None.
nav_order: 999
published: false
---

# Issue Picker Suggestions

## API Description
Returns lists of issues matching a query string. Use this resource to provide auto-completion suggestions when the user is looking for an issue using a word or string.

This operation returns two lists:

 *  `History Search` which includes issues from the user's history of created, edited, or viewed issues that contain the string in the `query` parameter.
 *  `Current Search` which includes issues that match the JQL expression in `currentJQL` and contain the string in the `query` parameter.

This operation can be accessed anonymously.

**[Permissions](#permissions) required:** None.

## Purpose
Access detailed issue data for project analysis and performance tracking

## When to Use
When conducting deep-dive analysis of project delivery, identifying bottlenecks, or measuring team productivity and issue resolution patterns

## Key Data Points
• **query**: A string to match against text fields in the issue such as title, description, or comments.
• **currentJQL**: A JQL query defining a list of issues to search for the query term. Note that `username` and `userkey` cannot be used as search terms for this parameter, due to privacy reasons. Use `accountId` instead.
• **currentIssueKey**: The key of an issue to exclude from search results. For example, the issue the user is viewing when they perform this query.

## Project Analysis Value
Provides granular insights into project execution, enabling identification of process inefficiencies, resource constraints, and quality patterns that impact project success

## Usage Examples
• Burndown analysis and sprint performance
• Issue aging and resolution time analysis
• Quality metrics and defect tracking
• Team productivity and workload analysis

## Implementation
To use this data in Excel Power Query:

1. **Load the M code**: Use the function `JiraGetIssuePicker` from [jira-issuepicker.m](../assets/jira-issuepicker.m)
2. **Configure authentication**: Ensure your Parameters table includes Jira credentials
3. **Execute the query**: The function will return structured data ready for analysis

### Function Parameters
• **query** (Optional): A string to match against text fields in the issue such as title, description, or comments.
• **currentJQL** (Optional): A JQL query defining a list of issues to search for the query term. Note that `username` and `userkey` cannot be used as search terms for this parameter, due to privacy reasons. Use `accountId` instead.
• **currentIssueKey** (Optional): The key of an issue to exclude from search results. For example, the issue the user is viewing when they perform this query.
• **currentProjectId** (Optional): The ID of a project that suggested issues must belong to.
• **showSubTasks** (Optional): Indicate whether to include subtasks in the suggestions list.
• **showSubTaskParent** (Optional): When `currentIssueKey` is a subtask, whether to include the parent issue in the suggestions if it matches the query.

### Expected Output
Structured table with expanded JSON data ready for Excel analysis

## Related Endpoints
See other endpoints in the same category for related functionality

---
*This documentation corresponds to the Jira API endpoint: `/rest/api/3/issue/picker`*
