#!/usr/bin/env python3
"""
Translation Context Setup Script
Creates translation context for DeepL API from JSON configuration
"""

import json
import sys
import os

def create_translation_context():
    """Create translation context file for DeepL API"""
    
    # Check if translation context JSON exists
    context_file = "translation/translation-context.json"
    
    if os.path.exists(context_file):
        print("✅ Using existing translation/translation-context.json")
        
        try:
            with open(context_file, 'r', encoding='utf-8') as f:
                config = json.load(f)
            
            # Build context string
            context = f"""Business Context: {config['business_context']}

Target Audience: {', '.join(config['target_audience'])}
Content Types: {', '.join(config['content_types'])}
Tone: {', '.join(config['tone_guidelines'])}

Key Terminology:
"""
            
            # Add terminology from glossary
            for term, details in config['terminology_glossary'].items():
                context += f"- {details['en']}: {details['context']}\n"
            
            # Write context file
            with open('translation-context.txt', 'w', encoding='utf-8') as f:
                f.write(context)
            
            print("✅ Translation context created from JSON configuration")
            
        except Exception as e:
            print(f"❌ Error reading translation context JSON: {e}")
            create_fallback_context()
    
    else:
        print("⚠️ translation/translation-context.json not found, using default context")
        create_fallback_context()

def create_fallback_context():
    """Create fallback translation context"""
    
    context = """Business Context: This is technical documentation for project managers and finance teams working with Atlassian Jira and Microsoft Excel. The content helps bridge the gap between project management tools and spreadsheet analysis.

Key Terminology:
- Project Management: Project management, project analysis, project lifecycle
- Atlassian Tools: Jira, Confluence, Atlassian, API endpoints, REST API
- Microsoft Excel: Power Query, M code, Excel, spreadsheet, data analysis
- Business Analysis: Forensic analysis, project success metrics, value attribution
- Technical Terms: API, JSON, authentication, parameters, endpoints, data extraction

Target Audience: Project managers, finance teams, business analysts, data analysts
Content Type: Technical documentation, business analysis guides, code examples
Tone: Professional, clear, business-focused, technically accurate
"""
    
    with open('translation-context.txt', 'w', encoding='utf-8') as f:
        f.write(context)
    
    print("✅ Fallback translation context created")

if __name__ == "__main__":
    create_translation_context()
