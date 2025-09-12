#!/usr/bin/env python3
"""
Documentation Translation Script
Translates markdown documentation files using DeepL API
"""

import requests
import os
import re
import sys
from pathlib import Path

def translate_with_deepl(text, target_lang, api_key, context=""):
    """Translate text using DeepL API with optional context"""
    # Check if API key is provided
    if not api_key:
        print("❌ Error: DEEPL_API_KEY environment variable is not set")
        return text
    
    # Use appropriate endpoint based on API key format
    if api_key.endswith(':fx'):
        url = "https://api-free.deepl.com/v2/translate"
    else:
        url = "https://api.deepl.com/v2/translate"
    
    headers = {
        "Authorization": f"DeepL-Auth-Key {api_key}",
        "Content-Type": "application/x-www-form-urlencoded"
    }
    
    data = {
        "text": text,
        "target_lang": target_lang.upper(),
        "source_lang": "EN"
    }
    
    # Add context if provided
    if context:
        data["context"] = context
    
    response = requests.post(url, headers=headers, data=data)
    
    if response.status_code == 200:
        result = response.json()
        return result["translations"][0]["text"]
    else:
        print(f"DeepL API error: {response.status_code} - {response.text}")
        print(f"API Key format: {'Free' if api_key.endswith(':fx') else 'Pro'}")
        print(f"Endpoint used: {url}")
        return text

def extract_front_matter(content):
    """Extract and return front matter and body separately"""
    if content.startswith("---"):
        parts = content.split("---", 2)
        if len(parts) >= 3:
            return parts[1], parts[2]
    return "", content

def translate_front_matter(front_matter, target_lang, api_key, context):
    """Translate front matter fields"""
    lines = front_matter.strip().split('\n')
    translated_lines = []
    
    for line in lines:
        if ':' in line and not line.strip().startswith('#'):
            key, value = line.split(':', 1)
            value = value.strip()
            
            # Translate specific fields
            if key.strip() in ['title', 'description'] and value:
                translated_value = translate_with_deepl(value, target_lang, api_key, context)
                translated_lines.append(f"{key}: {translated_value}")
            else:
                translated_lines.append(line)
        else:
            translated_lines.append(line)
    
    return '\n'.join(translated_lines)

def translate_markdown_content(content, target_lang, api_key, context):
    """Translate markdown content while preserving code blocks and technical elements"""
    # Split content into sections
    sections = re.split(r'(```[^`]*```|`[^`]*`|\[.*?\]\(.*?\))', content)
    translated_sections = []
    
    for section in sections:
        if section.startswith('```') and section.endswith('```'):
            # Code block - don't translate
            translated_sections.append(section)
        elif section.startswith('`') and section.endswith('`'):
            # Inline code - don't translate
            translated_sections.append(section)
        elif section.startswith('[') and '](' in section and section.endswith(')'):
            # Link - translate text but preserve URL
            match = re.match(r'\[([^\]]*)\]\(([^)]*)\)', section)
            if match:
                text, url = match.groups()
                if text.strip():
                    translated_text = translate_with_deepl(text, target_lang, api_key, context)
                    translated_sections.append(f"[{translated_text}]({url})")
                else:
                    translated_sections.append(section)
            else:
                translated_sections.append(section)
        else:
            # Regular text - translate
            if section.strip():
                translated_sections.append(translate_with_deepl(section, target_lang, api_key, context))
            else:
                translated_sections.append(section)
    
    return ''.join(translated_sections)

def process_file(input_file, output_file, target_lang, api_key, context):
    """Process a single markdown file"""
    print(f"Processing: {input_file}")
    
    with open(input_file, 'r', encoding='utf-8') as f:
        content = f.read()
    
    # Extract front matter
    front_matter, body = extract_front_matter(content)
    
    # Translate front matter
    if front_matter:
        translated_front_matter = translate_front_matter(front_matter, target_lang, api_key, context)
        # Add language and original file metadata
        translated_front_matter += f"\nlang: {target_lang}\noriginal: /{input_file}\n"
    else:
        translated_front_matter = f"---\nlang: {target_lang}\noriginal: /{input_file}\n---\n"
    
    # Translate body content
    translated_body = translate_markdown_content(body, target_lang, api_key, context)
    
    # Combine translated content
    translated_content = f"---\n{translated_front_matter}\n---\n{translated_body}"
    
    # Write translated file
    os.makedirs(os.path.dirname(output_file), exist_ok=True)
    with open(output_file, 'w', encoding='utf-8') as f:
        f.write(translated_content)
    
    print(f"✅ Translated: {output_file}")

def main():
    """Main execution"""
    if len(sys.argv) < 4:
        print("Usage: python3 translate-docs.py <target_lang> <context_file> <api_key>")
        sys.exit(1)
    
    target_lang = sys.argv[1]
    context_file = sys.argv[2] if len(sys.argv) > 2 else ""
    api_key = sys.argv[3] if len(sys.argv) > 3 else ""
    
    # Debug information
    print(f"🔧 Debug Info:")
    print(f"  - Target language: {target_lang}")
    print(f"  - Context file: {context_file}")
    print(f"  - API key present: {'Yes' if api_key else 'No'}")
    if api_key:
        print(f"  - API key format: {'Free' if api_key.endswith(':fx') else 'Pro'}")
        print(f"  - API key length: {len(api_key)} characters")
    else:
        print("  - ❌ API key not provided as argument!")
        sys.exit(1)
    
    # Load context
    context = ""
    if context_file and os.path.exists(context_file):
        with open(context_file, 'r', encoding='utf-8') as f:
            context = f.read()
    
    # Process documentation files
    with open("docs_files.txt", 'r') as f:
        for line in f:
            input_file = line.strip()
            if input_file:
                output_file = f"docs/{target_lang}/{os.path.basename(input_file)}"
                process_file(input_file, output_file, target_lang, api_key, context)

if __name__ == "__main__":
    main()
