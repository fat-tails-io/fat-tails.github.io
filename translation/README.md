# Translation Directory

This directory contains all files related to the translation feature for fat-tails.io.

## Files

### `translation-context.json`
Configuration file that provides context to DeepL API for better translation quality. Contains:
- Business context and terminology
- Target audience information
- Translation guidelines
- Quality indicators

### `setup-translation.sh`
Setup script that helps configure the translation feature. Run this script to:
- Verify all required files are present
- Create example language directories
- Provide setup instructions

## Usage

1. **Run the setup script**:
   ```bash
   ./translation/setup-translation.sh
   ```

2. **Configure DeepL API key** in repository secrets

3. **Test translation** using the GitHub workflow

## Directory Structure

```
translation/
├── README.md                    # This file
├── translation-context.json     # DeepL context configuration
└── setup-translation.sh        # Setup and verification script
```

## Integration

The translation feature integrates with:
- **GitHub Actions**: `.github/workflows/translate-content.yml`
- **Translation Rules**: `.cursor/rules/translation-rules.mdc`
- **Validation**: `.github/workflows/validate-m-code.yml`

## Customization

To customize translation behavior:
1. Edit `translation-context.json` for terminology and context
2. Update translation rules in `.cursor/rules/translation-rules.mdc`
3. Modify workflow triggers in `.github/workflows/translate-content.yml`

## Support

For issues or questions about the translation feature:
1. Check the workflow documentation: `.github/workflows/README.md`
2. Review translation rules: `.cursor/rules/translation-rules.mdc`
3. Examine workflow logs in GitHub Actions
