---
title: Workflows Paginated
description: This will be removed on [June 1, 2026](https://developer.atlassian.com/cloud/jira/platform/changelog/#CHANGE-2569); use [Search workflows](#api-rest-a...
nav_order: 999
published: false
---

# Workflows Paginated

## Purpose
Execute complex queries to extract specific data sets for targeted analysis

## When to Use
When you need to perform advanced filtering and data extraction for specialized reports or custom analysis scenarios

## Key Data Points
• **startAt**: The index of the first item to return in a page of results (page offset).
• **maxResults**: The maximum number of items to return per page.
• **workflowName**: The name of a workflow to return. To include multiple workflows, provide an ampersand-separated list. For example, `workflowName=name1&workflowName=name2`.

## Project Analysis Value
Provides flexible data extraction capabilities for custom analysis scenarios, enabling sophisticated filtering and reporting beyond standard metrics

## Usage Examples
• Custom filtered reports for stakeholders
• Advanced trend analysis with specific criteria
• Compliance reporting with complex filters
• Ad-hoc analysis for specific business questions

## Implementation
To use this data in Excel Power Query:

1. **Load the M code**: Use the function `JiraGetWorkflowSearch` from [jira-workflowsearch.m](../assets/jira-workflowsearch.m)
2. **Configure authentication**: Ensure your Parameters table includes Jira credentials
3. **Execute the query**: The function will return structured data ready for analysis

### Function Parameters
• **startAt** (Optional): The index of the first item to return in a page of results (page offset).
• **maxResults** (Optional): The maximum number of items to return per page.
• **workflowName** (Optional): The name of a workflow to return. To include multiple workflows, provide an ampersand-separated list. For example, `workflowName=name1&workflowName=name2`.
• **expand** (Optional): Use [expand](#expansion) to include additional information in the response. This parameter accepts a comma-separated list. Expand options include:

 *  `transitions` For each workflow, returns information about the transitions inside the workflow.
 *  `transitions.rules` For each workflow transition, returns information about its rules. Transitions are included automatically if this expand is requested.
 *  `transitions.properties` For each workflow transition, returns information about its properties. Transitions are included automatically if this expand is requested.
 *  `statuses` For each workflow, returns information about the statuses inside the workflow.
 *  `statuses.properties` For each workflow status, returns information about its properties. Statuses are included automatically if this expand is requested.
 *  `default` For each workflow, returns information about whether this is the default workflow.
 *  `schemes` For each workflow, returns information about the workflow schemes the workflow is assigned to.
 *  `projects` For each workflow, returns information about the projects the workflow is assigned to, through workflow schemes.
 *  `hasDraftWorkflow` For each workflow, returns information about whether the workflow has a draft version.
 *  `operations` For each workflow, returns information about the actions that can be undertaken on the workflow.
• **queryString** (Optional): String used to perform a case-insensitive partial match with workflow name.
• **orderBy** (Optional): [Order](#ordering) the results by a field:

 *  `name` Sorts by workflow name.
 *  `created` Sorts by create time.
 *  `updated` Sorts by update time.
• **isActive** (Optional): Filters active and inactive workflows.

### Expected Output
Structured table with expanded JSON data ready for Excel analysis

## Related Endpoints
See other endpoints in the same category for related functionality

---
*This documentation corresponds to the Jira API endpoint: `/rest/api/3/workflow/search`*
