# Scripts for M Code Generation

This directory contains utility scripts for testing and managing the M code generation process.

## 🧪 `test-generation.sh`

**Purpose**: Test the M code generation process locally before committing changes.

**Usage**:
```bash
# From project root directory
./scripts/test-generation.sh
```

**What it does**:
1. ✅ Validates directory structure and dependencies
2. 💾 Backs up existing M code files (if any)
3. 🚀 Runs the generator with error handling
4. 📊 Provides generation summary and metrics
5. 🔍 Performs basic validation checks
6. 📝 Shows git status of changes

**Requirements**:
- Python 3.10+
- Valid `collections/atlassian-api.json` file
- Working `collections/generator.py`

**Output**:
- Generated M code files in `assets/` directory
- Backup of previous files (if they existed)
- Validation report with warnings
- Execution time and file count metrics

## 🔧 Local Development Workflow

### Before Making Changes
```bash
# Test current state
./scripts/test-generation.sh

# Review generated files
ls -la assets/*.m

# Check a sample file
head -30 assets/jira-project.m
```

### After Modifying Generator or Templates
```bash
# Test your changes
./scripts/test-generation.sh

# Compare with previous version
git diff assets/

# If satisfied, commit changes
git add assets/ collections/ .github/
git commit -m "Update M code generation"
git push
```

### Troubleshooting
```bash
# Check Python version
python3 --version

# Validate JSON format
python3 -c "import json; json.load(open('collections/atlassian-api.json'))"

# Test generator directly
cd collections && python3 generator.py

# Check for template issues
ls -la collections/templates/
```

## 🚀 Integration with GitHub Actions

The local test script simulates the GitHub Actions workflow:

| Local Script | GitHub Actions | Purpose |
|-------------|----------------|---------|
| Directory validation | Checkout step | Ensure proper structure |
| Python version check | Setup Python | Runtime environment |
| Generator execution | Generate M Code | Core functionality |
| File counting | Summary creation | Progress reporting |
| Basic validation | Validate workflow | Quality assurance |
| Git status | Commit changes | Change tracking |

## 📋 Best Practices

### Before Committing
1. **Run local tests** to catch issues early
2. **Review generated files** for quality
3. **Check validation warnings** and fix if needed
4. **Verify git status** shows expected changes

### When Modifying Templates
1. **Update all template types** consistently
2. **Test with different endpoint types** (basic, paginated, search)
3. **Verify authentication setup** in generated files
4. **Check deep JSON expansion** functionality

### API Collection Updates
1. **Validate JSON format** before committing
2. **Test with subset** of endpoints first
3. **Review new endpoint types** for template compatibility
4. **Update rules** if new patterns emerge

## 🛠️ Script Maintenance

The test script should be updated when:
- New validation rules are added
- Generator functionality changes
- Directory structure evolves
- New quality metrics are needed

Keep the script aligned with the GitHub Actions workflows to ensure consistency between local testing and automated processes.
