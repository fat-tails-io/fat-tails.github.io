---
title: Validate Project Key
description: |-
  Validates a project key by confirming the key is a valid string and not in use.
  
  **[Permissions](#permissions) required:** None.
nav_order: 999
published: false
---

# Validate Project Key

## API Description
Validates a project key by confirming the key is a valid string and not in use.

**[Permissions](#permissions) required:** None.

## Purpose
Retrieve essential project information for management oversight and analysis

## When to Use
When you need to analyze project performance, track project metrics, or generate executive reports on project portfolio health

## Key Data Points
• **key**: The project key.

## Project Analysis Value
Enables forensic analysis of project setup, configuration, and performance metrics. Critical for understanding project success factors and identifying patterns in high-performing vs struggling projects

## Usage Examples
• Executive dashboard showing project health across portfolio
• Project audit reports for compliance
• Resource allocation analysis by project
• Project timeline and milestone tracking

## Implementation
To use this data in Excel Power Query:

1. **Load the M code**: Use the function `JiraGetProjectvalidateKey` from [jira-projectvalidatekey.m](../assets/jira-projectvalidatekey.m)
2. **Configure authentication**: Ensure your Parameters table includes Jira credentials
3. **Execute the query**: The function will return structured data ready for analysis

### Function Parameters
• **key** (Optional): The project key.

### Expected Output
Structured table with expanded JSON data ready for Excel analysis

## Related Endpoints
See other endpoints in the same category for related functionality

---
*This documentation corresponds to the Jira API endpoint: `/rest/api/3/projectvalidate/key`*
