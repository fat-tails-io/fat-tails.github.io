---
title: Approximate Application License Count
description: Returns the total approximate number of user accounts for a single Jira license. Note that this information is cached with a 7-day lifecycle and could...
nav_order: 999
draft: true
---

# Approximate Application License Count

## Purpose
Extract specific data from Jira for project analysis and reporting

## When to Use
When you need this specific data point for project analysis or reporting requirements

## Key Data Points
• **applicationKey**: The ID of the application, represents a specific version of Jira.

## Project Analysis Value
Provides valuable data insights that support project management decision-making and performance analysis

## Usage Examples
• Custom reports and dashboards
• Data analysis and trend identification
• Performance monitoring and tracking

## Implementation
To use this data in Excel Power Query:

1. **Load the M code**: Use the function `JiraGetLicenseApproximatelicensecountProduct` from [jira-licenseapproximatelicensecountproduct.m](../assets/jira-licenseapproximatelicensecountproduct.m)
2. **Configure authentication**: Ensure your Parameters table includes Jira credentials
3. **Execute the query**: The function will return structured data ready for analysis

### Function Parameters
• **applicationKey** (Required): The ID of the application, represents a specific version of Jira.

### Expected Output
Structured table with expanded JSON data ready for Excel analysis

## Related Endpoints
See other endpoints in the same category for related functionality

---
*This documentation corresponds to the Jira API endpoint: `/rest/api/3/license/approximateLicenseCount/product/{applicationKey}`*
