---
title: Auth and Config
description: Set up authentication, authorisation and configuration for worksheets.
nav_order: 1
---

# Approach
Security is an important and extensive topic, deserving of dedicated posts. This page focuses on getting going quickly, but gives explanations for why the steps are taken.

## Authentication
Basic authentication to Atlassian APIs is achieved with [API tokens](https://developer.atlassian.com/server/jira/platform/basic-authentication/). The token, and other credentials, are base64 encoded then sent along in the authorization header. **NOT** achieveable with the standard web content connector for PowerQuery currently, so a PowerQuery query needs to include configuration and authentication:

```m
// -----------------------------------------------------------------------------
// Self-Contained Direct API Call Function
// Description: Authenticates and calls Jira API endpoint.
// Create this with query name: JiraApiCall
// -----------------------------------------------------------------------------
(endpoint as text, optional queryParams as record) =>
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
    
    // Build URL
    BaseUrl = JiraBaseUrl & "/rest/api/" & ApiVersion & "/" & endpoint,
    QueryString = if queryParams = null then "" else 
        "?" & Text.Combine(
            List.Transform(
                Record.FieldNames(queryParams),
                each _ & "=" & Uri.EscapeDataString(Text.From(Record.Field(queryParams, _)))
            ),
            "&"
        ),
    FullUrl = BaseUrl & QueryString,
    
    // Make API call
    Response = Web.Contents(FullUrl, [Headers = Headers]),
    JsonResponse = Json.Document(Response)
in
    JsonResponse
```
## Configuration
To make an Excel file more shareable with others, store configuration values in a dedicated worksheet, like this table:

| parameter      | value                             |
|:---------------|:----------------------------------|
| JiraBaseUrl    | https://your-domain.atlassian.net |
| UserEmail      | your-email@domain.com             |
| ApiToken       | your-api-token-here               |
| ApiVersion[^1] | '3                                |

Turn the table into an Excel Table (Insert > Table), and name the table `Parameters` (Table Design > Table Name).

[^1]: PowerQuery `m` does not concatenate config parameters of different types. Notice the treatment of ApiVersion as text.