#!/bin/bash

# List Files for Translation
# This script helps you identify files that can be translated

echo "📋 Available Files for Translation"
echo "=================================="
echo ""

# Check if we're in the right directory
if [ ! -f "../_config.yml" ]; then
    echo "❌ Error: Please run this script from the translation/ directory"
    echo "   Usage: ./translation/list-files.sh"
    exit 1
fi

echo "📚 Documentation Files (docs/):"
echo "-------------------------------"
if [ -d "../docs" ]; then
    for file in ../docs/*.md; do
        if [ -f "$file" ] && [ ! "$file" = "../docs/README.md" ]; then
            echo "  - $(basename "$file")"
        fi
    done
else
    echo "  No docs directory found"
fi

echo ""
echo "📝 Blog Post Files (_posts/):"
echo "-----------------------------"
if [ -d "../_posts" ]; then
    for file in ../_posts/*.md; do
        if [ -f "$file" ]; then
            echo "  - $(basename "$file")"
        fi
    done
else
    echo "  No _posts directory found"
fi

echo ""
echo "⚙️ M Code Files (assets/):"
echo "-------------------------"
if [ -d "../assets" ]; then
    for file in ../assets/*.m; do
        if [ -f "$file" ]; then
            echo "  - $(basename "$file")"
        fi
    done
else
    echo "  No assets directory found"
fi

echo ""
echo "🎯 Usage Examples:"
echo "=================="
echo ""
echo "To translate specific files, use the GitHub workflow with:"
echo "  Content Type: specific_files"
echo "  Specific Files: docs/auth-and-config.md,docs/jira-projects-get.md"
echo ""
echo "To translate all documentation:"
echo "  Content Type: docs"
echo ""
echo "To translate all blog posts:"
echo "  Content Type: posts"
echo ""
echo "To translate all M code files:"
echo "  Content Type: assets"
echo ""
echo "💡 Tips:"
echo "  - Use comma-separated file paths for multiple files"
echo "  - Include the full path from repository root"
echo "  - Check file names carefully for typos"
echo "  - Start with a few files to test translation quality"
