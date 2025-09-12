#!/usr/bin/env python3
"""
Assets Translation Script
Translates M code files (front matter only) using DeepL API
"""

import requests
import os
import sys

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

def translate_m_code_file(input_file, output_file, target_lang, api_key, context):
    """Translate M code file front matter only"""
    print(f"Processing M code: {input_file}")
    
    with open(input_file, 'r', encoding='utf-8') as f:
        content = f.read()
    
    # Extract front matter (between --- markers)
    if content.startswith("---"):
        parts = content.split("---", 2)
        if len(parts) >= 3:
            front_matter = parts[1]
            m_code = parts[2]
            
            # Translate front matter fields
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
            
            # Add language metadata
            translated_lines.append(f"lang: {target_lang}")
            translated_lines.append(f"original: /{input_file}")
            
            translated_front_matter = '\n'.join(translated_lines)
            translated_content = f"---\n{translated_front_matter}\n---{m_code}"
        else:
            translated_content = content
    else:
        # No front matter, add basic structure
        translated_content = f"---\nlang: {target_lang}\noriginal: /{input_file}\n---\n{content}"
    
    # Write translated file
    os.makedirs(os.path.dirname(output_file), exist_ok=True)
    with open(output_file, 'w', encoding='utf-8') as f:
        f.write(translated_content)
    
    print(f"✅ Translated M code: {output_file}")

def main():
    """Main execution"""
    if len(sys.argv) < 4:
        print("Usage: python3 translate-assets.py <target_lang> <context_file> <api_key>")
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
    
    # Process M code files
    with open("assets_files.txt", 'r') as f:
        for line in f:
            input_file = line.strip()
            if input_file:
                output_file = f"assets/{target_lang}/{os.path.basename(input_file)}"
                translate_m_code_file(input_file, output_file, target_lang, api_key, context)

if __name__ == "__main__":
    main()
