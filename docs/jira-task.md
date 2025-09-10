---
title: Task
description: |-
  Returns the status of a [long-running asynchronous task](#async).
  
  When a task has finished, this operation returns the JSON blob applicable to the task. See the documentation of the operation that created the task for details. Task details are not permanently retained. As of September 2019, details are retained for 14 days although this period may change without notice.
  
  **Deprecation notice:** The required OAuth 2.0 scopes will be updated on June 15, 2024.
  
   *  `read:jira-work`
  
  **[Permissions](#permissions) required:** either of:
  
   *  *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
   *  Creator of the task.
nav_order: 999
published: false
---

# Task

## API Description
Returns the status of a [long-running asynchronous task](#async).

When a task has finished, this operation returns the JSON blob applicable to the task. See the documentation of the operation that created the task for details. Task details are not permanently retained. As of September 2019, details are retained for 14 days although this period may change without notice.

**Deprecation notice:** The required OAuth 2.0 scopes will be updated on June 15, 2024.

 *  `read:jira-work`

**[Permissions](#permissions) required:** either of:

 *  *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
 *  Creator of the task.

## Purpose
Extract specific data from Jira for project analysis and reporting

## When to Use
When you need this specific data point for project analysis or reporting requirements

## Key Data Points
• **taskId**: The ID of the task.

## Project Analysis Value
Provides valuable data insights that support project management decision-making and performance analysis

## Usage Examples
• Custom reports and dashboards
• Data analysis and trend identification
• Performance monitoring and tracking

## Implementation
To use this data in Excel Power Query:

1. **Load the M code**: Use the function `JiraGetTask` from [jira-task.m](../assets/jira-task.m)
2. **Configure authentication**: Ensure your Parameters table includes Jira credentials
3. **Execute the query**: The function will return structured data ready for analysis

### Function Parameters
• **taskId** (Required): The ID of the task.

### Expected Output
Structured table with expanded JSON data ready for Excel analysis

## Related Endpoints
See other endpoints in the same category for related functionality

---
*This documentation corresponds to the Jira API endpoint: `/rest/api/3/task/{taskId}`*
