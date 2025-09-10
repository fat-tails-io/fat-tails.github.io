---
title: Custom Field Contexts Default Values
description: |-
  Returns a [paginated](#pagination) list of defaults for a custom field. The results can be filtered by `contextId`, otherwise all values are returned. If no defaults are set for a context, nothing is returned.  
  The returned object depends on type of the custom field:
  
   *  `CustomFieldContextDefaultValueDate` (type `datepicker`) for date fields.
   *  `CustomFieldContextDefaultValueDateTime` (type `datetimepicker`) for date-time fields.
   *  `CustomFieldContextDefaultValueSingleOption` (type `option.single`) for single choice select lists and radio buttons.
   *  `CustomFieldContextDefaultValueMultipleOption` (type `option.multiple`) for multiple choice select lists and checkboxes.
   *  `CustomFieldContextDefaultValueCascadingOption` (type `option.cascading`) for cascading select lists.
   *  `CustomFieldContextSingleUserPickerDefaults` (type `single.user.select`) for single users.
   *  `CustomFieldContextDefaultValueMultiUserPicker` (type `multi.user.select`) for user lists.
   *  `CustomFieldContextDefaultValueSingleGroupPicker` (type `grouppicker.single`) for single choice group pickers.
   *  `CustomFieldContextDefaultValueMultipleGroupPicker` (type `grouppicker.multiple`) for multiple choice group pickers.
   *  `CustomFieldContextDefaultValueURL` (type `url`) for URLs.
   *  `CustomFieldContextDefaultValueProject` (type `project`) for project pickers.
   *  `CustomFieldContextDefaultValueFloat` (type `float`) for floats (floating-point numbers).
   *  `CustomFieldContextDefaultValueLabels` (type `labels`) for labels.
   *  `CustomFieldContextDefaultValueTextField` (type `textfield`) for text fields.
   *  `CustomFieldContextDefaultValueTextArea` (type `textarea`) for text area fields.
   *  `CustomFieldContextDefaultValueReadOnly` (type `readonly`) for read only (text) fields.
   *  `CustomFieldContextDefaultValueMultipleVersion` (type `version.multiple`) for single choice version pickers.
   *  `CustomFieldContextDefaultValueSingleVersion` (type `version.single`) for multiple choice version pickers.
  
  Forge custom fields [types](https://developer.atlassian.com/platform/forge/manifest-reference/modules/jira-custom-field-type/#data-types) are also supported, returning:
  
   *  `CustomFieldContextDefaultValueForgeStringFieldBean` (type `forge.string`) for Forge string fields.
   *  `CustomFieldContextDefaultValueForgeMultiStringFieldBean` (type `forge.string.list`) for Forge string collection fields.
   *  `CustomFieldContextDefaultValueForgeObjectFieldBean` (type `forge.object`) for Forge object fields.
   *  `CustomFieldContextDefaultValueForgeDateTimeFieldBean` (type `forge.datetime`) for Forge date-time fields.
   *  `CustomFieldContextDefaultValueForgeGroupFieldBean` (type `forge.group`) for Forge group fields.
   *  `CustomFieldContextDefaultValueForgeMultiGroupFieldBean` (type `forge.group.list`) for Forge group collection fields.
   *  `CustomFieldContextDefaultValueForgeNumberFieldBean` (type `forge.number`) for Forge number fields.
   *  `CustomFieldContextDefaultValueForgeUserFieldBean` (type `forge.user`) for Forge user fields.
   *  `CustomFieldContextDefaultValueForgeMultiUserFieldBean` (type `forge.user.list`) for Forge user collection fields.
  
  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
nav_order: 999
published: false
---

# Custom Field Contexts Default Values

## API Description
Returns a [paginated](#pagination) list of defaults for a custom field. The results can be filtered by `contextId`, otherwise all values are returned. If no defaults are set for a context, nothing is returned.  
The returned object depends on type of the custom field:

 *  `CustomFieldContextDefaultValueDate` (type `datepicker`) for date fields.
 *  `CustomFieldContextDefaultValueDateTime` (type `datetimepicker`) for date-time fields.
 *  `CustomFieldContextDefaultValueSingleOption` (type `option.single`) for single choice select lists and radio buttons.
 *  `CustomFieldContextDefaultValueMultipleOption` (type `option.multiple`) for multiple choice select lists and checkboxes.
 *  `CustomFieldContextDefaultValueCascadingOption` (type `option.cascading`) for cascading select lists.
 *  `CustomFieldContextSingleUserPickerDefaults` (type `single.user.select`) for single users.
 *  `CustomFieldContextDefaultValueMultiUserPicker` (type `multi.user.select`) for user lists.
 *  `CustomFieldContextDefaultValueSingleGroupPicker` (type `grouppicker.single`) for single choice group pickers.
 *  `CustomFieldContextDefaultValueMultipleGroupPicker` (type `grouppicker.multiple`) for multiple choice group pickers.
 *  `CustomFieldContextDefaultValueURL` (type `url`) for URLs.
 *  `CustomFieldContextDefaultValueProject` (type `project`) for project pickers.
 *  `CustomFieldContextDefaultValueFloat` (type `float`) for floats (floating-point numbers).
 *  `CustomFieldContextDefaultValueLabels` (type `labels`) for labels.
 *  `CustomFieldContextDefaultValueTextField` (type `textfield`) for text fields.
 *  `CustomFieldContextDefaultValueTextArea` (type `textarea`) for text area fields.
 *  `CustomFieldContextDefaultValueReadOnly` (type `readonly`) for read only (text) fields.
 *  `CustomFieldContextDefaultValueMultipleVersion` (type `version.multiple`) for single choice version pickers.
 *  `CustomFieldContextDefaultValueSingleVersion` (type `version.single`) for multiple choice version pickers.

Forge custom fields [types](https://developer.atlassian.com/platform/forge/manifest-reference/modules/jira-custom-field-type/#data-types) are also supported, returning:

 *  `CustomFieldContextDefaultValueForgeStringFieldBean` (type `forge.string`) for Forge string fields.
 *  `CustomFieldContextDefaultValueForgeMultiStringFieldBean` (type `forge.string.list`) for Forge string collection fields.
 *  `CustomFieldContextDefaultValueForgeObjectFieldBean` (type `forge.object`) for Forge object fields.
 *  `CustomFieldContextDefaultValueForgeDateTimeFieldBean` (type `forge.datetime`) for Forge date-time fields.
 *  `CustomFieldContextDefaultValueForgeGroupFieldBean` (type `forge.group`) for Forge group fields.
 *  `CustomFieldContextDefaultValueForgeMultiGroupFieldBean` (type `forge.group.list`) for Forge group collection fields.
 *  `CustomFieldContextDefaultValueForgeNumberFieldBean` (type `forge.number`) for Forge number fields.
 *  `CustomFieldContextDefaultValueForgeUserFieldBean` (type `forge.user`) for Forge user fields.
 *  `CustomFieldContextDefaultValueForgeMultiUserFieldBean` (type `forge.user.list`) for Forge user collection fields.

**[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).

## Purpose
Extract specific data from Jira for project analysis and reporting

## When to Use
When you need this specific data point for project analysis or reporting requirements

## Key Data Points
• **fieldId**: The ID of the custom field, for example `customfield\_10000`.
• **contextId**: The IDs of the contexts.
• **startAt**: The index of the first item to return in a page of results (page offset).

## Project Analysis Value
Provides valuable data insights that support project management decision-making and performance analysis

## Usage Examples
• Custom reports and dashboards
• Data analysis and trend identification
• Performance monitoring and tracking

## Implementation
To use this data in Excel Power Query:

1. **Load the M code**: Use the function `JiraGetFieldContextDefaultvalue` from [jira-fieldcontextdefaultvalue.m](../assets/jira-fieldcontextdefaultvalue.m)
2. **Configure authentication**: Ensure your Parameters table includes Jira credentials
3. **Execute the query**: The function will return structured data ready for analysis

### Function Parameters
• **fieldId** (Required): The ID of the custom field, for example `customfield\_10000`.
• **contextId** (Optional): The IDs of the contexts.
• **startAt** (Optional): The index of the first item to return in a page of results (page offset).
• **maxResults** (Optional): The maximum number of items to return per page.

### Expected Output
Structured table with expanded JSON data ready for Excel analysis

## Related Endpoints
See other endpoints in the same category for related functionality

---
*This documentation corresponds to the Jira API endpoint: `/rest/api/3/field/{fieldId}/context/defaultValue`*
