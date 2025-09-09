---
title: Plan-Only Team
description: Returns planning settings for a plan-only team.

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.at...
nav_order: 999
published: false
---

# Plan-Only Team

## Purpose
Extract specific data from Jira for project analysis and reporting

## When to Use
When you need this specific data point for project analysis or reporting requirements

## Key Data Points
• **planId**: The ID of the plan.
• **planOnlyTeamId**: The ID of the plan-only team.

## Project Analysis Value
Provides valuable data insights that support project management decision-making and performance analysis

## Usage Examples
• Custom reports and dashboards
• Data analysis and trend identification
• Performance monitoring and tracking

## Implementation
To use this data in Excel Power Query:

1. **Load the M code**: Use the function `JiraGetPlansPlanTeamPlanonly` from [jira-plansplanteamplanonly.m](../assets/jira-plansplanteamplanonly.m)
2. **Configure authentication**: Ensure your Parameters table includes Jira credentials
3. **Execute the query**: The function will return structured data ready for analysis

### Function Parameters
• **planId** (Required): The ID of the plan.
• **planOnlyTeamId** (Required): The ID of the plan-only team.

### Expected Output
Structured table with expanded JSON data ready for Excel analysis

## Related Endpoints
See other endpoints in the same category for related functionality

---
*This documentation corresponds to the Jira API endpoint: `/rest/api/3/plans/plan/{planId}/team/planonly/{planOnlyTeamId}`*
