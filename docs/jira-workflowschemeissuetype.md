---
title: Workflow For Issue Type In Workflow Scheme
description: |-
  Returns the issue type-workflow mapping for an issue type in a workflow scheme.
  
  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
nav_order: 999
published: false
---

# Workflow For Issue Type In Workflow Scheme

## API Description
Returns the issue type-workflow mapping for an issue type in a workflow scheme.

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

## Purpose
Access detailed issue data for project analysis and performance tracking

## When to Use
When conducting deep-dive analysis of project delivery, identifying bottlenecks, or measuring team productivity and issue resolution patterns

## Key Data Points
• **id**: The ID of the workflow scheme.
• **issueType**: The ID of the issue type.
• **returnDraftIfExists**: Returns the mapping from the workflow scheme's draft rather than the workflow scheme, if set to true. If no draft exists, the mapping from the workflow scheme is returned.

## Project Analysis Value
Provides granular insights into project execution, enabling identification of process inefficiencies, resource constraints, and quality patterns that impact project success

## Usage Examples
• Burndown analysis and sprint performance
• Issue aging and resolution time analysis
• Quality metrics and defect tracking
• Team productivity and workload analysis

## Implementation
To use this data in Excel Power Query:

1. **Load the M code**: Use the function `JiraGetWorkflowschemeIssuetype` from [jira-workflowschemeissuetype.m](../assets/jira-workflowschemeissuetype.m)
2. **Configure authentication**: Ensure your Parameters table includes Jira credentials
3. **Execute the query**: The function will return structured data ready for analysis

### Function Parameters
• **id** (Required): The ID of the workflow scheme.
• **issueType** (Required): The ID of the issue type.
• **returnDraftIfExists** (Optional): Returns the mapping from the workflow scheme's draft rather than the workflow scheme, if set to true. If no draft exists, the mapping from the workflow scheme is returned.

### Expected Output
Structured table with expanded JSON data ready for Excel analysis

## Related Endpoints
See other endpoints in the same category for related functionality

---
*This documentation corresponds to the Jira API endpoint: `/rest/api/3/workflowscheme/{id}/issuetype/{issueType}`*
