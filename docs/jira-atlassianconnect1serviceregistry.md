---
title: Retrieve The Attributes Of Service Registries
description: |-
  Retrieve the attributes of given service registries.
  
  **[Permissions](#permissions) required:** Only Connect apps can make this request and the servicesIds belong to the tenant you are requesting
nav_order: 999
published: false
---

# Retrieve The Attributes Of Service Registries

## API Description
Retrieve the attributes of given service registries.

**[Permissions](#permissions) required:** Only Connect apps can make this request and the servicesIds belong to the tenant you are requesting

## Purpose
Extract specific data from Jira for project analysis and reporting

## When to Use
When you need this specific data point for project analysis or reporting requirements

## Key Data Points
• **serviceIds**: The ID of the services (the strings starting with "b:" need to be decoded in Base64).

## Project Analysis Value
Provides valuable data insights that support project management decision-making and performance analysis

## Usage Examples
• Custom reports and dashboards
• Data analysis and trend identification
• Performance monitoring and tracking

## Implementation
To use this data in Excel Power Query:

1. **Load the M code**: Use the function `JiraGetAtlassianConnect1ServiceRegistry` from [jira-atlassianconnect1serviceregistry.m](../assets/jira-atlassianconnect1serviceregistry.m)
2. **Configure authentication**: Ensure your Parameters table includes Jira credentials
3. **Execute the query**: The function will return structured data ready for analysis

### Function Parameters
• **serviceIds** (Required): The ID of the services (the strings starting with "b:" need to be decoded in Base64).

### Expected Output
Structured table with expanded JSON data ready for Excel analysis

## Related Endpoints
See other endpoints in the same category for related functionality

---
*This documentation corresponds to the Jira API endpoint: `/rest/atlassian-connect/1/service-registry`*
