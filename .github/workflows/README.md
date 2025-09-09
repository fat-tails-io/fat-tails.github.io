# GitHub Actions Workflows for M Code Generation

This directory contains automated workflows for generating and validating Power Query M code from Atlassian API specifications.

## 🤖 Workflows Overview

### 1. Generate M Code (`generate-m-code.yml`)

**Purpose**: Automatically generates Power Query M code files from the Atlassian API collection.

**Triggers**:
- Push changes to `collections/atlassian-api.json`
- Updates to `collections/generator.py` or templates
- Manual workflow dispatch

**What it does**:
1. Detects OpenAPI specification format
2. Generates M code for 264 GET endpoints
3. Creates files in `assets/` directory
4. Commits and pushes changes automatically
5. Provides detailed summary of changes

**Output**: 
- 261+ M code files in `assets/jira-*.m`
- Each file includes authentication, deep JSON expansion, and error handling
- Files marked with `draft: true` for Jekyll integration

### 2. Validate M Code (`validate-m-code.yml`)

**Purpose**: Ensures generated M code meets quality standards and follows established rules.

**Triggers**:
- Pull requests modifying M code files
- Pushes to main branch with M code changes
- Manual workflow dispatch

**Validation checks**:
- ✅ Required front matter (`draft: true`)
- ✅ Authentication setup present
- ✅ Function naming conventions
- ✅ Deep JSON expansion included
- ✅ API endpoint documentation
- ✅ GET-only compliance (rule #20)
- ✅ File naming conventions

**Quality metrics**:
- Total lines of code
- Average file size
- Authentication coverage percentage
- Deep expansion coverage percentage

## 🔧 Configuration

### Required Secrets
- `GITHUB_TOKEN` (automatically provided)

### File Dependencies
- `collections/atlassian-api.json` - OpenAPI specification
- `collections/generator.py` - M code generator
- `collections/templates/*.template` - M code templates
- `.cursor/rules/api-generation-rules.mdc` - Generation rules

## 📊 Workflow Status

The workflows provide comprehensive reporting:

### Generation Workflow
- 📝 Commit messages with file counts
- 📊 Summary of new vs modified files
- 🔄 Automatic push to repository
- ❌ Failure notifications with troubleshooting

### Validation Workflow
- 🔍 Detailed validation report
- 📈 Quality metrics dashboard
- ⚠️ Warnings for potential issues
- 💬 PR comments with results

## 🚀 Manual Triggers

Both workflows can be triggered manually:

1. Go to **Actions** tab in GitHub
2. Select the desired workflow
3. Click **Run workflow**
4. Choose branch and options
5. Click **Run workflow**

## 🛠️ Troubleshooting

### Common Issues

**Generation fails**:
- Check API collection JSON format
- Verify generator script syntax
- Ensure all templates are present
- Review Python dependencies

**Validation fails**:
- Check M code file format
- Verify front matter structure
- Ensure authentication setup
- Follow naming conventions

### Debug Steps

1. **Check workflow logs** in Actions tab
2. **Review file changes** in commits
3. **Validate JSON format** of API collection
4. **Test generator locally** in collections directory
5. **Check rules compliance** against `.cursor/rules/api-generation-rules.mdc`

## 📋 Rules Compliance

The workflows enforce the rules defined in `.cursor/rules/api-generation-rules.mdc`:

- **GET endpoints only** (rules #5, #20)
- **Consistent authentication** (rules #2, #4)
- **Deep JSON expansion** (rule #3)
- **Proper file naming** (rule #14)
- **Jekyll integration** (rule #4)
- **Error handling** (rule #10)
- **Business context** (rules #7-9)

## 🔄 Workflow Evolution

These workflows are designed to evolve with the project:

- **Template updates** automatically trigger regeneration
- **Rule changes** are enforced in validation
- **API updates** generate new M code files
- **Quality metrics** track improvement over time

The automation ensures that M code generation remains consistent, high-quality, and aligned with project goals while reducing manual maintenance overhead.
