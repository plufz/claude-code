---
description: "Intelligently run tests based on recent changes, with options to fix issues or run specific tests"
---

Intelligently determine and run the appropriate tests for this project based on recent code changes.

**Default behavior** (no arguments):
- Analyze recent git changes to identify modified files
- Determine which test files or test suites are most relevant
- Run only the tests related to the changed code
- Report test results without attempting to fix failures

**Optional arguments:**
- `fix` - After running tests, attempt to fix any failing tests or code issues
- `all` - Run the complete test suite for the entire project
- `[feature/test name]` - Run tests matching the provided name (e.g., "whisper", "auth", "api")

**Implementation steps:**
1. Check for test configuration files (package.json, pyproject.toml, Cargo.toml, etc.)
2. If no arguments provided:
   - Run `git diff --name-only HEAD~5..HEAD` to find recently changed files
   - Identify corresponding test files or affected test suites
   - Run targeted tests based on the changes
3. Parse arguments:
   - If "all" is provided, run the full test suite
   - If "fix" is provided, analyze failures and attempt corrections
   - If a specific name is provided, search for matching test files or suites
4. Execute appropriate test commands
5. Report results clearly, showing passed/failed counts and any error details

Arguments: $ARGUMENTS