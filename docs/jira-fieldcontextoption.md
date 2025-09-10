---
title: Custom Field Options (Context)
description: |-
  Returns a [paginated](#pagination) list of all custom field option for a context. Options are returned first then cascading options, in the order they display in Jira.
  
  This operation works for custom field options created in Jira or the operations from this resource. **To work with issue field select list options created for Connect apps use the [Issue custom field options (apps)](#api-group-issue-custom-field-options--apps-) operations.**
  
  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg). *Edit Workflow* [edit workflow permission](https://support.atlassian.com/jira-cloud-administration/docs/permissions-for-company-managed-projects/#Edit-Workflows)
nav_order: 999
published: false
---

# Custom Field Options (Context)

## API Description
Returns a [paginated](#pagination) list of all custom field option for a context. Options are returned first then cascading options, in the order they display in Jira.

This operation works for custom field options created in Jira or the operations from this resource. **To work with issue field select list options created for Connect apps use the [Issue custom field options (apps)](#api-group-issue-custom-field-options--apps-) operations.**

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg). *Edit Workflow* [edit workflow permission](https://support.atlassian.com/jira-cloud-administration/docs/permissions-for-company-managed-projects/#Edit-Workflows)

## Purpose
Extract specific data from Jira for project analysis and reporting

## When to Use
When you need this specific data point for project analysis or reporting requirements

## Key Data Points
• **fieldId**: The ID of the custom field.
• **contextId**: The ID of the context.
• **optionId**: The ID of the option.

## Project Analysis Value
Provides valuable data insights that support project management decision-making and performance analysis

## Usage Examples
• Custom reports and dashboards
• Data analysis and trend identification
• Performance monitoring and tracking

## Implementation
To use this data in Excel Power Query:

1. **Load the M code**: Use the function `JiraGetFieldContextOption` from [jira-fieldcontextoption.m](../assets/jira-fieldcontextoption.m)
2. **Configure authentication**: Ensure your Parameters table includes Jira credentials
3. **Execute the query**: The function will return structured data ready for analysis

### Function Parameters
• **fieldId** (Required): The ID of the custom field.
• **contextId** (Required): The ID of the context.
• **optionId** (Optional): The ID of the option.
• **onlyOptions** (Optional): Whether only options are returned.
• **startAt** (Optional): The index of the first item to return in a page of results (page offset).
• **maxResults** (Optional): The maximum number of items to return per page.

### Expected Output
Structured table with expanded JSON data ready for Excel analysis

## Related Endpoints
See other endpoints in the same category for related functionality

---
*This documentation corresponds to the Jira API endpoint: `/rest/api/3/field/{fieldId}/context/{contextId}/option`*
