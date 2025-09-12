#!/bin/bash

# Translation Setup Script for fat-tails.io
# This script helps set up the translation feature

echo "🌍 Setting up Translation Feature for fat-tails.io"
echo "=================================================="

# Check if we're in the right directory
if [ ! -f "../_config.yml" ]; then
    echo "❌ Error: Please run this script from the translation/ directory"
    echo "   Usage: ./translation/setup-translation.sh"
    exit 1
fi

echo "✅ Repository structure verified"

# Create language directories (example with Spanish)
echo "📁 Creating example language directory structure..."
mkdir -p ../docs/es
mkdir -p ../_posts/es  
mkdir -p ../assets/es

echo "✅ Created example directories for Spanish (es)"

# Check if translation-context.json exists
if [ -f "translation-context.json" ]; then
    echo "✅ Translation context configuration found"
else
    echo "❌ translation-context.json not found - please ensure it exists in translation/ directory"
    exit 1
fi

# Check if GitHub workflow exists
if [ -f "../.github/workflows/translate-content.yml" ]; then
    echo "✅ Translation workflow found"
else
    echo "❌ Translation workflow not found - please ensure .github/workflows/translate-content.yml exists"
    exit 1
fi

# Check if translation rules exist
if [ -f "../.cursor/rules/translation-rules.mdc" ]; then
    echo "✅ Translation rules found"
else
    echo "❌ Translation rules not found - please ensure .cursor/rules/translation-rules.mdc exists"
    exit 1
fi

echo ""
echo "🎯 Setup Complete!"
echo "=================="
echo ""
echo "Next steps:"
echo "1. Add DEEPL_API_KEY to your repository secrets:"
echo "   - Go to Settings → Secrets and variables → Actions"
echo "   - Add new repository secret: DEEPL_API_KEY"
echo "   - Get your API key from: https://www.deepl.com/pro-api"
echo ""
echo "2. Test the translation workflow:"
echo "   - Go to Actions → Translate Content with DeepL"
echo "   - Click 'Run workflow'"
echo "   - Select a target language (e.g., Spanish)"
echo "   - Choose content type (e.g., docs)"
echo ""
echo "3. Monitor translation quality:"
echo "   - Check translated files in docs/es/, _posts/es/, assets/es/"
echo "   - Review business context and technical accuracy"
echo "   - Adjust translation-context.json if needed"
echo ""
echo "4. Configure Jekyll for multilingual support:"
echo "   - Update _config.yml with language-specific navigation"
echo "   - Set up language switching in your theme"
echo ""
echo "📚 Documentation:"
echo "   - Translation rules: .cursor/rules/translation-rules.mdc"
echo "   - Workflow documentation: .github/workflows/README.md"
echo "   - Context configuration: translation/translation-context.json"
echo ""
echo "🌍 Happy translating!"
