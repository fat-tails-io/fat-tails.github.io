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
    
    // Convert to table for Excel analysis
    ProjectsTable = Table.FromList(JsonResponse, Splitter.SplitByNothing(), null, null, ExtraValues.Error),
    ExpandedTable = Table.ExpandRecordColumn(
        ProjectsTable, 
        "Column1", 
        {"id", "key", "name", "projectTypeKey", "simplified", "style", "description", "avatarUrls", "projectCategory", "insight"},
        {"ProjectId", "ProjectKey", "ProjectName", "ProjectType", "Simplified", "Style", "Description", "AvatarUrls", "Category", "Insight"}
    ),
    
    // Expand category information if available
    FinalTable = if Table.HasColumns(ExpandedTable, "Category") then
        Table.ExpandRecordColumn(
            ExpandedTable,
            "Category",
            {"id", "name", "description"},
            {"CategoryId", "CategoryName", "CategoryDescription"}
        )
        else ExpandedTable,
        
    // Expand insight information if available
    InsightTable = if Table.HasColumns(FinalTable, "Insight") then
        Table.ExpandRecordColumn(
            FinalTable,
            "Insight",
            {"totalIssueCount", "lastIssueUpdateTime"},
            {"TotalIssues", "LastIssueUpdate"}
        )
        else FinalTable
in
    InsightTable