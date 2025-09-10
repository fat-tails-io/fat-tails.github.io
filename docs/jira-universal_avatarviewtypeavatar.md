---
title: Avatar Image By Id
description: |-
  Returns a project, issue type or priority avatar image by ID.
  
  This operation can be accessed anonymously.
  
  **[Permissions](#permissions) required:**
  
   *  For system avatars, none.
   *  For custom project avatars, *Browse projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for the project the avatar belongs to.
   *  For custom issue type avatars, *Browse projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for at least one project the issue type is used in.
   *  For priority avatars, none.
nav_order: 999
published: false
---

# Avatar Image By Id

## API Description
Returns a project, issue type or priority avatar image by ID.

This operation can be accessed anonymously.

**[Permissions](#permissions) required:**

 *  For system avatars, none.
 *  For custom project avatars, *Browse projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for the project the avatar belongs to.
 *  For custom issue type avatars, *Browse projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for at least one project the issue type is used in.
 *  For priority avatars, none.

## Purpose
Extract specific data from Jira for project analysis and reporting

## When to Use
When you need this specific data point for project analysis or reporting requirements

## Key Data Points
• **type**: The icon type of the avatar.
• **id**: The ID of the avatar.
• **size**: The size of the avatar image. If not provided the default size is returned.

## Project Analysis Value
Provides valuable data insights that support project management decision-making and performance analysis

## Usage Examples
• Custom reports and dashboards
• Data analysis and trend identification
• Performance monitoring and tracking

## Implementation
To use this data in Excel Power Query:

1. **Load the M code**: Use the function `JiraGetUniversal_AvatarViewTypeAvatar` from [jira-universal_avatarviewtypeavatar.m](../assets/jira-universal_avatarviewtypeavatar.m)
2. **Configure authentication**: Ensure your Parameters table includes Jira credentials
3. **Execute the query**: The function will return structured data ready for analysis

### Function Parameters
• **type** (Required): The icon type of the avatar.
• **id** (Required): The ID of the avatar.
• **size** (Optional): The size of the avatar image. If not provided the default size is returned.
• **format** (Optional): The format to return the avatar image in. If not provided the original content format is returned.

### Expected Output
Structured table with expanded JSON data ready for Excel analysis

## Related Endpoints
See other endpoints in the same category for related functionality

---
*This documentation corresponds to the Jira API endpoint: `/rest/api/3/universal_avatar/view/type/{type}/avatar/{id}`*
