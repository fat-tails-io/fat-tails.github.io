---
title: Get All Jira Projects
description: Sample Power Query M code to retrieve all projects from Jira Cloud using the REST API
endpoint: /rest/api/3/project
method: GET
draft: true
---

// -----------------------------------------------------------------------------
// Jira Get All Projects Function
// Description: Retrieves all projects visible to the user from Jira Cloud
// API Endpoint: GET /rest/api/3/project
// Create this with query name: JiraGetAllProjects
// -----------------------------------------------------------------------------
(optional expand as text, optional recent as number, optional properties as list) =>
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
        expand = expand,
        recent = if recent = null then null else Number.ToText(recent),
        properties = if properties = null then null else Text.Combine(properties, ",")
    ],
    
    // Remove null parameters
    CleanQueryParams = Record.SelectFields(
        QueryParams,
        List.Select(Record.FieldNames(QueryParams), each Record.Field(QueryParams, _) <> null)
    ),
    
    // Build URL
    BaseUrl = JiraBaseUrl & "/rest/api/" & ApiVersion & "/" & "project",
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
                    // Get sample value to inspect structure
                    SampleValue = try Table.Column(table, columnName){0} otherwise null,
                    IsRecord = SampleValue <> null and Value.Is(SampleValue, type record),
                    IsList = SampleValue <> null and Value.Is(SampleValue, type list)
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
                    else if IsList then
                        // Handle lists by expanding to show list info (count, first item, etc.)
                        let
                            ListInfo = Table.AddColumn(table, ActualPrefix & "Count", each 
                                try List.Count(Record.Field(_, columnName)) otherwise 0),
                            WithFirstItem = Table.AddColumn(ListInfo, ActualPrefix & "FirstItem", each
                                try Text.From(List.First(Record.Field(_, columnName))) otherwise null),
                            CleanedTable = Table.RemoveColumns(WithFirstItem, {columnName})
                        in
                            CleanedTable
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
    
    // ==========================================================================
    // MAIN DATA PROCESSING
    // ==========================================================================
    
    // Convert to table for Excel analysis
    ProjectsTable = Table.FromList(JsonResponse, Splitter.SplitByNothing(), null, null, ExtraValues.Error),
    
    // Get all column names dynamically from the first record
    SampleRecord = JsonResponse{0},
    AllColumnNames = Record.FieldNames(SampleRecord),
    
    // Expand the main record with ALL available columns (handles expand parameter results)
    ExpandedTable = Table.ExpandRecordColumn(
        ProjectsTable, 
        "Column1", 
        AllColumnNames
    ),
    
    // Apply intelligent deep expansion to all nested structures
    // Set maxDepth to 3 to handle deeply nested JSON without overwhelming Excel
    FinalTable = ExpandAllRecords(ExpandedTable, 3),
    
    // DIAGNOSTIC: Add comprehensive diagnostic columns
    // This helps identify subscription tier limitations and API inconsistencies
    WithDiagnostics = Table.AddColumn(FinalTable, "RawFieldsFound", each 
        if List.Count(JsonResponse) > 0 then
            Text.Combine(Record.FieldNames(JsonResponse{0}), ", ")
        else "No data"
    ),
    
    WithInsightCheck = Table.AddColumn(WithDiagnostics, "HasInsightField", each
        if List.Count(JsonResponse) > 0 then
            List.Contains(Record.FieldNames(JsonResponse{0}), "insight")
        else false
    ),
    
    WithAnalyticsCheck = Table.AddColumn(WithInsightCheck, "PossibleAnalyticsFields", each
        if List.Count(JsonResponse) > 0 then
            let
                AllFields = Record.FieldNames(JsonResponse{0}),
                AnalyticsRelated = List.Select(AllFields, each 
                    Text.Contains(Text.Lower(_), "insight") or
                    Text.Contains(Text.Lower(_), "analytic") or 
                    Text.Contains(Text.Lower(_), "metric") or
                    Text.Contains(Text.Lower(_), "count") or
                    Text.Contains(Text.Lower(_), "statistic")
                )
            in
                Text.Combine(AnalyticsRelated, ", ")
        else "No data"
    )
in
    WithAnalyticsCheck
