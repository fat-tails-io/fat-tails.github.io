---
title: Issue Type Property
description: |-
  Returns the key and value of the [issue type property](https://developer.atlassian.com/cloud/jira/platform/storing-data-without-a-database/#a-id-jira-entity-properties-a-jira-entity-properties).
  
  This operation can be accessed anonymously.
  
  **[Permissions](#permissions) required:**
  
   *  *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg) to get the details of any issue type.
   *  *Browse projects* [project permission](https://confluence.atlassian.com/x/yodKLg) to get the details of any issue types associated with the projects the user has permission to browse.
nav_order: 999
published: false
---

# Issue Type Property

## API Description
Returns the key and value of the [issue type property](https://developer.atlassian.com/cloud/jira/platform/storing-data-without-a-database/#a-id-jira-entity-properties-a-jira-entity-properties).

This operation can be accessed anonymously.

**[Permissions](#permissions) required:**

 *  *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg) to get the details of any issue type.
 *  *Browse projects* [project permission](https://confluence.atlassian.com/x/yodKLg) to get the details of any issue types associated with the projects the user has permission to browse.

## Purpose
Access detailed issue data for project analysis and performance tracking

## When to Use
When conducting deep-dive analysis of project delivery, identifying bottlenecks, or measuring team productivity and issue resolution patterns

## Key Data Points
• **issueTypeId**: The ID of the issue type.
• **propertyKey**: The key of the property. Use [Get issue type property keys](#api-rest-api-3-issuetype-issueTypeId-properties-get) to get a list of all issue type property keys.

## Project Analysis Value
Provides granular insights into project execution, enabling identification of process inefficiencies, resource constraints, and quality patterns that impact project success

## Usage Examples
• Burndown analysis and sprint performance
• Issue aging and resolution time analysis
• Quality metrics and defect tracking
• Team productivity and workload analysis

## Implementation
To use this data in Excel Power Query:

1. **Load the M code**: Use the function `JiraGetIssuetypeProperties` from [jira-issuetypeproperties.m](../assets/jira-issuetypeproperties.m)
2. **Configure authentication**: Ensure your Parameters table includes Jira credentials
3. **Execute the query**: The function will return structured data ready for analysis

### Function Parameters
• **issueTypeId** (Required): The ID of the issue type.
• **propertyKey** (Required): The key of the property. Use [Get issue type property keys](#api-rest-api-3-issuetype-issueTypeId-properties-get) to get a list of all issue type property keys.

### Expected Output
Structured table with expanded JSON data ready for Excel analysis

## Related Endpoints
See other endpoints in the same category for related functionality

---
*This documentation corresponds to the Jira API endpoint: `/rest/api/3/issuetype/{issueTypeId}/properties/{propertyKey}`*
