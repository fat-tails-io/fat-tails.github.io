---
title: Issue Type Screen Scheme Items
description: |-
  Returns a [paginated](#pagination) list of issue type screen scheme items.
  
  Only issue type screen schemes used in classic projects are returned.
  
  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
nav_order: 999
published: false
---

# Issue Type Screen Scheme Items

## API Description
Returns a [paginated](#pagination) list of issue type screen scheme items.

Only issue type screen schemes used in classic projects are returned.

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

## Purpose
Access detailed issue data for project analysis and performance tracking

## When to Use
When conducting deep-dive analysis of project delivery, identifying bottlenecks, or measuring team productivity and issue resolution patterns

## Key Data Points
• **startAt**: The index of the first item to return in a page of results (page offset).
• **maxResults**: The maximum number of items to return per page.
• **issueTypeScreenSchemeId**: The list of issue type screen scheme IDs. To include multiple issue type screen schemes, separate IDs with ampersand: `issueTypeScreenSchemeId=10000&issueTypeScreenSchemeId=10001`.

## Project Analysis Value
Provides granular insights into project execution, enabling identification of process inefficiencies, resource constraints, and quality patterns that impact project success

## Usage Examples
• Burndown analysis and sprint performance
• Issue aging and resolution time analysis
• Quality metrics and defect tracking
• Team productivity and workload analysis

## Implementation
To use this data in Excel Power Query:

1. **Load the M code**: Use the function `JiraGetIssuetypescreenschemeMapping` from [jira-issuetypescreenschememapping.m](../assets/jira-issuetypescreenschememapping.m)
2. **Configure authentication**: Ensure your Parameters table includes Jira credentials
3. **Execute the query**: The function will return structured data ready for analysis

### Function Parameters
• **startAt** (Optional): The index of the first item to return in a page of results (page offset).
• **maxResults** (Optional): The maximum number of items to return per page.
• **issueTypeScreenSchemeId** (Optional): The list of issue type screen scheme IDs. To include multiple issue type screen schemes, separate IDs with ampersand: `issueTypeScreenSchemeId=10000&issueTypeScreenSchemeId=10001`.

### Expected Output
Structured table with expanded JSON data ready for Excel analysis

## Related Endpoints
See other endpoints in the same category for related functionality

---
*This documentation corresponds to the Jira API endpoint: `/rest/api/3/issuetypescreenscheme/mapping`*
