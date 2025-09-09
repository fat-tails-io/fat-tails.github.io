---
title: Issue Limit Report
description: Returns all issues breaching and approaching per-issue limits.

**[Permissions](#permissions) required:**

 *  *Browse projects* [project permission](...
nav_order: 999
draft: true
---

# Issue Limit Report

## Purpose
Access detailed issue data for project analysis and performance tracking

## When to Use
When conducting deep-dive analysis of project delivery, identifying bottlenecks, or measuring team productivity and issue resolution patterns

## Key Data Points
• **isReturningKeys**: Return issue keys instead of issue ids in the response.

Usage: Add `?isReturningKeys=true` to the end of the path to request issue keys.

## Project Analysis Value
Provides granular insights into project execution, enabling identification of process inefficiencies, resource constraints, and quality patterns that impact project success

## Usage Examples
• Burndown analysis and sprint performance
• Issue aging and resolution time analysis
• Quality metrics and defect tracking
• Team productivity and workload analysis

## Implementation
To use this data in Excel Power Query:

1. **Load the M code**: Use the function `JiraGetIssueLimitReport` from [jira-issuelimitreport.m](../assets/jira-issuelimitreport.m)
2. **Configure authentication**: Ensure your Parameters table includes Jira credentials
3. **Execute the query**: The function will return structured data ready for analysis

### Function Parameters
• **isReturningKeys** (Optional): Return issue keys instead of issue ids in the response.

Usage: Add `?isReturningKeys=true` to the end of the path to request issue keys.

### Expected Output
Structured table with expanded JSON data ready for Excel analysis

## Related Endpoints
See other endpoints in the same category for related functionality

---
*This documentation corresponds to the Jira API endpoint: `/rest/api/3/issue/limit/report`*
