---
title: Failed Webhooks
description: |-
  Returns webhooks that have recently failed to be delivered to the requesting app after the maximum number of retries.
  
  After 72 hours the failure may no longer be returned by this operation.
  
  The oldest failure is returned first.
  
  This method uses a cursor-based pagination. To request the next page use the failure time of the last webhook on the list as the `failedAfter` value or use the URL provided in `next`.
  
  **[Permissions](#permissions) required:** Only [Connect apps](https://developer.atlassian.com/cloud/jira/platform/index/#connect-apps) can use this operation.
nav_order: 999
published: false
---

# Failed Webhooks

## API Description
Returns webhooks that have recently failed to be delivered to the requesting app after the maximum number of retries.

After 72 hours the failure may no longer be returned by this operation.

The oldest failure is returned first.

This method uses a cursor-based pagination. To request the next page use the failure time of the last webhook on the list as the `failedAfter` value or use the URL provided in `next`.

**[Permissions](#permissions) required:** Only [Connect apps](https://developer.atlassian.com/cloud/jira/platform/index/#connect-apps) can use this operation.

## Purpose
Extract specific data from Jira for project analysis and reporting

## When to Use
When you need this specific data point for project analysis or reporting requirements

## Key Data Points
• **maxResults**: The maximum number of webhooks to return per page. If obeying the maxResults directive would result in records with the same failure time being split across pages, the directive is ignored and all records with the same failure time included on the page.
• **after**: The time after which any webhook failure must have occurred for the record to be returned, expressed as milliseconds since the UNIX epoch.

## Project Analysis Value
Provides valuable data insights that support project management decision-making and performance analysis

## Usage Examples
• Custom reports and dashboards
• Data analysis and trend identification
• Performance monitoring and tracking

## Implementation
To use this data in Excel Power Query:

1. **Load the M code**: Use the function `JiraGetWebhookFailed` from [jira-webhookfailed.m](../assets/jira-webhookfailed.m)
2. **Configure authentication**: Ensure your Parameters table includes Jira credentials
3. **Execute the query**: The function will return structured data ready for analysis

### Function Parameters
• **maxResults** (Optional): The maximum number of webhooks to return per page. If obeying the maxResults directive would result in records with the same failure time being split across pages, the directive is ignored and all records with the same failure time included on the page.
• **after** (Optional): The time after which any webhook failure must have occurred for the record to be returned, expressed as milliseconds since the UNIX epoch.

### Expected Output
Structured table with expanded JSON data ready for Excel analysis

## Related Endpoints
See other endpoints in the same category for related functionality

---
*This documentation corresponds to the Jira API endpoint: `/rest/api/3/webhook/failed`*
