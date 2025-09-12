---
title: Attachment Thumbnail
description: |-
  Returns the thumbnail of an attachment.
  
  To return the attachment contents, use [Get attachment content](#api-rest-api-3-attachment-content-id-get).
  
  This operation can be accessed anonymously.
  
  **[Permissions](#permissions) required:** For the issue containing the attachment:
  
   *  *Browse projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for the project that the issue is in.
   *  If [issue-level security](https://confluence.atlassian.com/x/J4lKLg) is configured, issue-level security permission to view the issue.
   *  If attachments are added in private comments, the comment-level restriction will be applied.
nav_order: 999
published: false
---

# Attachment Thumbnail

## API Description
Returns the thumbnail of an attachment.

To return the attachment contents, use [Get attachment content](#api-rest-api-3-attachment-content-id-get).

This operation can be accessed anonymously.

**[Permissions](#permissions) required:** For the issue containing the attachment:

 *  *Browse projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for the project that the issue is in.
 *  If [issue-level security](https://confluence.atlassian.com/x/J4lKLg) is configured, issue-level security permission to view the issue.
 *  If attachments are added in private comments, the comment-level restriction will be applied.

## Purpose
Extract specific data from Jira for project analysis and reporting

## When to Use
When you need this specific data point for project analysis or reporting requirements

## Key Data Points
• **id**: The ID of the attachment.
• **redirect**: Whether a redirect is provided for the attachment download. Clients that do not automatically follow redirects can set this to `false` to avoid making multiple requests to download the attachment.
• **fallbackToDefault**: Whether a default thumbnail is returned when the requested thumbnail is not found.

## Project Analysis Value
Provides valuable data insights that support project management decision-making and performance analysis

## Usage Examples
• Custom reports and dashboards
• Data analysis and trend identification
• Performance monitoring and tracking

## Implementation
To use this data in Excel Power Query:

1. **Load the M code**: Use the function `JiraGetAttachmentThumbnail` from [jira-attachmentthumbnail.m](../assets/jira-attachmentthumbnail.m)
2. **Configure authentication**: Ensure your Parameters table includes Jira credentials
3. **Execute the query**: The function will return structured data ready for analysis

### Function Parameters
• **id** (Required): The ID of the attachment.
• **redirect** (Optional): Whether a redirect is provided for the attachment download. Clients that do not automatically follow redirects can set this to `false` to avoid making multiple requests to download the attachment.
• **fallbackToDefault** (Optional): Whether a default thumbnail is returned when the requested thumbnail is not found.
• **width** (Optional): The maximum width to scale the thumbnail to.
• **height** (Optional): The maximum height to scale the thumbnail to.

### Expected Output
Structured table with expanded JSON data ready for Excel analysis

## Related Endpoints
See other endpoints in the same category for related functionality

---
*This documentation corresponds to the Jira API endpoint: `/rest/api/3/attachment/thumbnail/{id}`*
