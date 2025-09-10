---
title: All Metadata For An Expanded Attachment
description: |-
  Returns the metadata for the contents of an attachment, if it is an archive, and metadata for the attachment itself. For example, if the attachment is a ZIP archive, then information about the files in the archive is returned and metadata for the ZIP archive. Currently, only the ZIP archive format is supported.
  
  Use this operation to retrieve data that is presented to the user, as this operation returns the metadata for the attachment itself, such as the attachment's ID and name. Otherwise, use [ Get contents metadata for an expanded attachment](#api-rest-api-3-attachment-id-expand-raw-get), which only returns the metadata for the attachment's contents.
  
  This operation can be accessed anonymously.
  
  **[Permissions](#permissions) required:** For the issue containing the attachment:
  
   *  *Browse projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for the project that the issue is in.
   *  If [issue-level security](https://confluence.atlassian.com/x/J4lKLg) is configured, issue-level security permission to view the issue.
   *  If attachments are added in private comments, the comment-level restriction will be applied.
nav_order: 999
published: false
---

# All Metadata For An Expanded Attachment

## API Description
Returns the metadata for the contents of an attachment, if it is an archive, and metadata for the attachment itself. For example, if the attachment is a ZIP archive, then information about the files in the archive is returned and metadata for the ZIP archive. Currently, only the ZIP archive format is supported.

Use this operation to retrieve data that is presented to the user, as this operation returns the metadata for the attachment itself, such as the attachment's ID and name. Otherwise, use [ Get contents metadata for an expanded attachment](#api-rest-api-3-attachment-id-expand-raw-get), which only returns the metadata for the attachment's contents.

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

## Project Analysis Value
Provides valuable data insights that support project management decision-making and performance analysis

## Usage Examples
• Custom reports and dashboards
• Data analysis and trend identification
• Performance monitoring and tracking

## Implementation
To use this data in Excel Power Query:

1. **Load the M code**: Use the function `JiraGetAttachmentExpandHuman` from [jira-attachmentexpandhuman.m](../assets/jira-attachmentexpandhuman.m)
2. **Configure authentication**: Ensure your Parameters table includes Jira credentials
3. **Execute the query**: The function will return structured data ready for analysis

### Function Parameters
• **id** (Required): The ID of the attachment.

### Expected Output
Structured table with expanded JSON data ready for Excel analysis

## Related Endpoints
See other endpoints in the same category for related functionality

---
*This documentation corresponds to the Jira API endpoint: `/rest/api/3/attachment/{id}/expand/human`*
