# Research Plan: Deep Financial Analytics for JIRA with Forge Apps

## Executive Summary

This research plan outlines the strategy for creating Forge applications that provide deep financial analytics and project control metrics for JIRA work items. **The primary focus is on building Rovo agent skills through Forge actions**, enabling users to ask Rovo chat natural language questions about project finances and receive intelligent, contextual responses.

**Key Strategy**: We're prioritizing **Forge actions** that power Rovo's ability to calculate and explain financial metrics, plus **Smart Lozenge custom fields** for immediate visual feedback. This dual approach provides:
- **Rovo Actions**: Calculate financial metrics on-demand (CPI, SPI, budget variance, forecasts)
- **Rovo Chat**: Explain financial concepts in accessible language, identify risks, compare projects
- **Smart Lozenge**: Visual financial health indicators on issues for quick at-a-glance status

**User Experience**: 
- **Primary**: Users interact with financial analytics through **conversational Rovo chat**, asking questions like "What's the budget variance for this project?" or "Is this project on track financially?"
- **Secondary**: Users see **Smart Lozenge indicators** directly on issues showing financial status (On Budget, At Risk, Over Budget) - clicking can link to Rovo for detailed explanations

## Background Context

### Current State (Stepping Stone)
- **GitHub Pages Site**: Contains practical examples of Atlassian API integration
- **Power Query `.m` Files**: Excel-based integrations for finance teams
- **Documentation**: API endpoint guides in `docs/` directory
- **Gap**: Lack of deep, real-time financial analytics within JIRA itself

### Target State (Vision)
- **Rovo Agent Skills**: Comprehensive set of Forge actions enabling Rovo to answer financial questions
- **Natural Language Finance Queries**: Users ask Rovo chat for financial summaries and insights
- **Action-Based Calculations**: Rovo triggers financial calculations on-demand through actions
- **Smart Contextual Responses**: Rovo understands financial terminology and explains metrics clearly
- **Cross-functional Understanding**: Metrics presented by Rovo make sense to both finance and project teams

---

## Research Objectives

### Phase 1: Finance Metrics Research
1. Identify corporate finance metrics relevant to project management
2. Understand Earned Value Management (EVM) calculations
3. Research budget variance, cost performance, and forecasting metrics
4. Map metrics to JIRA data structures

### Phase 2: Project Control Metrics Research
1. Understand project control frameworks (EVM, Agile metrics)
2. Research schedule variance and cost variance indicators
3. Identify predictive indicators for project failure
4. Research early warning signal systems

### Phase 3: Forge Technical Research
1. Deep dive into Rovo agents, modules, and actions architecture
2. Research action patterns for financial calculations
3. Understand how Rovo invokes actions from natural language queries
4. Map financial metrics to action inputs/outputs
5. Understand JIRA API access patterns from Forge functions

### Phase 4: Design & Documentation
1. Design Forge app concepts
2. Document formulas and calculations
3. Create user experience mockups
4. Plan implementation roadmap

---

## Part 1: Corporate Finance Metrics for Project Management

### 1.1 Budget Variance Metrics

#### Budget Variance (BV)
- **Formula**: `BV = Budgeted Cost - Actual Cost`
- **JIRA Mapping**: Budget field vs. Actual Cost from worklogs/time tracking
- **Interpretation**: 
  - Positive = Under budget (good)
  - Negative = Over budget (bad)
- **Presentation**: Currency with color coding (green/red)

#### Budget Variance Percentage (BV%)
- **Formula**: `BV% = (Budget Variance / Budgeted Cost) × 100`
- **Use Case**: Normalized view for comparison across projects
- **Thresholds**: 
  - < -10% = Critical overrun
  - -5% to -10% = Warning
  - -5% to +5% = Acceptable
  - > +5% = Under budget

#### Cost Performance Index (CPI)
- **Formula**: `CPI = Earned Value (EV) / Actual Cost (AC)`
- **Earned Value**: `EV = % Complete × Budgeted Cost`
- **Interpretation**:
  - CPI > 1.0 = Under budget (efficient)
  - CPI = 1.0 = On budget
  - CPI < 1.0 = Over budget (inefficient)
- **JIRA Mapping**: 
  - % Complete from issue progress or story points
  - Budget from custom field
  - Actual Cost from time tracking/worklogs

### 1.2 Schedule Performance Metrics

#### Schedule Variance (SV)
- **Formula**: `SV = Earned Value (EV) - Planned Value (PV)`
- **Planned Value**: `PV = Planned % Complete × Budgeted Cost`
- **Interpretation**:
  - Positive = Ahead of schedule
  - Negative = Behind schedule
- **JIRA Mapping**: Compare planned vs. actual completion dates/timeline

#### Schedule Performance Index (SPI)
- **Formula**: `SPI = Earned Value (EV) / Planned Value (PV)`
- **Interpretation**:
  - SPI > 1.0 = Ahead of schedule
  - SPI = 1.0 = On schedule
  - SPI < 1.0 = Behind schedule
- **Use Case**: Normalized schedule performance

### 1.3 Forecasting Metrics

#### Estimate at Completion (EAC)
- **Formula (based on current CPI)**: `EAC = Budget at Completion (BAC) / CPI`
- **Alternative (trend-based)**: `EAC = AC + (BAC - EV) / CPI`
- **JIRA Mapping**: Project-level metric requiring aggregation

#### Estimate to Complete (ETC)
- **Formula**: `ETC = EAC - Actual Cost (AC)`
- **Use Case**: Remaining work cost projection

#### Variance at Completion (VAC)
- **Formula**: `VAC = BAC - EAC`
- **Interpretation**: Expected total variance at project completion

#### To Complete Performance Index (TCPI)
- **Formula**: `TCPI = (BAC - EV) / (BAC - AC)`
- **Interpretation**: Efficiency required to meet budget
  - TCPI > 1.0 = Must improve efficiency
  - TCPI = 1.0 = Current efficiency is sufficient
  - TCPI < 1.0 = Can relax efficiency

### 1.4 Financial Efficiency Metrics

#### Burn Rate
- **Formula**: `Burn Rate = Actual Cost / Time Elapsed`
- **JIRA Mapping**: Sum of worklogs over time period
- **Use Case**: Cash flow projection

#### Return on Investment (ROI)
- **Formula**: `ROI = (Value Delivered - Cost) / Cost × 100`
- **Challenge**: Requires value quantification (business value field)
- **JIRA Mapping**: Business value vs. total project cost

#### Net Present Value (NPV)
- **Formula**: Complex, requires discount rates and cash flow projections
- **Challenge**: More suitable for project portfolio level
- **Forge Consideration**: May be too complex for issue-level display

---

## Part 2: Project Control Metrics & Predictive Analytics

### 2.1 Earned Value Management (EVM) Framework

#### Core EVM Components
1. **Planned Value (PV)**: Budgeted cost of work scheduled
2. **Earned Value (EV)**: Budgeted cost of work performed
3. **Actual Cost (AC)**: Actual cost of work performed

#### EVM Integration Points in JIRA
- **Planned Value**: Based on original estimates and timeline
- **Earned Value**: Based on completion percentage and budget
- **Actual Cost**: Sum of logged time × hourly rates

### 2.2 Agile Project Metrics (Alternative Framework)

#### Velocity Trends
- **Metric**: Story points completed per sprint
- **Use Case**: Predict completion dates
- **JIRA Mapping**: Sprint summaries, story point fields

#### Burndown Rate
- **Formula**: `Remaining Work / Time Remaining`
- **JIRA Mapping**: Sprint burndown charts, epic progress

#### Sprint Goal Achievement
- **Metric**: Percentage of sprint goal met
- **Predictive Value**: Early indicator of project trajectory

### 2.3 Early Warning Indicators (Predictive Analytics)

#### Indicators of Project Failure Risk

1. **Schedule Slippage**
   - **Metric**: Days behind schedule
   - **Threshold**: > 5% of total timeline
   - **Risk Level**: Medium to High

2. **Cost Overrun**
   - **Metric**: CPI < 0.90
   - **Threshold**: Consistent over multiple reporting periods
   - **Risk Level**: High

3. **Scope Creep**
   - **Metric**: Issues added vs. Issues completed ratio
   - **JIRA Mapping**: Issue creation rate vs. completion rate
   - **Risk Level**: Medium

4. **Resource Availability**
   - **Metric**: Unassigned issues / Total issues
   - **Threshold**: > 10% unassigned
   - **Risk Level**: Medium

5. **Blocked Work**
   - **Metric**: Blocked issues / Total active issues
   - **JIRA Mapping**: Issues with "blocked" status or label
   - **Risk Level**: High

6. **Rework/Churn**
   - **Metric**: Issues moved back to "In Progress" / Total issues
   - **JIRA Mapping**: Issue transitions backwards in workflow
   - **Risk Level**: Medium

7. **Low Velocity Trend**
   - **Metric**: 3-sprint moving average declining
   - **Risk Level**: High (projected completion date slipping)

### 2.4 Composite Risk Score

#### Project Health Score (Proposed)
- **Components**:
  - Schedule Performance (SPI): 30% weight
  - Cost Performance (CPI): 30% weight
  - Scope Stability: 20% weight
  - Resource Health: 20% weight

- **Formula**: `Health Score = (SPI × 0.3) + (CPI × 0.3) + (ScopeScore × 0.2) + (ResourceScore × 0.2)`

- **Risk Categories**:
  - **0.8 - 1.0**: Healthy
  - **0.6 - 0.8**: At Risk
  - **< 0.6**: Critical

---

## Part 3: Forge Technical Capabilities

### 3.1 Available Forge Modules (from Research)

#### Core Modules for Financial Analytics

**Rovo Agent (`rovo:agent`)** - PRIMARY FOCUS
- AI-powered financial assistant accessible via Rovo chat
- Natural language understanding of financial queries
- Invokes actions to perform calculations and retrieve data
- Provides contextual explanations suitable for finance and non-finance audiences
- **Key Use Case**: Users ask Rovo questions like "What's the budget variance?" or "Is this project on track financially?"

**Actions (`action` modules)** - CORE IMPLEMENTATION
- **Primary mechanism** for Rovo to perform financial calculations
- Each action performs a specific financial metric calculation or data retrieval
- Actions return structured data that Rovo can interpret and explain
- Actions can be chained together for complex queries
- **Action Types Needed**:
  1. Calculate CPI (Cost Performance Index)
  2. Calculate SPI (Schedule Performance Index)
  3. Calculate Budget Variance
  4. Calculate Forecast at Completion (EAC)
  5. Calculate Project Risk Score
  6. Retrieve Financial Summary for Issue/Project
  7. Compare Projects Financially
  8. Identify Financial Risks

**Custom Fields (`jira:customField`)** - MEDIUM-HIGH PRIORITY
- Display financial health as smart lozenges on issues
- Read-only, computed custom field
- Uses same calculation functions as Rovo actions for consistency
- Visual indicator provides immediate feedback without chat interaction
- **Use Case**: Quick visual status indicator in issue lists and detail views

### 3.2 Data Access & Calculation

#### JIRA API Endpoints Needed
- **Worklogs**: `/rest/api/3/issue/{issueId}/worklog`
- **Issues**: `/rest/api/3/issue/{issueId}`
- **Search**: `/rest/api/3/search` (for aggregation queries)
- **Project**: `/rest/api/3/project/{projectId}`
- **Time Tracking**: Fields `timeoriginalestimate`, `timeestimate`, `timespent`

#### Forge Storage Options
- **Entity Properties**: Store calculated metrics per issue
- **Storage API**: Store project-level aggregations
- **Computed on Demand**: Calculate in real-time from API calls

### 3.3 Forge Events for Real-Time Updates

**Overview**: Forge events provide real-time notifications when JIRA data changes, enabling automatic recalculation of financial metrics. Instead of calculating on-demand every time, events can trigger updates when relevant data changes.

**Key Events for Financial Analytics**:

#### Issue Worklog Events (Critical for Actual Cost)
- **`avi:jira:created:worklog`**: New time logged → Recalculate Actual Cost (AC) → Recalculate CPI, SPI, Budget Variance
- **`avi:jira:updated:worklog`**: Worklog modified → Recalculate AC and dependent metrics
- **`avi:jira:deleted:worklog`**: Worklog removed → Recalculate AC and dependent metrics
- **Required Scope**: `read:jira-work`

**Impact**: Worklog events directly affect Actual Cost (AC), which is fundamental to:
- Cost Performance Index (CPI) = EV / AC
- Cost Variance (CV) = EV - AC
- Budget Variance calculations
- Forecast at Completion (EAC) calculations

#### Issue Update Events (Affects Earned Value)
- **`avi:jira:updated:issue`**: Issue fields changed → Check if progress/completion changed → Recalculate Earned Value (EV)
- **Required Scope**: `read:jira-work`
- **Key Fields to Monitor**:
  - Progress percentage (affects EV calculation)
  - Status changes (may affect completion percentage)
  - Story points completion
  - Budget field changes

**Impact**: Issue updates affect Earned Value (EV), which impacts:
- CPI = EV / AC
- SPI = EV / PV
- Schedule Variance (SV) = EV - PV
- All forecasting metrics (EAC, ETC, VAC)

#### Issue Assignment Events (Resource Tracking)
- **`avi:jira:assigned:issue`**: Resource allocation changed → May affect resource availability metrics for risk calculations
- **Required Scope**: `read:jira-work`

#### Project-Level Events (Aggregation Updates)
- **`avi:jira:created:project`**: New project created
- **`avi:jira:updated:project`**: Project metadata changed (may affect project-level budgets)
- **Required Scope**: `read:project:jira` (granular) or `read:jira-work` (classic)

#### Event-Driven Calculation Strategy

**Option 1: Real-Time Recalculation**
- Subscribe to relevant events via `trigger` module
- On event receipt, immediately recalculate affected metrics
- Store updated values in entity properties
- Smart Lozenge reads from cached entity properties (fast)
- Rovo actions can read from cache or recalculate on-demand

**Option 2: Event Queue + Batch Processing**
- Events trigger updates to a calculation queue
- Background function processes queue in batches
- Updates entity properties with latest calculations
- More efficient for high-volume changes

**Option 3: Hybrid Approach** (Recommended)
- Critical metrics (CPI, Budget Variance) update immediately on worklog/issue updates
- Less critical metrics update in batch
- Cache calculated values in entity properties
- Actions can force recalculation if cache is stale

#### Event Subscription Example (manifest.yaml)
```yaml
modules:
  trigger:
    - key: worklog-event-handler
      function: handleWorklogEvent
      events:
        - avi:jira:created:worklog
        - avi:jira:updated:worklog
        - avi:jira:deleted:worklog
    - key: issue-update-handler
      function: handleIssueUpdate
      events:
        - avi:jira:updated:issue
```

#### Performance Considerations
- **Event Volume**: High-volume JIRA instances may generate many events
- **Rate Limiting**: Ensure event handlers process efficiently
- **Error Handling**: Failed calculations shouldn't block event processing
- **Idempotency**: Event handlers should handle duplicate events gracefully

#### Caching Strategy
- Store calculated metrics in entity properties per issue/epic/project
- Include timestamp of last calculation
- Actions check cache age before deciding to recalculate
- Events invalidate/update cache automatically

#### Event Payload Access
Events provide structured payloads with:
- Issue/worklog data (often full objects)
- Change details (changelog for updates)
- User information (who made the change)
- Timestamps

**Reference**: [Jira Events Documentation](https://developer.atlassian.com/platform/forge/events-reference/jira/)

### 3.4 Action Implementation Patterns

#### Function Structure
- Each action maps to a Forge function
- Functions receive action input parameters from Rovo agent
- Functions call JIRA REST API to retrieve data
- Functions perform calculations using defined formulas (from Part 1 & 2)
- Functions return structured JSON response
- Rovo agent interprets JSON and generates natural language response

#### Shared Calculation Library
- Common calculation functions shared across actions
- EVM calculations (EV, PV, AC, CPI, SPI) reusable
- Reduces code duplication
- Ensures consistency across actions
- Example: `calculateEV()`, `calculateAC()`, `calculateCPI()` functions

#### Error Handling
- Handle missing data gracefully (no budget set, no worklogs)
- Provide meaningful error messages that Rovo can explain to users
- Return partial results when possible
- Log errors for debugging
- Example: "I couldn't calculate CPI because no budget is set for this issue. Would you like to set a budget?"

#### Performance Optimization
- Cache frequently accessed data in entity properties (e.g., hourly rates)
- Batch API calls when aggregating across multiple issues
- Optimize JQL queries for large projects (use pagination, filters)
- Consider async processing for very complex calculations
- Set reasonable timeouts for API calls

#### Action Chaining
- Simple queries: Single action invocation
- Complex queries: Rovo agent can chain multiple actions
- Example: "Get financial summary" action may internally call CPI, SPI, and EAC actions
- Or: Rovo agent determines it needs to call multiple actions and coordinates them

#### Response Format Consistency
- All actions return standardized JSON structure
- Includes: metric name, value, interpretation, status, details, explanation
- Enables Rovo to provide consistent, high-quality responses
- Makes it easier to add new actions later

---

## Part 4: Rovo Agent & Actions Design

### 4.1 Rovo Financial Assistant Agent (Primary Focus)

**Concept**: AI-powered financial advisor accessible through Rovo chat interface

**Implementation**:
- **Module**: `rovo:agent`
- **Prompt Engineering**: Configure agent to understand financial terminology, project management context, and user intent
- **Knowledge Base**: Agent understands all financial metrics, formulas, and their business implications
- **Conversation Starters**:
  - "What's the budget status for this project?"
  - "Calculate the cost performance index"
  - "Is this project on track financially?"
  - "Explain budget variance in simple terms"
  - "What's the risk of this project failing?"

**Agent Capabilities**:
- Answers questions about financial metrics
- Explains financial terms to non-finance users
- Performs calculations via actions
- Provides contextual insights (comparing projects, identifying trends)
- Suggests actions based on financial health

### 4.2 Core Financial Calculation Actions

#### Action 1: Calculate CPI (Cost Performance Index)

**Purpose**: Calculate and explain Cost Performance Index for an issue, epic, or project

**Action Definition**:
```yaml
key: calculate-cpi
name: Calculate Cost Performance Index
actionVerb: calculate
description: Calculates the Cost Performance Index (CPI) for a JIRA issue, epic, or project. CPI indicates cost efficiency - values above 1.0 mean under budget, below 1.0 means over budget.
inputs:
  issueKey:
    title: Issue Key or Project Key
    type: string
    required: true
    description: JIRA issue key (e.g., PROJ-123) or project key for project-level calculation
  scope:
    title: Calculation Scope
    type: string
    required: false
    description: 'Scope of calculation: issue, epic (includes children), or project (all issues)'
```

**Function Implementation**:
- Retrieve issue/project data from JIRA API
- Calculate Earned Value (EV) = % Complete × Budget
- Calculate Actual Cost (AC) = Sum of worklog hours × hourly rates
- Calculate CPI = EV / AC
- Return structured response with CPI value, interpretation, and context

**Rovo Response Format**:
- "The CPI for PROJ-123 is 1.15, which means you're **15% under budget**. This is excellent cost performance."
- Include breakdown: Budgeted: $10,000, Actual: $8,700, Variance: $1,300

#### Action 2: Calculate SPI (Schedule Performance Index)

**Purpose**: Calculate and explain Schedule Performance Index

**Action Definition**:
```yaml
key: calculate-spi
name: Calculate Schedule Performance Index
actionVerb: calculate
description: Calculates the Schedule Performance Index (SPI) for a JIRA issue, epic, or project. SPI indicates schedule efficiency - values above 1.0 mean ahead of schedule.
inputs:
  issueKey:
    title: Issue Key or Project Key
    type: string
    required: true
  scope:
    title: Calculation Scope
    type: string
    required: false
```

**Function Implementation**:
- Calculate Planned Value (PV) based on timeline and budget
- Calculate Earned Value (EV) based on completion percentage
- Calculate SPI = EV / PV
- Consider sprint velocity if agile project

#### Action 3: Calculate Budget Variance

**Purpose**: Calculate budget variance with detailed breakdown

**Action Definition**:
```yaml
key: calculate-budget-variance
name: Calculate Budget Variance
actionVerb: calculate
description: Calculates budget variance showing the difference between planned and actual costs. Returns both absolute variance and percentage.
inputs:
  issueKey:
    title: Issue Key or Project Key
    type: string
    required: true
  scope:
    title: Calculation Scope
    type: string
    required: false
```

**Function Implementation**:
- Retrieve budget from custom field or configuration
- Sum actual costs from worklogs
- Calculate variance = Budget - Actual Cost
- Calculate variance percentage
- Classify as: Under Budget, On Budget, Over Budget, Critical Overrun

#### Action 4: Calculate Forecast at Completion (EAC)

**Purpose**: Predict total project cost based on current performance

**Action Definition**:
```yaml
key: calculate-eac
name: Calculate Forecast at Completion
actionVerb: forecast
description: Calculates the Estimate at Completion (EAC) - the predicted total cost to complete the project based on current performance trends.
inputs:
  projectKey:
    title: Project Key
    type: string
    required: true
  method:
    title: Forecasting Method
    type: string
    required: false
    description: 'CPI-based (default) or trend-based calculation method'
```

**Function Implementation**:
- Calculate current CPI for project
- Calculate Budget at Completion (BAC)
- EAC = BAC / CPI (CPI-based method)
- Or: EAC = AC + (BAC - EV) / CPI (trend-based)
- Calculate Variance at Completion (VAC) = BAC - EAC
- Calculate Estimate to Complete (ETC) = EAC - AC

#### Action 5: Calculate Project Risk Score

**Purpose**: Composite risk assessment for project failure prediction

**Action Definition**:
```yaml
key: calculate-project-risk
name: Calculate Project Risk Score
actionVerb: assess
description: Calculates a composite risk score (0-100) indicating the likelihood of project failure based on multiple financial and project health indicators.
inputs:
  projectKey:
    title: Project Key
    type: string
    required: true
  includeDetailedBreakdown:
    title: Include Detailed Breakdown
    type: boolean
    required: false
    description: Whether to include component risk scores in response
```

**Function Implementation**:
- Calculate component scores:
  - Schedule Risk (based on SPI)
  - Cost Risk (based on CPI)
  - Scope Stability (issues added vs. completed)
  - Resource Health (unassigned work percentage)
  - Blocked Work Percentage
  - Velocity Trend (if agile)
- Weighted combination: `Risk Score = (ScheduleRisk × 0.3) + (CostRisk × 0.3) + (ScopeRisk × 0.2) + (ResourceRisk × 0.2)`
- Classify: Low (0-30), Medium (31-60), High (61-80), Critical (81-100)

#### Action 6: Get Financial Summary

**Purpose**: Comprehensive financial overview for issue or project

**Action Definition**:
```yaml
key: get-financial-summary
name: Get Financial Summary
actionVerb: summarize
description: Provides a comprehensive financial summary including budget, actual costs, variances, performance indices, and forecasts for an issue, epic, or project.
inputs:
  issueKey:
    title: Issue Key or Project Key
    type: string
    required: true
  scope:
    title: Calculation Scope
    type: string
    required: false
  includeForecasts:
    title: Include Forecasts
    type: boolean
    required: false
    description: Whether to include EAC, ETC, VAC forecasts
```

**Function Implementation**:
- Aggregates multiple financial metrics
- Calls other actions internally or calculates directly
- Returns structured summary:
  - Budget Overview (Budgeted, Actual, Variance)
  - Performance Indices (CPI, SPI)
  - Forecasting (EAC, ETC, VAC) if requested
  - Risk Assessment
  - Trend indicators (improving/declining)

#### Action 7: Compare Projects Financially

**Purpose**: Compare financial performance across multiple projects

**Action Definition**:
```yaml
key: compare-projects-financial
name: Compare Projects Financially
actionVerb: compare
description: Compares financial performance metrics across multiple JIRA projects, highlighting best and worst performers.
inputs:
  projectKeys:
    title: Project Keys
    type: array
    required: true
    description: Array of project keys to compare
  metrics:
    title: Metrics to Compare
    type: array
    required: false
    description: Specific metrics to compare (e.g., ['CPI', 'SPI', 'BudgetVariance'])
```

**Function Implementation**:
- Calculate requested metrics for each project
- Create comparison table
- Identify outliers (best/worst performers)
- Highlight trends and patterns

#### Action 8: Identify Financial Risks

**Purpose**: Scan project(s) for financial risk indicators

**Action Definition**:
```yaml
key: identify-financial-risks
name: Identify Financial Risks
actionVerb: identify
description: Scans issues or projects to identify financial risk indicators such as budget overruns, schedule delays, or concerning trends.
inputs:
  scope:
    title: Scope
    type: string
    required: true
    description: 'Scope: project key, issue key, or "all" for all projects user has access to'
  riskThreshold:
    title: Risk Threshold
    type: number
    required: false
    description: Minimum risk score to include (0-100, default 60)
```

**Function Implementation**:
- Search JIRA for issues/projects matching scope
- Calculate risk scores for each
- Filter by threshold
- Return prioritized list with explanations
- Suggest mitigation actions

### 4.3 Action Response Format Standardization

**Standard Response Structure**:
```json
{
  "metric": "CPI",
  "value": 1.15,
  "interpretation": "Under budget - excellent performance",
  "status": "good",
  "details": {
    "earnedValue": 11500,
    "actualCost": 10000,
    "budget": 10000
  },
  "explanation": "A CPI of 1.15 means you've earned $11,500 of value while spending $10,000, indicating 15% cost efficiency.",
  "recommendation": "Current cost performance is strong. Maintain current spending rate.",
  "relatedMetrics": {
    "SPI": 1.05,
    "BudgetVariance": 1500
  }
}
```

**Rovo Natural Language Response**:
- Converts structured data to conversational response
- Explains metric in context
- Provides actionable insights
- Links to related metrics when relevant

### 4.4 Rovo Agent Prompt Design

**Core Prompt Template**:
```
You are a financial analytics assistant for JIRA projects. Your role is to help users understand project finances through natural conversation.

You have access to financial calculation actions that can:
- Calculate cost and schedule performance indices (CPI, SPI)
- Calculate budget variances and forecasts
- Assess project risk scores
- Compare projects financially
- Identify financial risks

When users ask financial questions:
1. Determine what calculation is needed
2. Invoke the appropriate action(s)
3. Explain the results in clear, accessible language
4. Provide context about what the numbers mean
5. Suggest actionable next steps if risks are identified

Always explain financial terms in simple terms for non-finance users.
Always provide context about whether values are good or concerning.
Always suggest what actions to take based on the analysis.
```

### 4.5 Smart Financial Status Lozenge (Medium-High Priority)

**Concept**: Visual financial health indicator displayed on issues for quick at-a-glance status

**Implementation**:
- **Module**: `jira:customField`
- **Type**: Read-only, computed custom field
- **Display**: Lozenge component with color-coded status
- **Data Source**: Uses same calculation functions as Rovo actions for consistency

**Display Logic**:
- Calculate CPI for issue (or parent epic/project context)
- Display lozenge with appropriate appearance:
  - **"On Budget"** (green/success) if CPI ≥ 1.0
  - **"At Risk"** (yellow/moved) if 0.9 ≤ CPI < 1.0
  - **"Over Budget"** (red/removed) if CPI < 0.9
  - **"No Data"** (default) if budget or cost data unavailable

**User Experience**:
- Visible in issue list and issue detail views
- Color-coded for quick recognition
- Hover tooltip shows actual CPI value and details
- Clicking opens detailed breakdown (can link to Rovo chat for detailed explanation)

**Implementation Priority**: Medium-High
- Provides immediate visual feedback without requiring chat interaction
- Complements Rovo agent by showing status upfront
- Can reuse action calculation functions, reducing development effort
- High visibility increases adoption of financial metrics

**Example User Queries & Agent Responses**:

**Query**: "What's the budget variance for PROJ-123?"
- **Agent Action**: Invokes `calculate-budget-variance` action
- **Response**: "The budget variance for PROJ-123 is **-$2,500 (10% over budget)**. The project has a budget of $25,000 but actual costs are currently $27,500. I recommend reviewing recent worklogs to identify cost drivers."

**Query**: "Is this project on track financially?"
- **Agent Actions**: Invokes `get-financial-summary` action (which may internally call CPI, SPI, and risk calculations)
- **Response**: "Let me check the financial health of this project... The project shows **mixed performance**: CPI is 0.95 (slightly over budget) but SPI is 1.02 (ahead of schedule). Overall risk score is 45 (Medium Risk). While you're ahead of schedule, cost controls may need attention."

**Query**: "Explain CPI in simple terms"
- **Agent Action**: No action needed - responds from knowledge base
- **Response**: "CPI stands for Cost Performance Index. It's like a speedometer for your budget. If CPI is 1.0, you're spending exactly what you planned. Above 1.0 means you're getting more value than expected for your spending (good!). Below 1.0 means you're spending more than you're getting in value (concerning)."

**Query**: "What projects are at financial risk?"
- **Agent Action**: Invokes `identify-financial-risks` with scope="all"
- **Response**: "I found 3 projects with high financial risk: [list with details]. Would you like me to calculate detailed risk scores for any of these?"

---

## Part 5: Formula Reference & Implementation Guide

### 5.1 Core EVM Formulas (Quick Reference)

| Metric | Formula | JIRA Data Source |
|--------|---------|------------------|
| Planned Value (PV) | % Scheduled × Budget | Timeline, Original Estimate, Budget Field |
| Earned Value (EV) | % Complete × Budget | Issue Progress, Story Points, Budget Field |
| Actual Cost (AC) | Sum(Worklog Hours × Rate) | Worklogs API, Hourly Rate Configuration |
| Cost Variance (CV) | EV - AC | Calculated |
| Schedule Variance (SV) | EV - PV | Calculated |
| CPI | EV / AC | Calculated |
| SPI | EV / PV | Calculated |
| EAC (CPI-based) | BAC / CPI | Budget at Completion, CPI |
| EAC (Trend) | AC + (BAC - EV) / CPI | All above |
| ETC | EAC - AC | Calculated |
| VAC | BAC - EAC | Calculated |
| TCPI | (BAC - EV) / (BAC - AC) | Calculated |

### 5.2 Implementation Considerations

#### Data Aggregation Levels
1. **Issue Level**: Individual work item financial metrics
2. **Epic Level**: Roll-up of child issues
3. **Sprint Level**: Time-boxed financial performance
4. **Project Level**: Overall project financial health

#### Calculation Frequency & Triggers

**Event-Driven (Primary for Real-Time)**
- **Trigger Module**: Subscribe to JIRA events via `trigger` module
- **Worklog Events**: Recalculate AC and dependent metrics immediately when worklogs created/updated/deleted
- **Issue Update Events**: Recalculate EV when progress/status/completion changes
- **Caching**: Store calculated values in entity properties for fast retrieval
- **Benefits**: Always up-to-date, minimal latency, efficient

**On-Demand (Rovo Actions)**
- Actions can read from cached entity properties (fast)
- Actions can force recalculation if data is stale or cache missing
- Actions can calculate for scopes not yet cached (new queries)

**Scheduled (Background Maintenance)**
- **Scheduled Trigger**: Via `scheduledTrigger` module for periodic recalculations
- **Use Cases**: 
  - Recalculate project/epic-level aggregations
  - Validate cache consistency
  - Update metrics for issues not recently modified
- **Frequency**: Hourly/daily depending on requirements

**Hybrid Approach** (Recommended)
- Events handle immediate updates for changed data
- Scheduled triggers handle aggregations and validation
- Actions provide on-demand access with fallback to real-time calculation

#### Performance Optimization
- Cache calculated values in entity properties
- Aggregate at epic/project level
- Use JIRA search API with aggregations where possible
- Limit calculation depth for nested hierarchies

### 5.3 Currency & Rate Configuration

#### Hourly Rate Management
- Store in Forge storage or entity properties
- Default rate per user/role
- Override per project if needed
- Support multiple currencies (convert to base currency)

#### Budget Configuration
- Budget per issue (custom field)
- Budget per epic (sum of children or override)
- Project budget (sum of epics or override)

---

## Part 6: User Experience Design

### 6.1 Finance-Friendly Display

#### Numeric Formatting
- Currency: $1,234.56 or -$1,234.56
- Percentages: 12.5% or (12.5%) for negative
- Indices: 1.05 (2 decimal places)

#### Color Coding Standards
- **Green**: Good/Positive (under budget, ahead of schedule, healthy)
- **Yellow/Orange**: Warning/At Risk
- **Red**: Bad/Negative (over budget, behind schedule, critical)

#### Accessibility
- Don't rely on color alone
- Include text labels and symbols
- Tooltips with detailed explanations
- Support screen readers

### 6.2 Non-Finance-Friendly Explanations

#### Tooltips & Help Text
- **CPI**: "Cost Performance Index. Above 1.0 means we're spending less than planned. Below 1.0 means we're spending more."
- **Budget Variance**: "The difference between what we planned to spend and what we've actually spent."
- **EAC**: "Estimated cost to complete the entire project based on current performance."

#### Visual Aids
- Progress bars for percentages
- Trend arrows (↑ improving, ↓ worsening)
- Status icons (✓, ⚠, ✗)
- Simple charts with clear labels

### 6.3 Rovo Response Design

#### Conversational Flow
- **Greeting**: Acknowledge query and confirm understanding
- **Action Execution**: "Let me calculate that for you..." or "Analyzing financial data..."
- **Results Presentation**: Clear, structured explanation
- **Context**: Explain what the numbers mean in business terms
- **Next Steps**: Suggest actions if risks identified

#### Response Tone
- **Professional but Accessible**: Use clear language, avoid jargon when possible
- **Data-Driven**: Always provide specific numbers, not just general statements
- **Actionable**: Include recommendations based on findings
- **Educational**: Explain metrics when helpful, especially for non-finance users

---

## Part 7: Research Tasks & Timeline

### Phase 1: Foundation Research (Week 1-2)
- [x] Research Forge modules and capabilities
- [x] Research corporate finance metrics
- [x] Research EVM and project control metrics
- [x] Map metrics to JIRA data structures
- [x] Document formulas and calculations
- [x] Research Rovo agent and actions architecture

### Phase 2: Rovo Agent & Actions Design (Week 3-4)
- [ ] Design Rovo agent prompt and conversation flow
- [ ] Define all required financial calculation actions
- [ ] Design action input/output schemas
- [ ] Create action response format standards
- [ ] Design natural language response templates
- [ ] Define risk scoring algorithms for risk assessment action
- [ ] Design Smart Lozenge custom field specifications
- [ ] Plan integration between lozenge display and action calculations

### Phase 2.5: Events & Real-Time Calculation Design (Week 4-5)
- [ ] Research and document all relevant JIRA events for financial metrics
- [ ] Design event subscription strategy (which events to subscribe to)
- [ ] Design event handler functions for each event type
- [ ] Design caching strategy (entity properties structure)
- [ ] Design cache invalidation and refresh logic
- [ ] Design event payload processing patterns
- [ ] Plan error handling for event-driven calculations
- [ ] Design batch processing for high-volume events
- [ ] Plan integration between events and actions (cache vs. recalculate)

### Phase 3: Technical Design (Week 5-6)
- [ ] Design Forge app architecture (Rovo agent + actions + event handlers)
- [ ] Design action function implementations
- [ ] Design event handler function implementations
- [ ] Define data storage strategy (entity properties for caching)
- [ ] Design calculation engine (shared by actions and event handlers)
- [ ] Plan JIRA API integration patterns
- [ ] Design cache structure and entity property schemas
- [ ] Design cache refresh and invalidation logic
- [ ] Design error handling and edge cases
- [ ] Plan action chaining for complex queries
- [ ] Design event-to-action integration (when actions read from cache)

### Phase 4: Prototype Development (Week 7-10)
- [ ] Build MVP Rovo agent with basic prompt
- [ ] Implement core actions (CPI, SPI, Budget Variance, EAC)
- [ ] Implement financial summary action
- [ ] Implement risk assessment action
- [ ] Implement event handlers for worklog events (created/updated/deleted)
- [ ] Implement event handler for issue update events
- [ ] Implement entity property caching system
- [ ] Integrate actions with cache (read from cache when available)
- [ ] Build Smart Lozenge custom field
- [ ] Integrate lozenge with cached calculations
- [ ] Test event-driven real-time updates
- [ ] Test action accuracy with sample JIRA data (with and without cache)
- [ ] Test Rovo conversation flows
- [ ] Test lozenge display and tooltip interactions
- [ ] Validate natural language responses
- [ ] Performance testing (action response times, event processing latency, lozenge calculation performance)
- [ ] Load testing (event volume handling)

### Phase 5: Documentation & Refinement (Week 11-12)
- [ ] Document all formulas
- [ ] Create user guides
- [ ] Create developer documentation
- [ ] Refine based on feedback
- [ ] Prepare for production

---

## Part 8: Success Criteria

### Technical Success
- ✅ Accurate financial calculations matching industry standards
- ✅ Real-time or near-real-time metric updates
- ✅ Scalable to large projects (1000+ issues)
- ✅ Integration with existing JIRA workflows

### User Experience Success
- ✅ Finance teams can trust the metrics
- ✅ Non-finance teams understand the indicators
- ✅ Metrics are actionable (clear what to do)
- ✅ Minimal performance impact on JIRA

### Business Success
- ✅ Early detection of budget overruns
- ✅ Improved project forecasting accuracy
- ✅ Better alignment between finance and project teams
- ✅ Data-driven decision making

---

## Part 9: Next Steps & Recommendations

### Immediate Actions
1. **Complete Metric Research**: Deep dive into finance and project control formulas
2. **Research Forge Events**: Study JIRA event types, payloads, and subscription patterns
3. **Prototype Core Actions**: Start with CPI and Budget Variance actions (most requested metrics)
4. **Prototype Event Handlers**: Build event handlers for worklog events to maintain real-time AC calculations
5. **Design Rovo Agent Prompt**: Create initial prompt for financial assistant
6. **Design Smart Lozenge**: Define lozenge display logic and integration with cached calculations
7. **Design Caching Strategy**: Define entity property structure for storing calculated metrics
8. **Validate Calculations**: Test formulas with sample JIRA data
9. **User Research**: Interview users who currently ask Rovo for summaries to understand common questions
10. **Action Prioritization**: Identify which financial queries are most common

### Considerations
- **Rate Configuration**: How to handle hourly rates (user, role, project-specific)
- **Budget Management**: Where budgets are stored and managed
- **Currency Handling**: Multi-currency support if needed
- **Historical Tracking**: Should metrics be time-series or snapshot?
- **Access Control**: Who can see financial metrics (permissions)
- **Event Processing**: How to handle high-volume events efficiently
- **Cache Strategy**: When to recalculate vs. use cache, cache invalidation rules
- **Event Reliability**: Handling missed events, event processing failures
- **Real-Time vs. Accuracy Trade-offs**: Balance between immediate updates and calculation accuracy

### Future Enhancements
- Additional actions for advanced metrics (ROI, NPV, burn rate trends)
- Action chaining for complex multi-step analyses
- Historical trend analysis actions (time-series metrics stored via events)
- Machine learning-enhanced risk prediction
- Integration with external finance systems
- Proactive Rovo suggestions based on financial health changes
- **Event-Driven Alerts**: Automated notifications when metrics cross thresholds
- **Event History**: Track metric changes over time through event logging
- **Batch Event Processing**: Optimize for very high-volume JIRA instances
- **Event Replay**: Ability to recalculate historical metrics from event logs

---

## Appendix: Resources & References

### Forge Documentation
- Forge Development Guide (via MCP tool)
- Forge UI Kit Components (via MCP tool)
- Forge Manifest Reference (via MCP tool)
- Rovo Agent Documentation (via MCP tool)

### Finance & Project Control References
- PMI PMBOK Guide (Earned Value Management)
- PMI Practice Standard for Earned Value Management
- Agile metrics best practices
- Corporate finance for project managers

### JIRA API References
- JIRA REST API v3 Documentation
- Worklog API endpoints
- Search API with aggregations
- Custom field API

### Forge Events References
- [Jira Events Reference](https://developer.atlassian.com/platform/forge/events-reference/jira/) - Complete guide to all JIRA events
- Issue Worklog Events: `avi:jira:created:worklog`, `avi:jira:updated:worklog`, `avi:jira:deleted:worklog`
- Issue Update Events: `avi:jira:updated:issue`
- Project Events: `avi:jira:created:project`, `avi:jira:updated:project`
- Trigger Module Documentation

---

**Document Version**: 2.1  
**Last Updated**: [Current Date]  
**Status**: Research Phase - Focused on Rovo Actions + Event-Driven Real-Time Updates  
**Owner**: Research Team

**Change Log**:
- v2.1: Added comprehensive Forge events integration for real-time metric updates (worklog events, issue update events, caching strategy)
- v2.0: Refocused plan on Rovo agent skills and Forge actions (removed dashboard emphasis)
- v1.0: Initial comprehensive research plan

