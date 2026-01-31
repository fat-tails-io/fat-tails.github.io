---
title: Data Policy For Projects
description: Returns data policies for the projects specified in the request.
nav_order: 999
published: false
---

# Data Policy For Projects

## API Description
Returns data policies for the projects specified in the request.

## Purpose
Retrieve essential project information for management oversight and analysis

## When to Use
When you need to analyze project performance, track project metrics, or generate executive reports on project portfolio health

## Key Data Points
• **ids**: A list of project identifiers. This parameter accepts a comma-separated list.

## Project Analysis Value
Enables forensic analysis of project setup, configuration, and performance metrics. Critical for understanding project success factors and identifying patterns in high-performing vs struggling projects

## Usage Examples
• Executive dashboard showing project health across portfolio
• Project audit reports for compliance
• Resource allocation analysis by project
• Project timeline and milestone tracking

## Implementation
To use this data in Excel Power Query:

1. **Load the M code**: Use the function `JiraGetDataPolicyProject` from [jira-datapolicyproject.m](../assets/jira-datapolicyproject.m)
2. **Configure authentication**: Ensure your Parameters table includes Jira credentials
3. **Execute the query**: The function will return structured data ready for analysis

### Function Parameters
• **ids** (Optional): A list of project identifiers. This parameter accepts a comma-separated list.

### Expected Output
Structured table with expanded JSON data ready for Excel analysis

## Related Endpoints
See other endpoints in the same category for related functionality

---
*This documentation corresponds to the Jira API endpoint: `/rest/api/3/data-policy/project`*
