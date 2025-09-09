---
title: Workflow Transition Properties
description: This will be removed on [June 1, 2026](https://developer.atlassian.com/cloud/jira/platform/changelog/#CHANGE-2570); fetch transition properties from [...
nav_order: 999
published: false
---

# Workflow Transition Properties

## Purpose
Extract specific data from Jira for project analysis and reporting

## When to Use
When you need this specific data point for project analysis or reporting requirements

## Key Data Points
• **transitionId**: The ID of the transition. To get the ID, view the workflow in text mode in the Jira administration console. The ID is shown next to the transition.
• **includeReservedKeys**: Some properties with keys that have the *jira.* prefix are reserved, which means they are not editable. To include these properties in the results, set this parameter to *true*.
• **key**: The key of the property being returned, also known as the name of the property. If this parameter is not specified, all properties on the transition are returned.

## Project Analysis Value
Provides valuable data insights that support project management decision-making and performance analysis

## Usage Examples
• Custom reports and dashboards
• Data analysis and trend identification
• Performance monitoring and tracking

## Implementation
To use this data in Excel Power Query:

1. **Load the M code**: Use the function `JiraGetWorkflowTransitionsProperties` from [jira-workflowtransitionsproperties.m](../assets/jira-workflowtransitionsproperties.m)
2. **Configure authentication**: Ensure your Parameters table includes Jira credentials
3. **Execute the query**: The function will return structured data ready for analysis

### Function Parameters
• **transitionId** (Required): The ID of the transition. To get the ID, view the workflow in text mode in the Jira administration console. The ID is shown next to the transition.
• **includeReservedKeys** (Optional): Some properties with keys that have the *jira.* prefix are reserved, which means they are not editable. To include these properties in the results, set this parameter to *true*.
• **key** (Optional): The key of the property being returned, also known as the name of the property. If this parameter is not specified, all properties on the transition are returned.
• **workflowName** (Required): The name of the workflow that the transition belongs to.
• **workflowMode** (Optional): The workflow status. Set to *live* for active and inactive workflows, or *draft* for draft workflows.

### Expected Output
Structured table with expanded JSON data ready for Excel analysis

## Related Endpoints
See other endpoints in the same category for related functionality

---
*This documentation corresponds to the Jira API endpoint: `/rest/api/3/workflow/transitions/{transitionId}/properties`*
