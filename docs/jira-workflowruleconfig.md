---
title: Workflow Transition Rule Configurations
description: |-
  Returns a [paginated](#pagination) list of workflows with transition rules. The workflows can be filtered to return only those containing workflow transition rules:
  
   *  of one or more transition rule types, such as [workflow post functions](https://developer.atlassian.com/cloud/jira/platform/modules/workflow-post-function/).
   *  matching one or more transition rule keys.
  
  Only workflows containing transition rules created by the calling [Connect](https://developer.atlassian.com/cloud/jira/platform/index/#connect-apps) or [Forge](https://developer.atlassian.com/cloud/jira/platform/index/#forge-apps) app are returned.
  
  Due to server-side optimizations, workflows with an empty list of rules may be returned; these workflows can be ignored.
  
  **[Permissions](#permissions) required:** Only [Connect](https://developer.atlassian.com/cloud/jira/platform/index/#connect-apps) or [Forge](https://developer.atlassian.com/cloud/jira/platform/index/#forge-apps) apps can use this operation.
nav_order: 999
published: false
---

# Workflow Transition Rule Configurations

## API Description
Returns a [paginated](#pagination) list of workflows with transition rules. The workflows can be filtered to return only those containing workflow transition rules:

 *  of one or more transition rule types, such as [workflow post functions](https://developer.atlassian.com/cloud/jira/platform/modules/workflow-post-function/).
 *  matching one or more transition rule keys.

Only workflows containing transition rules created by the calling [Connect](https://developer.atlassian.com/cloud/jira/platform/index/#connect-apps) or [Forge](https://developer.atlassian.com/cloud/jira/platform/index/#forge-apps) app are returned.

Due to server-side optimizations, workflows with an empty list of rules may be returned; these workflows can be ignored.

**[Permissions](#permissions) required:** Only [Connect](https://developer.atlassian.com/cloud/jira/platform/index/#connect-apps) or [Forge](https://developer.atlassian.com/cloud/jira/platform/index/#forge-apps) apps can use this operation.

## Purpose
Extract specific data from Jira for project analysis and reporting

## When to Use
When you need this specific data point for project analysis or reporting requirements

## Key Data Points
• **startAt**: The index of the first item to return in a page of results (page offset).
• **maxResults**: The maximum number of items to return per page.
• **types**: The types of the transition rules to return.

## Project Analysis Value
Provides valuable data insights that support project management decision-making and performance analysis

## Usage Examples
• Custom reports and dashboards
• Data analysis and trend identification
• Performance monitoring and tracking

## Implementation
To use this data in Excel Power Query:

1. **Load the M code**: Use the function `JiraGetWorkflowRuleConfig` from [jira-workflowruleconfig.m](../assets/jira-workflowruleconfig.m)
2. **Configure authentication**: Ensure your Parameters table includes Jira credentials
3. **Execute the query**: The function will return structured data ready for analysis

### Function Parameters
• **startAt** (Optional): The index of the first item to return in a page of results (page offset).
• **maxResults** (Optional): The maximum number of items to return per page.
• **types** (Required): The types of the transition rules to return.
• **keys** (Optional): The transition rule class keys, as defined in the Connect or the Forge app descriptor, of the transition rules to return.
• **workflowNames** (Optional): The list of workflow names to filter by.
• **withTags** (Optional): The list of `tags` to filter by.
• **draft** (Optional): Whether draft or published workflows are returned. If not provided, both workflow types are returned.
• **expand** (Optional): Use [expand](#expansion) to include additional information in the response. This parameter accepts `transition`, which, for each rule, returns information about the transition the rule is assigned to.

### Expected Output
Structured table with expanded JSON data ready for Excel analysis

## Related Endpoints
See other endpoints in the same category for related functionality

---
*This documentation corresponds to the Jira API endpoint: `/rest/api/3/workflow/rule/config`*
