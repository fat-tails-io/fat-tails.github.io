# GitHub Actions Workflows

This directory contains automated workflows for the fat-tails.io website.

## Available Workflows

### 1. Generate M Code from API Collection (`generate-m-code.yml`)
- **Purpose**: Automatically generates Power Query M code and documentation from Atlassian API collections
- **Triggers**: 
  - Changes to `collections/atlassian-api.json`
- Manual workflow dispatch
- **Outputs**: M code files in `assets/` and documentation in `docs/`

### 2. Validate M Code Quality (`validate-m-code.yml`)
- **Purpose**: Validates M code files and documentation for quality and compliance
- **Triggers**:
- Pull requests modifying M code files
  - Pushes to main branch
  - Manual validation
- **Outputs**: Validation reports and quality metrics

### 3. Translate Content with DeepL (`translate-content.yml`)
- **Purpose**: Translates website content to multiple languages using DeepL API
- **Triggers**:
  - Manual workflow dispatch (with language selection)
  - Automatic translation on content changes (optional)
- **Outputs**: Translated content in language-specific directories

## Translation Workflow

The translation workflow supports multiple languages and content types:

### Supported Languages
- Spanish (es)
- French (fr) 
- German (de)
- Italian (it)
- Portuguese (pt)
- Dutch (nl)
- Polish (pl)
- Russian (ru)
- Japanese (ja)
- Korean (ko)
- Chinese (zh)

### Content Types
- **docs**: Documentation articles
- **posts**: Blog posts
- **assets**: M code files (front matter only)
- **all**: All content types

### Features
- **Context-Aware Translation**: Uses business and technical context for better quality
- **Technical Content Preservation**: M code, API endpoints, and technical terms remain in English
- **Automatic Directory Structure**: Creates language-specific subdirectories
- **Front Matter Translation**: Translates titles and descriptions while preserving technical metadata
- **Quality Assurance**: Validates translations and maintains consistency

### Setup Requirements

1. **DeepL API Key**: Add `DEEPL_API_KEY` as a repository secret
2. **Translation Context**: Uses `translation/translation-context.json` for business terminology
3. **File Structure**: Automatically creates language directories

### Usage

#### Manual Translation
1. Go to Actions → Translate Content with DeepL
2. Click "Run workflow"
3. Select target language and content type
4. Choose whether to force retranslation
5. Enable/disable context inclusion

#### Automatic Translation
- Triggered when English content changes
- Can be disabled by modifying workflow triggers
- Only translates new or modified content

### Translation Rules

The translation follows strict rules defined in `.cursor/rules/translation-rules.mdc`:

- **Technical Content**: M code, API endpoints, parameters remain in English
- **Business Content**: Explanations, use cases, and descriptions are translated
- **Front Matter**: Titles and descriptions translated, technical metadata preserved
- **Quality**: Professional translation with domain-specific context
- **Consistency**: Terminology maintained across all translations

### File Organization

```
/docs/
  ├── [English files]
  ├── es/          # Spanish translations
  ├── fr/          # French translations
  └── [other-lang]/

/_posts/
  ├── [English files]
  ├── es/
  ├── fr/
  └── [other-lang]/

/assets/
  ├── [English M code]
  ├── es/
  ├── fr/
  └── [other-lang]/

/translation/
  ├── README.md                    # Translation documentation
  ├── translation-context.json     # DeepL context configuration
  └── setup-translation.sh        # Setup script
```

### Monitoring and Maintenance

- Translation status is reported in workflow summaries
- Changes are automatically committed with detailed commit messages
- Quality metrics are generated for each translation run
- Failed translations are reported with troubleshooting guidance

## Workflow Dependencies

- **Python 3.10**: Required for all workflows
- **DeepL API**: Required for translation workflow
- **GitHub Token**: Automatically provided for repository access
- **Repository Secrets**: DEEPL_API_KEY for translation functionality

## Troubleshooting

### Translation Issues
1. Verify DEEPL_API_KEY is set in repository secrets
2. Check DeepL API quota and billing status
3. Ensure source files are properly formatted
4. Review translation context configuration
5. Check workflow logs for specific errors

### M Code Generation Issues
1. Verify API collection file format
2. Check generator script syntax
3. Ensure all templates are present
4. Review generation rules compliance

### Validation Issues
1. Check file naming conventions
2. Verify front matter requirements
3. Ensure technical content preservation
4. Review quality metrics and warnings