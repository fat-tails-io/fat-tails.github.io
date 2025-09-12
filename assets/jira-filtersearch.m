---
title: Search For Filters
description: |-
  Returns a [paginated](#pagination) list of filters. Use this operation to get:
  
   *  specific filters, by defining `id` only.
   *  filters that match all of the specified attributes. For example, all filters for a user with a particular word in their name. When multiple attributes are specified only filters matching all attributes are returned.
  
  This operation can be accessed anonymously.
  
  **[Permissions](#permissions) required:** None, however, only the following filters that match the query parameters are returned:
  
   *  filters owned by the user.
   *  filters shared with a group that the user is a member of.
   *  filters shared with a private project that the user has *Browse projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for.
   *  filters shared with a public project.
   *  filters shared with the public.
endpoint: /rest/api/3/filter/search
method: GET
published: false
---

// -----------------------------------------------------------------------------
// JiraGetFilterSearch
// Description: |-
  Returns a [paginated](#pagination) list of filters. Use this operation to get:
  
   *  specific filters, by defining `id` only.
   *  filters that match all of the specified attributes. For example, all filters for a user with a particular word in their name. When multiple attributes are specified only filters matching all attributes are returned.
  
  This operation can be accessed anonymously.
  
  **[Permissions](#permissions) required:** None, however, only the following filters that match the query parameters are returned:
  
   *  filters owned by the user.
   *  filters shared with a group that the user is a member of.
   *  filters shared with a private project that the user has *Browse projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for.
   *  filters shared with a public project.
   *  filters shared with the public. with automatic pagination handling
// API Endpoint: GET /rest/api/3/filter/search
// Create this with query name: JiraGetFilterSearch
// -----------------------------------------------------------------------------
(optional filterName as text, optional accountId as text, optional owner as text, optional groupname as text, optional groupId as text, optional projectId as text, optional id as text, optional orderBy as text, optional startAt as text, optional maxResults as text, optional expand as text, optional overrideSharePermissions as text, optional isSubstringMatch as text) =>
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
    
    // Pagination function
    GetAllPages = (startAt as number) =>
        let
            // Build query parameters
    QueryParams = [
            filterName = if filterName = null then null else filterName,
            accountId = if accountId = null then null else accountId,
            owner = if owner = null then null else owner,
            groupname = if groupname = null then null else groupname,
            groupId = if groupId = null then null else groupId,
            projectId = if projectId = null then null else projectId,
            id = if id = null then null else id,
            orderBy = if orderBy = null then null else orderBy,
            startAt = if startAt = null then null else startAt,
            maxResults = if maxResults = null then null else maxResults,
            expand = if expand = null then null else expand,
            overrideSharePermissions = if overrideSharePermissions = null then null else overrideSharePermissions,
            isSubstringMatch = if isSubstringMatch = null then null else isSubstringMatch,
        ],
    
        // Remove null parameters
        CleanQueryParams = Record.SelectFields(
            QueryParams,
            List.Select(Record.FieldNames(QueryParams), each Record.Field(QueryParams, _) <> null)
        ),
            
            // Build URL with pagination
            BaseUrl = JiraBaseUrl & "/rest/api/3/filter/search",
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
            
            // Extract data and pagination info
            CurrentData = JsonResponse[values],
            Total = JsonResponse[total],
            MaxResults = JsonResponse[maxResults],
            StartAt = JsonResponse[startAt],
            
            // Recursively get next page if needed
            NextPage = if StartAt + MaxResults < Total then
                @GetAllPages(StartAt + MaxResults)
            else {},
            
            // Combine current page with next pages
            AllData = CurrentData & NextPage
        in
            AllData,
    
    // Get all data starting from page 0
    AllResults = GetAllPages(0),
    
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



