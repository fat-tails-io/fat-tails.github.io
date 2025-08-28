---
title: Auth and Config
description: Set up authentication, authorisation and configuration for worksheets.
nav_order: 1
---

# Approach


## Authentication
- Basic authentication to Atlassian APIs is achieved using ([API tokens](https://developer.atlassian.com/server/jira/platform/basic-authentication/)). The token, and other credentials, are base64 encoded and sent along in the authorization header. 
- Not currently achieveable with the standard web content connector for PowerQuery, so a PowerQuery query needs authentication credentials included, for example:

<CODE>

 is You can create an API token for your Atlassian account by following the instructions [here](https://support.atlassian.com/atlassian-account/docs/manage-api-tokens-for-your-atlassian-account/).