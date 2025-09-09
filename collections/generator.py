#!/usr/bin/env python3
"""
Atlassian API M Code Generator

Processes Atlassian API collections (Postman/OpenAPI) and generates:
- Power Query M code files for each endpoint
- Documentation articles explaining business value
- Proper Jekyll front matter and structure

Usage: python generator.py [collection_file]
"""

import json
import os
import re
from pathlib import Path
from typing import Dict, List, Any, Optional
from dataclasses import dataclass

@dataclass
class EndpointInfo:
    """Information about an API endpoint"""
    name: str
    method: str
    path: str
    description: str
    parameters: List[Dict[str, Any]]
    responses: Dict[str, Any]
    tags: List[str]
    
class MCodeGenerator:
    """Generates Power Query M code from API specifications"""
    
    def __init__(self, collections_dir: str = "."):
        # Detect if we're running from within collections directory
        current_dir = Path.cwd()
        if current_dir.name == "collections":
            # Running from within collections directory
            self.collections_dir = Path(".")
            self.templates_dir = Path("templates")
            self.generated_dir = Path("generated")
            self.assets_dir = Path("../assets")
            self.docs_dir = Path("../docs")
        else:
            # Running from parent directory
            self.collections_dir = Path(collections_dir)
            self.templates_dir = self.collections_dir / "templates"
            self.generated_dir = self.collections_dir / "generated"
            self.assets_dir = Path("assets")
            self.docs_dir = Path("docs")
        
        # Ensure directories exist
        self.generated_dir.mkdir(exist_ok=True)
        self.assets_dir.mkdir(exist_ok=True)
        self.docs_dir.mkdir(exist_ok=True)
    
    def load_collection(self, collection_file: str) -> Dict[str, Any]:
        """Load API collection from JSON file"""
        collection_path = self.collections_dir / collection_file
        with open(collection_path, 'r') as f:
            return json.load(f)
    
    def parse_openapi_spec(self, spec: Dict[str, Any]) -> List[EndpointInfo]:
        """Parse OpenAPI specification format"""
        endpoints = []
        
        paths = spec.get('paths', {})
        for path, path_info in paths.items():
            for method, method_info in path_info.items():
                if method.upper() in ['GET', 'POST', 'PUT', 'PATCH', 'DELETE', 'HEAD', 'OPTIONS']:
                    # Only process GET methods according to our rules
                    if method.upper() != 'GET':
                        continue
                    
                    name = method_info.get('summary', f"{method.upper()}_{path.replace('/', '_')}")
                    description = method_info.get('description', method_info.get('summary', f"{method.upper()} request to {path}"))
                    tags = method_info.get('tags', [])
                    
                    # Extract parameters
                    parameters = []
                    for param in method_info.get('parameters', []):
                        parameters.append({
                            'name': param.get('name', ''),
                            'type': param.get('in', 'query'),  # query, path, header
                            'description': param.get('description', ''),
                            'required': param.get('required', False),
                            'schema': param.get('schema', {})
                        })
                    
                    endpoints.append(EndpointInfo(
                        name=name,
                        method=method.upper(),
                        path=path,
                        description=description,
                        parameters=parameters,
                        responses=method_info.get('responses', {}),
                        tags=tags
                    ))
        
        return endpoints
    
    def parse_postman_collection(self, collection: Dict[str, Any]) -> List[EndpointInfo]:
        """Parse Postman collection format"""
        endpoints = []
        
        def extract_from_item(item: Dict[str, Any], parent_tags: List[str] = []):
            if 'request' in item:
                # This is an endpoint
                request = item['request']
                method = request.get('method', 'GET')
                url = request.get('url', {})
                
                if isinstance(url, dict):
                    path = url.get('raw', '').split('{{baseUrl}}')[-1] if 'raw' in url else ''
                    path = path.split('?')[0]  # Remove query parameters
                else:
                    path = str(url).split('{{baseUrl}}')[-1] if '{{baseUrl}}' in str(url) else str(url)
                
                name = item.get('name', f"{method}_{path.replace('/', '_')}")
                description = item.get('description', f"{method} request to {path}")
                
                # Extract parameters
                parameters = []
                if 'query' in url:
                    for param in url['query']:
                        parameters.append({
                            'name': param.get('key', ''),
                            'type': 'query',
                            'description': param.get('description', ''),
                            'required': not param.get('disabled', False)
                        })
                
                endpoints.append(EndpointInfo(
                    name=name,
                    method=method,
                    path=path,
                    description=description,
                    parameters=parameters,
                    responses={},
                    tags=parent_tags + [item.get('name', '')]
                ))
            
            elif 'item' in item:
                # This is a folder, recurse into it
                folder_name = item.get('name', '')
                for sub_item in item['item']:
                    extract_from_item(sub_item, parent_tags + [folder_name])
        
        # Process top-level items
        for item in collection.get('item', []):
            extract_from_item(item)
        
        return endpoints
    
    def determine_template_type(self, endpoint: EndpointInfo) -> str:
        """Determine which template to use for an endpoint"""
        path_lower = endpoint.path.lower()
        method_lower = endpoint.method.lower()
        
        # Check for pagination indicators
        pagination_indicators = ['search', 'issues', 'comments', 'worklogs', 'history']
        if any(indicator in path_lower for indicator in pagination_indicators):
            return 'paginated-get.m.template'
        
        # Check for search endpoints
        if 'search' in path_lower or 'jql' in path_lower:
            return 'search-query.m.template'
        
        # Check for POST/PUT endpoints
        if method_lower in ['post', 'put', 'patch']:
            return 'post-create.m.template'
        
        # Default to basic GET
        return 'basic-get.m.template'
    
    def generate_function_name(self, endpoint: EndpointInfo) -> str:
        """Generate a PowerQuery function name from endpoint info"""
        # Start with method and clean path
        path_parts = [part for part in endpoint.path.split('/') if part and not part.startswith('{')]
        
        # Create camel case name
        name_parts = [endpoint.method.title()]
        for part in path_parts:
            if part not in ['rest', 'api', 'v3', '3']:
                # Convert kebab-case to PascalCase
                clean_part = ''.join(word.title() for word in part.split('-'))
                name_parts.append(clean_part)
        
        return 'Jira' + ''.join(name_parts)
    
    def generate_parameters_string(self, endpoint: EndpointInfo) -> str:
        """Generate the function parameters string"""
        params = []
        
        # Add path parameters
        path_params = re.findall(r'\{([^}]+)\}', endpoint.path)
        for param in path_params:
            params.append(f"{param} as text")
        
        # Add query parameters
        for param in endpoint.parameters:
            if param['type'] == 'query':
                param_type = "text"  # Default to text, could be enhanced
                optional = "" if param.get('required', False) else "optional "
                params.append(f"{optional}{param['name']} as {param_type}")
        
        return ", ".join(params) if params else ""
    
    def load_template(self, template_name: str) -> str:
        """Load a template file"""
        template_path = self.templates_dir / template_name
        with open(template_path, 'r') as f:
            return f.read()
    
    def generate_m_code(self, endpoint: EndpointInfo) -> str:
        """Generate M code for an endpoint"""
        template_type = self.determine_template_type(endpoint)
        template = self.load_template(template_type)
        
        # Generate replacements
        function_name = self.generate_function_name(endpoint)
        parameters = self.generate_parameters_string(endpoint)
        title = endpoint.name.replace('_', ' ').title()
        
        # Build endpoint path with parameter substitution
        endpoint_path = endpoint.path
        path_params = re.findall(r'\{([^}]+)\}', endpoint.path)
        for param in path_params:
            endpoint_path = endpoint_path.replace(f'{{{param}}}', f'" & {param} & "')
        
        # Template replacements
        replacements = {
            '{{TITLE}}': title,
            '{{DESCRIPTION}}': endpoint.description,
            '{{ENDPOINT}}': endpoint.path,
            '{{METHOD}}': endpoint.method,
            '{{FUNCTION_NAME}}': function_name,
            '{{PARAMETERS}}': parameters,
            '{{ENDPOINT_PATH}}': endpoint_path,
            '{{QUERY_PARAMS_SECTION}}': self.generate_query_params_section(endpoint),
            '{{URL_BUILDING_SECTION}}': self.generate_url_building_section(endpoint),
            '{{DATA_PROCESSING_SECTION}}': self.generate_data_processing_section(endpoint),
            '{{RETURN_VALUE}}': 'FinalTable',
            '{{DATA_FIELD}}': 'values'  # Common in Jira APIs
        }
        
        # Apply replacements
        result = template
        for placeholder, replacement in replacements.items():
            result = result.replace(placeholder, replacement)
        
        return result
    
    def generate_query_params_section(self, endpoint: EndpointInfo) -> str:
        """Generate query parameters handling section"""
        if not any(p['type'] == 'query' for p in endpoint.parameters):
            return "// No query parameters for this endpoint"
        
        lines = ["// Build query parameters", "QueryParams = ["]
        
        for param in endpoint.parameters:
            if param['type'] == 'query':
                name = param['name']
                if param.get('required', False):
                    lines.append(f'        {name} = {name},')
                else:
                    lines.append(f'        {name} = if {name} = null then null else {name},')
        
        lines.append("    ],")
        lines.append("")
        lines.append("    // Remove null parameters")
        lines.append("    CleanQueryParams = Record.SelectFields(")
        lines.append("        QueryParams,")
        lines.append("        List.Select(Record.FieldNames(QueryParams), each Record.Field(QueryParams, _) <> null)")
        lines.append("    ),")
        
        return "\n    ".join(lines)
    
    def generate_url_building_section(self, endpoint: EndpointInfo) -> str:
        """Generate URL building section"""
        has_query_params = any(p['type'] == 'query' for p in endpoint.parameters)
        
        if has_query_params:
            return '''QueryString = if Record.FieldCount(CleanQueryParams) = 0 then "" else 
        "?" & Text.Combine(
            List.Transform(
                Record.FieldNames(CleanQueryParams),
                each _ & "=" & Uri.EscapeDataString(Text.From(Record.Field(CleanQueryParams, _)))
            ),
            "&"
        ),
    FullUrl = BaseUrl & QueryString,'''
        else:
            return 'FullUrl = BaseUrl,'
    
    def generate_data_processing_section(self, endpoint: EndpointInfo) -> str:
        """Generate data processing section with deep expansion"""
        return '''// ==========================================================================
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
    FinalTable = ExpandAllRecords(ExpandedTable, 3)'''
    
    def generate_file(self, endpoint: EndpointInfo) -> tuple[str, str]:
        """Generate M code file for an endpoint"""
        m_code = self.generate_m_code(endpoint)
        function_name = self.generate_function_name(endpoint)
        filename = f"jira-{function_name.lower().replace('jira', '').replace('get', '').replace('create', '').replace('update', '').replace('delete', '')}.m"
        filename = re.sub(r'-+', '-', filename)  # Clean up multiple dashes
        filename = filename.strip('-')  # Remove leading/trailing dashes
        
        return filename, m_code
    
    def categorize_endpoint(self, endpoint: EndpointInfo) -> str:
        """Categorize an endpoint based on its path"""
        path = endpoint.path.lower()
        
        if '/project' in path:
            return 'Projects'
        elif '/issue' in path:
            return 'Issues'
        elif '/search' in path:
            return 'Search'
        elif '/user' in path:
            return 'Users'
        elif '/dashboard' in path:
            return 'Dashboards'
        elif '/filter' in path:
            return 'Filters'
        elif '/worklog' in path:
            return 'Worklogs'
        elif '/comment' in path:
            return 'Comments'
        elif '/workflow' in path:
            return 'Workflows'
        elif '/field' in path:
            return 'Fields'
        elif '/permission' in path:
            return 'Permissions'
        else:
            return 'Other'
    
    def process_collection(self, collection_file: str = "atlassian-api.json", categories: List[str] = None):
        """Process API collection and generate files for specified categories"""
        print(f"Loading collection: {collection_file}")
        collection = self.load_collection(collection_file)
        
        # Detect format and parse accordingly
        if 'openapi' in collection or 'swagger' in collection:
            print("Detected OpenAPI/Swagger specification")
            print("Parsing endpoints...")
            endpoints = self.parse_openapi_spec(collection)
        elif 'info' in collection and 'item' in collection:
            print("Detected Postman collection")
            print("Parsing endpoints...")
            endpoints = self.parse_postman_collection(collection)
        else:
            print("Unknown collection format. Attempting OpenAPI parsing...")
            endpoints = self.parse_openapi_spec(collection)
        
        print(f"Found {len(endpoints)} GET endpoints (POST/PUT/DELETE excluded per rules)")
        
        # Filter by categories if specified
        if categories:
            print(f"Filtering endpoints by categories: {', '.join(categories)}")
            filtered_endpoints = []
            category_counts = {}
            
            for endpoint in endpoints:
                endpoint_category = self.categorize_endpoint(endpoint)
                category_counts[endpoint_category] = category_counts.get(endpoint_category, 0) + 1
                
                if endpoint_category in categories:
                    filtered_endpoints.append(endpoint)
            
            print(f"Category breakdown:")
            for category, count in sorted(category_counts.items()):
                status = "✅ INCLUDED" if category in categories else "⏭️ SKIPPED"
                print(f"  {category}: {count} endpoints {status}")
            
            endpoints = filtered_endpoints
            print(f"Generating M code for {len(endpoints)} filtered endpoints")
        else:
            print("No category filter applied - processing all endpoints")
        
        generated_files = []
        
        for endpoint in endpoints:
            try:
                filename, m_code = self.generate_file(endpoint)
                
                # Write to assets directory
                output_path = self.assets_dir / filename
                with open(output_path, 'w') as f:
                    f.write(m_code)
                
                generated_files.append(filename)
                print(f"Generated: {filename}")
                
            except Exception as e:
                print(f"Error generating {endpoint.name}: {e}")
        
        print(f"\nGenerated {len(generated_files)} M code files:")
        for filename in sorted(generated_files):
            print(f"  - {filename}")

def main():
    import sys
    import argparse
    
    parser = argparse.ArgumentParser(description='Generate Power Query M code from Atlassian API collection')
    parser.add_argument('collection_file', nargs='?', default='atlassian-api.json',
                       help='API collection file (default: atlassian-api.json)')
    parser.add_argument('--categories', nargs='+', 
                       choices=['Projects', 'Issues', 'Search', 'Users', 'Dashboards', 'Filters', 
                               'Worklogs', 'Comments', 'Workflows', 'Fields', 'Permissions', 'Other'],
                       help='Limit generation to specific endpoint categories')
    parser.add_argument('--list-categories', action='store_true',
                       help='Show available categories and endpoint counts')
    
    args = parser.parse_args()
    
    generator = MCodeGenerator()
    
    if not (generator.collections_dir / args.collection_file).exists():
        print(f"Collection file not found: {args.collection_file}")
        print("Please place your Atlassian API collection file in the collections/ directory")
        return
    
    # If just listing categories, show them and exit
    if args.list_categories:
        collection = generator.load_collection(args.collection_file)
        
        # Parse endpoints
        if 'openapi' in collection or 'swagger' in collection:
            endpoints = generator.parse_openapi_spec(collection)
        else:
            endpoints = generator.parse_postman_collection(collection)
        
        # Count by category
        category_counts = {}
        for endpoint in endpoints:
            category = generator.categorize_endpoint(endpoint)
            category_counts[category] = category_counts.get(category, 0) + 1
        
        print(f"Available endpoint categories in {args.collection_file}:")
        print("=" * 50)
        for category, count in sorted(category_counts.items()):
            print(f"  {category:12} : {count:3d} endpoints")
        print("=" * 50)
        print(f"  {'Total':12} : {len(endpoints):3d} GET endpoints")
        print()
        print("Usage examples:")
        print(f"  python3 generator.py --categories Projects")
        print(f"  python3 generator.py --categories Projects Issues Users")
        print(f"  python3 generator.py  # (generates all categories)")
        return
    
    generator.process_collection(args.collection_file, args.categories)

if __name__ == "__main__":
    main()



