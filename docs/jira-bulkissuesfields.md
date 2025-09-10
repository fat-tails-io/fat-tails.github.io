---
title: Bulk Editable Fields
description: |-
  Use this API to get a list of fields visible to the user to perform bulk edit operations. You can pass single or multiple issues in the query to get eligible editable fields. This API uses pagination to return responses, delivering 50 fields at a time.
  
  **[Permissions](#permissions) required:**
  
   *  Global bulk change [permission](https://support.atlassian.com/jira-cloud-administration/docs/manage-global-permissions/).
   *  Browse [project permission](https://support.atlassian.com/jira-cloud-administration/docs/manage-project-permissions/) in all projects that contain the selected issues.
   *  If [issue-level security](https://confluence.atlassian.com/x/J4lKLg) is configured, issue-level security permission to view the issue.
   *  Depending on the field, any field-specific permissions required to edit it.
nav_order: 999
published: false
---

# Bulk Editable Fields

## API Description
Use this API to get a list of fields visible to the user to perform bulk edit operations. You can pass single or multiple issues in the query to get eligible editable fields. This API uses pagination to return responses, delivering 50 fields at a time.

**[Permissions](#permissions) required:**

 *  Global bulk change [permission](https://support.atlassian.com/jira-cloud-administration/docs/manage-global-permissions/).
 *  Browse [project permission](https://support.atlassian.com/jira-cloud-administration/docs/manage-project-permissions/) in all projects that contain the selected issues.
 *  If [issue-level security](https://confluence.atlassian.com/x/J4lKLg) is configured, issue-level security permission to view the issue.
 *  Depending on the field, any field-specific permissions required to edit it.

## Purpose
Access detailed issue data for project analysis and performance tracking

## When to Use
When conducting deep-dive analysis of project delivery, identifying bottlenecks, or measuring team productivity and issue resolution patterns

## Key Data Points
• **issueIdsOrKeys**: The IDs or keys of the issues to get editable fields from.
• **searchText**: (Optional)The text to search for in the editable fields.
• **endingBefore**: (Optional)The end cursor for use in pagination.

## Project Analysis Value
Provides granular insights into project execution, enabling identification of process inefficiencies, resource constraints, and quality patterns that impact project success

## Usage Examples
• Burndown analysis and sprint performance
• Issue aging and resolution time analysis
• Quality metrics and defect tracking
• Team productivity and workload analysis

## Implementation
To use this data in Excel Power Query:

1. **Load the M code**: Use the function `JiraGetBulkIssuesFields` from [jira-bulkissuesfields.m](../assets/jira-bulkissuesfields.m)
2. **Configure authentication**: Ensure your Parameters table includes Jira credentials
3. **Execute the query**: The function will return structured data ready for analysis

### Function Parameters
• **issueIdsOrKeys** (Required): The IDs or keys of the issues to get editable fields from.
• **searchText** (Optional): (Optional)The text to search for in the editable fields.
• **endingBefore** (Optional): (Optional)The end cursor for use in pagination.
• **startingAfter** (Optional): (Optional)The start cursor for use in pagination.

### Expected Output
Structured table with expanded JSON data ready for Excel analysis

## Related Endpoints
See other endpoints in the same category for related functionality

---
*This documentation corresponds to the Jira API endpoint: `/rest/api/3/bulk/issues/fields`*
