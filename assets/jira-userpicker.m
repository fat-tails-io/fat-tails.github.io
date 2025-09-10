---
title: Find Users For Picker
description: |-
  Returns a list of users whose attributes match the query term. The returned object includes the `html` field where the matched query term is highlighted with the HTML strong tag. A list of account IDs can be provided to exclude users from the results.
  
  This operation takes the users in the range defined by `maxResults`, up to the thousandth user, and then returns only the users from that range that match the query term. This means the operation usually returns fewer users than specified in `maxResults`. To get all the users who match the query term, use [Get all users](#api-rest-api-3-users-search-get) and filter the records in your code.
  
  Privacy controls are applied to the response based on the users' preferences. This could mean, for example, that the user's email address is hidden. See the [Profile visibility overview](https://developer.atlassian.com/cloud/jira/platform/profile-visibility/) for more details.
  
  This operation can be accessed anonymously.
  
  **[Permissions](#permissions) required:** *Browse users and groups* [global permission](https://confluence.atlassian.com/x/x4dKLg). Anonymous calls and calls by users without the required permission return search results for an exact name match only.
endpoint: /rest/api/3/user/picker
method: GET
published: false
---

// -----------------------------------------------------------------------------
// JiraGetUserPicker
// Description: |-
  Returns a list of users whose attributes match the query term. The returned object includes the `html` field where the matched query term is highlighted with the HTML strong tag. A list of account IDs can be provided to exclude users from the results.
  
  This operation takes the users in the range defined by `maxResults`, up to the thousandth user, and then returns only the users from that range that match the query term. This means the operation usually returns fewer users than specified in `maxResults`. To get all the users who match the query term, use [Get all users](#api-rest-api-3-users-search-get) and filter the records in your code.
  
  Privacy controls are applied to the response based on the users' preferences. This could mean, for example, that the user's email address is hidden. See the [Profile visibility overview](https://developer.atlassian.com/cloud/jira/platform/profile-visibility/) for more details.
  
  This operation can be accessed anonymously.
  
  **[Permissions](#permissions) required:** *Browse users and groups* [global permission](https://confluence.atlassian.com/x/x4dKLg). Anonymous calls and calls by users without the required permission return search results for an exact name match only.
// API Endpoint: GET /rest/api/3/user/picker
// Create this with query name: JiraGetUserPicker
// -----------------------------------------------------------------------------
(query as text, optional maxResults as text, optional showAvatar as text, optional exclude as text, optional excludeAccountIds as text, optional avatarSize as text, optional excludeConnectUsers as text) =>
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
            query = query,
            maxResults = if maxResults = null then null else maxResults,
            showAvatar = if showAvatar = null then null else showAvatar,
            exclude = if exclude = null then null else exclude,
            excludeAccountIds = if excludeAccountIds = null then null else excludeAccountIds,
            avatarSize = if avatarSize = null then null else avatarSize,
            excludeConnectUsers = if excludeConnectUsers = null then null else excludeConnectUsers,
        ],
    
        // Remove null parameters
        CleanQueryParams = Record.SelectFields(
            QueryParams,
            List.Select(Record.FieldNames(QueryParams), each Record.Field(QueryParams, _) <> null)
        ),
    
    // Build URL
    BaseUrl = JiraBaseUrl & "/rest/api/3/user/picker",
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



