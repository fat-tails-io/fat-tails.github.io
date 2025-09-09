---
title: Transitions
description: Returns either all transitions or a transition that can be performed by the user on an issue, based on the issue's status.

Note, if a request is made...
nav_order: 999
draft: true
---

# Transitions

## Purpose
Access detailed issue data for project analysis and performance tracking

## When to Use
When conducting deep-dive analysis of project delivery, identifying bottlenecks, or measuring team productivity and issue resolution patterns

## Key Data Points
• **issueIdOrKey**: The ID or key of the issue.
• **expand**: Use [expand](#expansion) to include additional information about transitions in the response. This parameter accepts `transitions.fields`, which returns information about the fields in the transition screen for each transition. Fields hidden from the screen are not returned. Use this information to populate the `fields` and `update` fields in [Transition issue](#api-rest-api-3-issue-issueIdOrKey-transitions-post).
• **transitionId**: The ID of the transition.

## Project Analysis Value
Provides granular insights into project execution, enabling identification of process inefficiencies, resource constraints, and quality patterns that impact project success

## Usage Examples
• Burndown analysis and sprint performance
• Issue aging and resolution time analysis
• Quality metrics and defect tracking
• Team productivity and workload analysis

## Implementation
To use this data in Excel Power Query:

1. **Load the M code**: Use the function `JiraGetIssueTransitions` from [jira-issuetransitions.m](../assets/jira-issuetransitions.m)
2. **Configure authentication**: Ensure your Parameters table includes Jira credentials
3. **Execute the query**: The function will return structured data ready for analysis

### Function Parameters
• **issueIdOrKey** (Required): The ID or key of the issue.
• **expand** (Optional): Use [expand](#expansion) to include additional information about transitions in the response. This parameter accepts `transitions.fields`, which returns information about the fields in the transition screen for each transition. Fields hidden from the screen are not returned. Use this information to populate the `fields` and `update` fields in [Transition issue](#api-rest-api-3-issue-issueIdOrKey-transitions-post).
• **transitionId** (Optional): The ID of the transition.
• **skipRemoteOnlyCondition** (Optional): Whether transitions with the condition *Hide From User Condition* are included in the response.
• **includeUnavailableTransitions** (Optional): Whether details of transitions that fail a condition are included in the response
• **sortByOpsBarAndStatus** (Optional): Whether the transitions are sorted by ops-bar sequence value first then category order (Todo, In Progress, Done) or only by ops-bar sequence value.

### Expected Output
Structured table with expanded JSON data ready for Excel analysis

## Related Endpoints
See other endpoints in the same category for related functionality

---
*This documentation corresponds to the Jira API endpoint: `/rest/api/3/issue/{issueIdOrKey}/transitions`*
