#!/bin/bash
# Test M Code Generation Locally
# This script simulates the GitHub Actions workflow for local testing

set -e  # Exit on any error

# Parse command line arguments
CATEGORIES=""
SHOW_HELP=false

while [[ $# -gt 0 ]]; do
  case $1 in
    --categories)
      CATEGORIES="$2"
      shift 2
      ;;
    --list-categories)
      cd collections && python3 generator.py --list-categories
      exit 0
      ;;
    --help|-h)
      SHOW_HELP=true
      shift
      ;;
    *)
      echo "Unknown option: $1"
      SHOW_HELP=true
      shift
      ;;
  esac
done

if [ "$SHOW_HELP" = true ]; then
  echo "Usage: $0 [OPTIONS]"
  echo ""
  echo "Options:"
  echo "  --categories CATS    Generate only specified categories (e.g., 'Projects Issues')"
  echo "  --list-categories    Show available categories and exit"
  echo "  --help, -h          Show this help message"
  echo ""
  echo "Examples:"
  echo "  $0                           # Generate all categories"
  echo "  $0 --categories Projects     # Generate only Projects"
  echo "  $0 --categories 'Projects Issues Users'  # Generate multiple categories"
  echo "  $0 --list-categories         # Show available categories"
  exit 0
fi

echo "🧪 Testing M Code Generation Locally"
echo "===================================="

if [ -n "$CATEGORIES" ]; then
  echo "📂 Target categories: $CATEGORIES"
else
  echo "📂 Target categories: All categories"
fi

# Check if we're in the right directory
if [ ! -f "collections/generator.py" ]; then
    echo "❌ Error: Must be run from project root directory"
    echo "Expected to find: collections/generator.py"
    exit 1
fi

# Check if API collection exists
if [ ! -f "collections/atlassian-api.json" ]; then
    echo "❌ Error: API collection file not found"
    echo "Expected: collections/atlassian-api.json"
    exit 1
fi

echo "✅ Directory structure validated"

# Check Python version
PYTHON_VERSION=$(python3 --version 2>&1 | cut -d' ' -f2)
echo "🐍 Using Python: $PYTHON_VERSION"

# Backup existing M code files (if any)
if [ -d "assets" ] && [ "$(ls -A assets/*.m 2>/dev/null)" ]; then
    BACKUP_DIR="assets_backup_$(date +%Y%m%d_%H%M%S)"
    echo "💾 Backing up existing M code files to: $BACKUP_DIR"
    mkdir -p "$BACKUP_DIR"
    cp assets/*.m "$BACKUP_DIR/" 2>/dev/null || true
fi

# Run the generator
echo "🚀 Running M code generator..."
cd collections

# Capture start time
START_TIME=$(date +%s)

# Run generator and capture output
if [ -n "$CATEGORIES" ]; then
    if python3 generator.py --categories $CATEGORIES > generation.log 2>&1; then
        echo "✅ Generation completed successfully (categories: $CATEGORIES)"
    else
        echo "❌ Generation failed"
        echo "📋 Error log:"
        echo "============="
        cat generation.log
        exit 1
    fi
else
    if python3 generator.py > generation.log 2>&1; then
        echo "✅ Generation completed successfully (all categories)"
    else
        echo "❌ Generation failed"
        echo "📋 Error log:"
        echo "============="
        cat generation.log
        exit 1
    fi
fi

# Show summary from log
echo ""
echo "📊 Generation Summary:"
echo "===================="
tail -10 generation.log | grep -E "(Generated|Found|endpoints)" || echo "Check generation.log for details"

# Calculate execution time
END_TIME=$(date +%s)
DURATION=$((END_TIME - START_TIME))

cd ..

# Count generated files
M_FILES_COUNT=$(find assets -name "*.m" 2>/dev/null | wc -l)
echo ""
echo "📈 Results:"
echo "==========="
echo "• Generated M code files: $M_FILES_COUNT"
echo "• Execution time: ${DURATION}s"
echo "• Output directory: assets/"

# Basic validation
echo ""
echo "🔍 Quick Validation:"
echo "==================="

VALID_COUNT=0
WARNING_COUNT=0

for file in assets/*.m; do
    if [ -f "$file" ]; then
        # Check for draft: true
        if head -10 "$file" | grep -q "draft: true"; then
            ((VALID_COUNT++))
        else
            echo "⚠️ Missing 'draft: true': $(basename $file)"
            ((WARNING_COUNT++))
        fi
        
        # Check for authentication
        if ! grep -q "ConfigTable = Excel.CurrentWorkbook" "$file"; then
            echo "⚠️ Missing authentication: $(basename $file)"
            ((WARNING_COUNT++))
        fi
    fi
done

echo "• Files with proper front matter: $VALID_COUNT"
echo "• Validation warnings: $WARNING_COUNT"

# Git status check
if [ -n "$(git status --porcelain assets/ 2>/dev/null)" ]; then
    echo ""
    echo "📝 Git Status:"
    echo "=============="
    git status --short assets/ 2>/dev/null || echo "Git not available or not in a git repository"
fi

echo ""
echo "✅ Local testing completed!"
echo ""
echo "💡 Next steps:"
echo "• Review generated files in assets/ directory"
echo "• Test M code files in Power Query"
echo "• Commit changes if satisfied with results"
echo "• Push to trigger GitHub Actions workflow"

# Clean up
rm -f collections/generation.log
