---
title: Audit Records
description: |-
  Returns a list of audit records. The list can be filtered to include items:
  
   *  where each item in `filter` has at least one match in any of these fields:
      
       *  `summary`
       *  `category`
       *  `eventSource`
       *  `objectItem.name` If the object is a user, account ID is available to filter.
       *  `objectItem.parentName`
       *  `objectItem.typeName`
       *  `changedValues.changedFrom`
       *  `changedValues.changedTo`
       *  `remoteAddress`
      
      For example, if `filter` contains *man ed*, an audit record containing `summary": "User added to group"` and `"category": "group management"` is returned.
   *  created on or after a date and time.
   *  created or or before a date and time.
  
  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
nav_order: 999
published: false
---

# Audit Records

## API Description
Returns a list of audit records. The list can be filtered to include items:

 *  where each item in `filter` has at least one match in any of these fields:
    
     *  `summary`
     *  `category`
     *  `eventSource`
     *  `objectItem.name` If the object is a user, account ID is available to filter.
     *  `objectItem.parentName`
     *  `objectItem.typeName`
     *  `changedValues.changedFrom`
     *  `changedValues.changedTo`
     *  `remoteAddress`
    
    For example, if `filter` contains *man ed*, an audit record containing `summary": "User added to group"` and `"category": "group management"` is returned.
 *  created on or after a date and time.
 *  created or or before a date and time.

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

## Purpose
Extract specific data from Jira for project analysis and reporting

## When to Use
When you need this specific data point for project analysis or reporting requirements

## Key Data Points
• **offset**: The number of records to skip before returning the first result.
• **limit**: The maximum number of results to return.
• **filter**: The strings to match with audit field content, space separated.

## Project Analysis Value
Provides valuable data insights that support project management decision-making and performance analysis

## Usage Examples
• Custom reports and dashboards
• Data analysis and trend identification
• Performance monitoring and tracking

## Implementation
To use this data in Excel Power Query:

1. **Load the M code**: Use the function `JiraGetAuditingRecord` from [jira-auditingrecord.m](../assets/jira-auditingrecord.m)
2. **Configure authentication**: Ensure your Parameters table includes Jira credentials
3. **Execute the query**: The function will return structured data ready for analysis

### Function Parameters
• **offset** (Optional): The number of records to skip before returning the first result.
• **limit** (Optional): The maximum number of results to return.
• **filter** (Optional): The strings to match with audit field content, space separated.
• **from** (Optional): The date and time on or after which returned audit records must have been created. If `to` is provided `from` must be before `to` or no audit records are returned.
• **to** (Optional): The date and time on or before which returned audit results must have been created. If `from` is provided `to` must be after `from` or no audit records are returned.

### Expected Output
Structured table with expanded JSON data ready for Excel analysis

## Related Endpoints
See other endpoints in the same category for related functionality

---
*This documentation corresponds to the Jira API endpoint: `/rest/api/3/auditing/record`*
