---
title: Find Groups
description: Returns a list of groups whose names contain a query string. A list of group names can be provided to exclude groups from the results.

The primary use case for this resource is to populate a group picker suggestions list. To this end, the returned object includes the `html` field where the matched query term is highlighted in the group name with the HTML strong tag. Also, the groups list is wrapped in a response object that contains a header for use in the picker, specifically *Showing X of Y matching groups*.

The list returns with the groups sorted. If no groups match the list criteria, an empty list is returned.

This operation can be accessed anonymously.

**[Permissions](#permissions) required:** *Browse projects* [project permission](https://confluence.atlassian.com/x/yodKLg). Anonymous calls and calls by users without the required permission return an empty list.

*Browse users and groups* [global permission](https://confluence.atlassian.com/x/x4dKLg). Without this permission, calls where query is not an exact match to an existing group will return an empty list.
endpoint: /rest/api/3/groups/picker
method: GET
draft: true
---

// -----------------------------------------------------------------------------
// JiraGetGroupsPicker
// Description: Returns a list of groups whose names contain a query string. A list of group names can be provided to exclude groups from the results.

The primary use case for this resource is to populate a group picker suggestions list. To this end, the returned object includes the `html` field where the matched query term is highlighted in the group name with the HTML strong tag. Also, the groups list is wrapped in a response object that contains a header for use in the picker, specifically *Showing X of Y matching groups*.

The list returns with the groups sorted. If no groups match the list criteria, an empty list is returned.

This operation can be accessed anonymously.

**[Permissions](#permissions) required:** *Browse projects* [project permission](https://confluence.atlassian.com/x/yodKLg). Anonymous calls and calls by users without the required permission return an empty list.

*Browse users and groups* [global permission](https://confluence.atlassian.com/x/x4dKLg). Without this permission, calls where query is not an exact match to an existing group will return an empty list.
// API Endpoint: GET /rest/api/3/groups/picker
// Create this with query name: JiraGetGroupsPicker
// -----------------------------------------------------------------------------
(optional accountId as text, optional query as text, optional exclude as text, optional excludeId as text, optional maxResults as text, optional caseInsensitive as text, optional userName as text, optional includeTeams as text) =>
let
    // CONFIGURATION setup. 
    // Reference the table in current workbook
    ConfigTable = Excel.CurrentWorkbook(){[Name="Parameters"]}[Content],
    
    // Convert to a lookup record
    ConfigRecord = Record.FromList(
        ConfigTable[Value], 
        ConfigTable[Parameter]
    ),
    
    // Extract specific config values
    JiraBaseUrl = ConfigRecord[JiraBaseUrl],
    UserEmail = ConfigRecord[UserEmail],
    ApiToken = ConfigRecord[ApiToken],
    ApiVersion = ConfigRecord[ApiVersion],
    
    // AUTHENTICATION setup
    Credentials = Text.ToBinary(UserEmail & ":" & ApiToken),
    EncodedCredentials = Binary.ToText(Credentials, BinaryEncoding.Base64),
    Headers = [
        #"Authorization" = "Basic " & EncodedCredentials,
        #"Accept" = "application/json", 
        #"Content-Type" = "application/json"
    ],
    
    // Build query parameters
    QueryParams = [
            accountId = if accountId = null then null else accountId,
            query = if query = null then null else query,
            exclude = if exclude = null then null else exclude,
            excludeId = if excludeId = null then null else excludeId,
            maxResults = if maxResults = null then null else maxResults,
            caseInsensitive = if caseInsensitive = null then null else caseInsensitive,
            userName = if userName = null then null else userName,
            includeTeams = if includeTeams = null then null else includeTeams,
        ],
    
        // Remove null parameters
        CleanQueryParams = Record.SelectFields(
            QueryParams,
            List.Select(Record.FieldNames(QueryParams), each Record.Field(QueryParams, _) <> null)
        ),
    
    // Build URL
    BaseUrl = JiraBaseUrl & "/rest/api/3/groups/picker",
    QueryString = if Record.FieldCount(CleanQueryParams) = 0 then "" else 
        "?" & Text.Combine(
            List.Transform(
                Record.FieldNames(CleanQueryParams),
                each _ & "=" & Uri.EscapeDataString(Text.From(Record.Field(CleanQueryParams, _)))
            ),
            "&"
        ),
    FullUrl = BaseUrl & QueryString,
    
    // Make API call
    Response = Web.Contents(FullUrl, [Headers = Headers]),
    JsonResponse = Json.Document(Response),
    
    // ==========================================================================
    // DEEP JSON EXPANSION FUNCTIONS
    // Handles arbitrarily deep nested JSON structures from Jira API responses
    // ==========================================================================
    
    // Function to recursively expand record columns with depth control
    ExpandRecordRecursive = (table as table, columnName as text, optional prefix as text, optional maxDepth as number) =>
        let
            ActualPrefix = if prefix = null then "" else prefix & ".",
            ActualMaxDepth = if maxDepth = null then 3 else maxDepth,
            
            HasColumn = Table.HasColumns(table, columnName),
            Result = if HasColumn and ActualMaxDepth > 0 then
                let
                    SampleValue = try Table.Column(table, columnName){0} otherwise null,
                    IsRecord = SampleValue <> null and Value.Is(SampleValue, type record)
                in
                    if IsRecord then
                        let
                            RecordFields = Record.FieldNames(SampleValue),
                            NewColumnNames = List.Transform(RecordFields, each ActualPrefix & Text.Proper(_)),
                            ExpandedTable = Table.ExpandRecordColumn(table, columnName, RecordFields, NewColumnNames),
                            
                            // Recursively expand any nested records
                            FinalTable = List.Accumulate(
                                List.Zip({RecordFields, NewColumnNames}),
                                ExpandedTable,
                                (currentTable, fieldPair) =>
                                    let
                                        originalField = fieldPair{0},
                                        newColumnName = fieldPair{1},
                                        nestedSample = try Record.Field(SampleValue, originalField) otherwise null
                                    in
                                        if nestedSample <> null and Value.Is(nestedSample, type record) then
                                            @ExpandRecordRecursive(currentTable, newColumnName, ActualPrefix & Text.Proper(originalField), ActualMaxDepth - 1)
                                        else currentTable
                            )
                        in
                            FinalTable
                    else table
            else table
        in
            Result,
    
    // Function to intelligently expand all record columns in a table
    ExpandAllRecords = (table as table, optional maxDepth as number) =>
        let
            ActualMaxDepth = if maxDepth = null then 2 else maxDepth,
            ColumnNames = Table.ColumnNames(table),
            
            // Find columns that contain records
            RecordColumns = List.Select(ColumnNames, (columnName) =>
                let
                    SampleValue = try Table.Column(table, columnName){0} otherwise null
                in
                    SampleValue <> null and Value.Is(SampleValue, type record)
            ),
            
            // Expand each record column
            FinalTable = List.Accumulate(
                RecordColumns,
                table,
                (currentTable, columnName) => ExpandRecordRecursive(currentTable, columnName, columnName, ActualMaxDepth)
            )
        in
            FinalTable,
    
    // Convert JSON response to table
    DataTable = if Value.Is(JsonResponse, type list) then
        Table.FromList(JsonResponse, Splitter.SplitByNothing(), null, null, ExtraValues.Error)
    else
        Table.FromRecords({JsonResponse}),
    
    // Get all column names dynamically from the first record
    SampleRecord = if Value.Is(JsonResponse, type list) and List.Count(JsonResponse) > 0 then
        JsonResponse{0}
    else if Value.Is(JsonResponse, type record) then
        JsonResponse
    else
        [],
    
    AllColumnNames = if Value.Is(SampleRecord, type record) then 
        Record.FieldNames(SampleRecord) 
    else 
        {},
    
    // Expand the main record with ALL available columns
    ExpandedTable = if List.Count(AllColumnNames) > 0 then
        if Value.Is(JsonResponse, type list) then
            Table.ExpandRecordColumn(DataTable, "Column1", AllColumnNames)
        else
            DataTable
    else
        DataTable,
    
    // Apply intelligent deep expansion to all nested structures
    FinalTable = ExpandAllRecords(ExpandedTable, 3)
    
in
    FinalTable



