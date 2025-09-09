---
title: Available Transitions
description: Use this API to retrieve a list of transitions available for the specified issues that can be used or bulk transition operations. You can submit eithe...
nav_order: 999
draft: true
---

# Available Transitions

## Purpose
Access detailed issue data for project analysis and performance tracking

## When to Use
When conducting deep-dive analysis of project delivery, identifying bottlenecks, or measuring team productivity and issue resolution patterns

## Key Data Points
• **issueIdsOrKeys**: Comma (,) separated Ids or keys of the issues to get transitions available for them.
• **endingBefore**: (Optional)The end cursor for use in pagination.
• **startingAfter**: (Optional)The start cursor for use in pagination.

## Project Analysis Value
Provides granular insights into project execution, enabling identification of process inefficiencies, resource constraints, and quality patterns that impact project success

## Usage Examples
• Burndown analysis and sprint performance
• Issue aging and resolution time analysis
• Quality metrics and defect tracking
• Team productivity and workload analysis

## Implementation
To use this data in Excel Power Query:

1. **Load the M code**: Use the function `JiraGetBulkIssuesTransition` from [jira-bulkissuestransition.m](../assets/jira-bulkissuestransition.m)
2. **Configure authentication**: Ensure your Parameters table includes Jira credentials
3. **Execute the query**: The function will return structured data ready for analysis

### Function Parameters
• **issueIdsOrKeys** (Required): Comma (,) separated Ids or keys of the issues to get transitions available for them.
• **endingBefore** (Optional): (Optional)The end cursor for use in pagination.
• **startingAfter** (Optional): (Optional)The start cursor for use in pagination.

### Expected Output
Structured table with expanded JSON data ready for Excel analysis

## Related Endpoints
See other endpoints in the same category for related functionality

---
*This documentation corresponds to the Jira API endpoint: `/rest/api/3/bulk/issues/transition`*
