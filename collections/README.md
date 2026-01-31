# API Collections and Code Generation

This directory contains the infrastructure for automatically generating Power Query M code from Atlassian API specifications.

**Current Scope: GET Endpoints Only** - Focused on data retrieval and analysis use cases.

## Structure

- `atlassian-api.json` - Main API collection (Postman/OpenAPI format)
- `templates/` - M code templates for different endpoint types
- `generated/` - Auto-generated files (not committed to git)
- `generator.py` - Python script to process collections and generate code

## Usage

1. Place your Atlassian API collection file as `atlassian-api.json`
2. Run the generator: `python generator.py`
3. Generated M code files will appear in `../assets/`
4. Generated documentation will appear in `../docs/`

## Template Types (GET Only)

- **basic-get.m.template** - Simple GET endpoints for retrieving individual resources
- **paginated-get.m.template** - GET endpoints with pagination (issues, comments, etc.)
- **search-query.m.template** - Search and JQL GET endpoints for complex queries

*Note: POST, PUT, PATCH, and DELETE endpoints are excluded to focus on data analysis use cases.*

## Generated Features

Each generated M code file includes:
- Authentication setup using the Parameters table
- Deep JSON expansion handling for complex JSON responses
- Error handling and diagnostics for troubleshooting
- Business-friendly column naming for project analysis
- Proper Jekyll front matter for documentation integration
- Focus on data retrieval and analysis (GET endpoints only)
