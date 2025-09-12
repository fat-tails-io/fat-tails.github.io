---
title: Bulk Issue Operation Progress
description: |-
  Use this to get the progress state for the specified bulk operation `taskId`.
  
  **[Permissions](#permissions) required:**
  
   *  Global bulk change [permission](https://support.atlassian.com/jira-cloud-administration/docs/manage-global-permissions/).
  
  If the task is running, this resource will return:
  
      {"taskId":"10779","status":"RUNNING","progressPercent":65,"submittedBy":{"accountId":"5b10a2844c20165700ede21g"},"created":1690180055963,"started":1690180056206,"updated":169018005829}
  
  If the task has completed, then this resource will return:
  
      {"processedAccessibleIssues":[10001,10002],"created":1709189449954,"progressPercent":100,"started":1709189450154,"status":"COMPLETE","submittedBy":{"accountId":"5b10a2844c20165700ede21g"},"invalidOrInaccessibleIssueCount":0,"taskId":"10000","totalIssueCount":2,"updated":1709189450354}
  
  **Note:** You can view task progress for up to 14 days from creation.
nav_order: 999
published: true
---

# Bulk Issue Operation Progress

## API Description
Use this to get the progress state for the specified bulk operation `taskId`.

**[Permissions](#permissions) required:**

 *  Global bulk change [permission](https://support.atlassian.com/jira-cloud-administration/docs/manage-global-permissions/).

If the task is running, this resource will return:

    {"taskId":"10779","status":"RUNNING","progressPercent":65,"submittedBy":{"accountId":"5b10a2844c20165700ede21g"},"created":1690180055963,"started":1690180056206,"updated":169018005829}

If the task has completed, then this resource will return:

    {"processedAccessibleIssues":[10001,10002],"created":1709189449954,"progressPercent":100,"started":1709189450154,"status":"COMPLETE","submittedBy":{"accountId":"5b10a2844c20165700ede21g"},"invalidOrInaccessibleIssueCount":0,"taskId":"10000","totalIssueCount":2,"updated":1709189450354}

**Note:** You can view task progress for up to 14 days from creation.

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

1. **Load the M code**: Use the function `JiraGetBulkQueue` from [jira-bulkqueue.m](../assets/jira-bulkqueue.m)
2. **Configure authentication**: Ensure your Parameters table includes Jira credentials
3. **Execute the query**: The function will return structured data ready for analysis

### Function Parameters
• **taskId** (Required): The ID of the task.

### Expected Output
Structured table with expanded JSON data ready for Excel analysis

## Related Endpoints
See other endpoints in the same category for related functionality

---
*This documentation corresponds to the Jira API endpoint: `/rest/api/3/bulk/queue/{taskId}`*
