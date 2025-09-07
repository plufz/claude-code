---
description: "Analyze code for DRY violations and refactoring opportunities"
---

Perform a comprehensive DRY (Don't Repeat Yourself) analysis looking for:

**Duplicated Functionality:**
- Similar functions or methods with minor variations
- Repeated code blocks that can be extracted into functions
- Copy-pasted logic with slight modifications
- Similar class structures or interfaces
- Duplicate validation logic and error handling
- Repeated API call patterns and data transformations
- Similar component structures in UI frameworks
- Duplicate database query patterns

**Refactoring Opportunities:**
- Extract common functionality into shared utilities
- Create base classes or mixins for shared behavior
- Implement strategy patterns for variant behaviors
- Use configuration objects instead of hardcoded values
- Extract complex conditionals into named functions
- Create reusable components from repeated UI patterns
- Consolidate similar event handlers and callbacks
- Extract common middleware and filter logic

**Long Code Blocks:**
- Functions exceeding 50 lines that should be split
- Classes with too many responsibilities (SRP violations)
- Complex nested conditionals that need extraction
- Long parameter lists that should use objects/structs
- Deeply nested code that reduces readability
- Switch/case statements that could be refactored
- Long method chains that should be broken down
- Large data structures that could be modularized

**Shared Logic Opportunities:**
- Common constants that should be centralized
- Repeated configuration patterns
- Similar data validation and sanitization
- Common utility functions across modules
- Shared type definitions and interfaces
- Repeated test setup and teardown code
- Common error handling patterns
- Shared business logic implementations

**Language-Specific Patterns:**

**Python:**
- Repeated list comprehensions and generator expressions
- Similar decorator patterns that could be generalized
- Duplicate context managers and with statements
- Repeated exception handling blocks
- Similar property definitions in classes
- Duplicate imports across modules
- Repeated argument parsing and validation

**JavaScript/TypeScript:**
- Similar event handling and DOM manipulation
- Repeated async/await patterns and promise chains
- Duplicate component lifecycle methods
- Similar prop validation and default values
- Repeated API client setup and configuration
- Duplicate reducer logic in state management
- Similar utility functions for data transformation

**React:**
- Similar component structures with minor differences
- Repeated hooks logic that could be custom hooks
- Duplicate form handling and validation
- Similar prop drilling patterns
- Repeated conditional rendering logic
- Duplicate styling patterns and CSS-in-JS
- Similar component composition patterns

**CSS:**
- Repeated style declarations across selectors
- Similar responsive breakpoint patterns
- Duplicate animation and transition definitions
- Repeated layout patterns (flexbox, grid)
- Similar color and typography declarations
- Duplicate media queries and feature queries

When analyzing:
1. If given a file path, analyze that specific file for internal duplication
2. If given a directory path, analyze all files for cross-file duplication
3. If no path provided, analyze files in current directory
4. Prioritize by impact: 🔥 high impact, ⚡ medium impact, 💡 low impact
5. Suggest specific refactoring strategies with examples
6. Identify opportunities to create new shared modules/files
7. Recommend splitting long functions into smaller, focused ones

Use arguments as the target path: $ARGUMENTS