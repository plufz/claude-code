---
description: "Apply DRY and clean code principles to refactor source files"
---

Perform comprehensive code cleanup using DRY (Don't Repeat Yourself) and Clean Code principles on the specified target.

**Target**: $ARGUMENTS (can be a single file path or directory path)

## DRY (Don't Repeat Yourself) Principles:
1. **Eliminate Code Duplication**: Remove identical or similar code blocks by extracting them into functions/methods
2. **Single Source of Truth**: Ensure each piece of knowledge exists in exactly one place
3. **Extract Common Logic**: Move repeated business logic into shared utilities or base classes
4. **Consolidate Constants**: Define magic numbers/strings once in constants or configuration
5. **Unify Similar Functions**: Merge functions that do nearly the same thing with parameters
6. **Abstract Patterns**: Create abstractions for repeated patterns (decorators, mixins, etc.)

## Clean Code Principles:
1. **Meaningful Names**: Use descriptive, searchable names for variables, functions, and classes
2. **Functions Should Be Small**: Keep functions focused on one task (typically 20-30 lines max)
3. **Single Responsibility**: Each function/class should have one reason to change
4. **Clear Function Signatures**: Parameters should be minimal and self-explanatory
5. **Consistent Formatting**: Follow language conventions for indentation, spacing, naming
6. **Remove Dead Code**: Delete unused variables, functions, imports, and commented-out code
7. **Reduce Cognitive Load**: Simplify complex conditionals, reduce nesting levels
8. **Explicit Dependencies**: Make dependencies clear rather than hidden or implicit
9. **Error Handling**: Use proper exception handling, don't ignore errors
10. **Comments for Why, Not What**: Code should be self-documenting; comments explain reasoning
11. **Consistent Abstraction**: Keep abstraction levels consistent within functions
12. **Avoid Side Effects**: Functions should be predictable without hidden side effects

## Cleanup Process:

1. **Analyze the target**: If directory, scan all source files (.py, .js, .ts, .java, .cpp, .php, .css, .html, .sh, etc.)
2. **Identify Issues**: Look for code duplication, long functions, unclear names, dead code
3. **Apply Refactoring**: 
   - Extract repeated code into functions/utilities
   - Rename variables/functions for clarity  
   - Split large functions into smaller, focused ones
   - Remove unused imports, variables, and functions
   - Simplify complex conditional logic
   - Improve error handling
   - Add type hints where applicable
4. **Preserve Functionality**: Ensure all changes maintain the original behavior
5. **Follow Language Conventions**: Apply language-specific best practices
6. **Test Compatibility**: Verify changes don't break existing functionality

Focus areas for refactoring:
- Code duplication patterns
- Function length and complexity
- Variable and function naming clarity
- Import organization and cleanup
- Error handling improvements
- Type safety enhancements