---
title: Issue Link Type
description: |-
  Returns an issue link type.
  
  To use this operation, the site must have [issue linking](https://confluence.atlassian.com/x/yoXKM) enabled.
  
  This operation can be accessed anonymously.
  
  **[Permissions](#permissions) required:** *Browse projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for a project in the site.
nav_order: 999
published: false
---

# Issue Link Type

## API Description
Returns an issue link type.

To use this operation, the site must have [issue linking](https://confluence.atlassian.com/x/yoXKM) enabled.

This operation can be accessed anonymously.

**[Permissions](#permissions) required:** *Browse projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for a project in the site.

## Purpose
Access detailed issue data for project analysis and performance tracking

## When to Use
When conducting deep-dive analysis of project delivery, identifying bottlenecks, or measuring team productivity and issue resolution patterns

## Key Data Points
• **issueLinkTypeId**: The ID of the issue link type.

## Project Analysis Value
Provides granular insights into project execution, enabling identification of process inefficiencies, resource constraints, and quality patterns that impact project success

## Usage Examples
• Burndown analysis and sprint performance
• Issue aging and resolution time analysis
• Quality metrics and defect tracking
• Team productivity and workload analysis

## Implementation
To use this data in Excel Power Query:

1. **Load the M code**: Use the function `JiraGetIssuelinktype` from [jira-issuelinktype.m](../assets/jira-issuelinktype.m)
2. **Configure authentication**: Ensure your Parameters table includes Jira credentials
3. **Execute the query**: The function will return structured data ready for analysis

### Function Parameters
• **issueLinkTypeId** (Required): The ID of the issue link type.

### Expected Output
Structured table with expanded JSON data ready for Excel analysis

## Related Endpoints
See other endpoints in the same category for related functionality

---
*This documentation corresponds to the Jira API endpoint: `/rest/api/3/issueLinkType/{issueLinkTypeId}`*
