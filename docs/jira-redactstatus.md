---
title: Redaction Status
description: |-
  Retrieves the current status of a redaction job ID.
  
  The jobStatus will be one of the following:
  
   *  IN\_PROGRESS - The redaction job is currently in progress
   *  COMPLETED - The redaction job has completed successfully.
   *  PENDING - The redaction job has not started yet
nav_order: 999
published: false
---

# Redaction Status

## API Description
Retrieves the current status of a redaction job ID.

The jobStatus will be one of the following:

 *  IN\_PROGRESS - The redaction job is currently in progress
 *  COMPLETED - The redaction job has completed successfully.
 *  PENDING - The redaction job has not started yet

## Purpose
Extract specific data from Jira for project analysis and reporting

## When to Use
When you need this specific data point for project analysis or reporting requirements

## Key Data Points
• **jobId**: Redaction job id

## Project Analysis Value
Provides valuable data insights that support project management decision-making and performance analysis

## Usage Examples
• Custom reports and dashboards
• Data analysis and trend identification
• Performance monitoring and tracking

## Implementation
To use this data in Excel Power Query:

1. **Load the M code**: Use the function `JiraGetRedactStatus` from [jira-redactstatus.m](../assets/jira-redactstatus.m)
2. **Configure authentication**: Ensure your Parameters table includes Jira credentials
3. **Execute the query**: The function will return structured data ready for analysis

### Function Parameters
• **jobId** (Required): Redaction job id

### Expected Output
Structured table with expanded JSON data ready for Excel analysis

## Related Endpoints
See other endpoints in the same category for related functionality

---
*This documentation corresponds to the Jira API endpoint: `/rest/api/3/redact/status/{jobId}`*
