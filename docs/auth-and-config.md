---
title: Auth and Config
description: Set up authentication, authorisation and configuration for worksheets.
nav_order: 1
---

# Approach
Security is an important and extensive topic, deserving of dedicated posts. This page focuses on getting the user up and running quickly, but gives explanations for why the steps are taken.

### Authentication
- Basic authentication to Atlassian APIs is achieved with [API tokens](https://developer.atlassian.com/server/jira/platform/basic-authentication/). The token, and other credentials, are base64 encoded then sent along in the authorization header. 
- Not currently achieveable with the standard web content connector for PowerQuery, so a PowerQuery query needs authentication credentials included, for example:

```m
// -----------------------------------------------------------------------------
// Self-Contained Direct API Call Function
// Create this as a query named: JiraApiCall
// -----------------------------------------------------------------------------
(endpoint as text, optional queryParams as record) =>
let
    // CONFIGURATION - Update these values once
    JiraBaseUrl = "https://your-domain.atlassian.net",
    UserEmail = "your-email@domain.com",
    ApiToken = "your-api-token-here",
    ApiVersion = "3",
    
    // Authentication setup
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

- You can create an API token for your Atlassian account by following the instructions [here](https://support.atlassian.com/atlassian-account/docs/manage-api-tokens-for-your-atlassian-account/).