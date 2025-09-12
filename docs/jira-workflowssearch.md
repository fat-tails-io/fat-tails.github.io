---
title: Search Workflows
description: |-
  Returns a [paginated](#pagination) list of global and project workflows. If workflow names are specified in the query string, details of those workflows are returned. Otherwise, all workflows are returned.
  
  **[Permissions](#permissions) required:**
  
   *  *Administer Jira* global permission to access all, including project-scoped, workflows
   *  At least one of the *Administer projects* and *View (read-only) workflow* project permissions to access project-scoped workflows
nav_order: 999
published: false
---

# Search Workflows

## API Description
Returns a [paginated](#pagination) list of global and project workflows. If workflow names are specified in the query string, details of those workflows are returned. Otherwise, all workflows are returned.

**[Permissions](#permissions) required:**

 *  *Administer Jira* global permission to access all, including project-scoped, workflows
 *  At least one of the *Administer projects* and *View (read-only) workflow* project permissions to access project-scoped workflows

## Purpose
Execute complex queries to extract specific data sets for targeted analysis

## When to Use
When you need to perform advanced filtering and data extraction for specialized reports or custom analysis scenarios

## Key Data Points
• **startAt**: The index of the first item to return in a page of results (page offset).
• **maxResults**: The maximum number of items to return per page.
• **expand**: Use [expand](#expansion) to include additional information in the response. This parameter accepts a comma-separated list. Expand options include:

 *  `values.transitions` Returns the transitions that each workflow is associated with.

## Project Analysis Value
Provides flexible data extraction capabilities for custom analysis scenarios, enabling sophisticated filtering and reporting beyond standard metrics

## Usage Examples
• Custom filtered reports for stakeholders
• Advanced trend analysis with specific criteria
• Compliance reporting with complex filters
• Ad-hoc analysis for specific business questions

## Implementation
To use this data in Excel Power Query:

1. **Load the M code**: Use the function `JiraGetWorkflowsSearch` from [jira-workflowssearch.m](../assets/jira-workflowssearch.m)
2. **Configure authentication**: Ensure your Parameters table includes Jira credentials
3. **Execute the query**: The function will return structured data ready for analysis

### Function Parameters
• **startAt** (Optional): The index of the first item to return in a page of results (page offset).
• **maxResults** (Optional): The maximum number of items to return per page.
• **expand** (Optional): Use [expand](#expansion) to include additional information in the response. This parameter accepts a comma-separated list. Expand options include:

 *  `values.transitions` Returns the transitions that each workflow is associated with.
• **queryString** (Optional): String used to perform a case-insensitive partial match with workflow name.
• **orderBy** (Optional): [Order](#ordering) the results by a field:

 *  `name` Sorts by workflow name.
 *  `created` Sorts by create time.
 *  `updated` Sorts by update time.
• **scope** (Optional): The scope of the workflow. Global for company-managed projects and Project for team-managed projects.
• **isActive** (Optional): Filters active and inactive workflows.

### Expected Output
Structured table with expanded JSON data ready for Excel analysis

## Related Endpoints
See other endpoints in the same category for related functionality

---
*This documentation corresponds to the Jira API endpoint: `/rest/api/3/workflows/search`*
