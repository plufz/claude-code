---
description: "Review code for security issues, bugs, and readability problems"
---

Perform a comprehensive code review looking for:

**Security Issues:**
- Code injection vulnerabilities (eval, dynamic execution)
- SQL injection and database query vulnerabilities
- Cross-site scripting (XSS) and input sanitization issues
- Hardcoded secrets, passwords, and API keys
- Path traversal and file inclusion vulnerabilities
- Authentication and authorization bypass flaws
- Insecure data transmission and storage

**Bug Patterns:**
- Unhandled exceptions and missing error handling
- Inconsistent null/undefined/None checks
- Off-by-one errors in loops and array access
- Race conditions in async operations
- Memory leaks from unreleased resources
- Type coercion issues and unexpected conversions
- Infinite loops without proper exit conditions
- Missing validation for user inputs and external data

**Readability & Maintainability:**
- Overly long lines and poor formatting
- Complex nested logic and expressions
- Magic numbers and hardcoded values without explanation
- Deep nesting levels reducing readability
- Missing documentation and comments
- Overly complex functions, methods, and components
- Inconsistent naming conventions and code style
- Dead code and unused variables/imports

**Language-Specific Checks:**

**Python:**
- Use of `pickle` module with untrusted data
- Global variable misuse and name shadowing
- Improper exception handling (catching SystemExit, KeyboardInterrupt)
- Missing `__slots__` for memory optimization in data classes
- Use of `assert` statements for validation (disabled in production)
- Mutable default arguments (list/dict defaults)
- Missing type hints in function signatures
- f-string vs .format() vs % formatting inconsistencies
- Inefficient string concatenation in loops

**PHP:**
- SQL injection via string concatenation
- Cross-site scripting (XSS) from unescaped output
- Use of deprecated functions (mysql_*, ereg_*)
- Missing input validation and sanitization
- Improper session handling and CSRF protection
- File inclusion vulnerabilities (include/require with user input)
- Use of `extract()` function creating variable conflicts
- Missing error reporting configuration in production
- Weak password hashing (MD5, SHA1 instead of password_hash)

**JavaScript:**
- Use of `eval()`, `Function()` constructor, or `setTimeout`/`setInterval` with strings
- Prototype pollution vulnerabilities
- Missing input validation leading to XSS
- Improper handling of promises (missing catch blocks)
- Use of `==` instead of `===` for comparisons
- Missing `var`/`let`/`const` declarations (implicit globals)
- Callback hell and missing async/await patterns
- DOM manipulation without sanitization
- Missing Content Security Policy considerations
- Outdated dependencies with known vulnerabilities

**CSS:**
- CSS injection vulnerabilities from unsanitized user input
- Overly broad selectors causing performance issues
- Missing vendor prefixes for cross-browser compatibility
- Unused CSS rules and redundant declarations
- Hardcoded values instead of CSS variables/custom properties
- Missing accessibility considerations (focus states, color contrast)
- Inefficient selectors (descendant vs child selectors)
- Missing responsive design patterns and mobile-first approach
- Z-index conflicts and stacking context issues
- Large bundled CSS files without optimization

**React:**
- Missing key props in list rendering causing reconciliation issues
- Direct DOM manipulation bypassing React's virtual DOM
- Memory leaks from uncleared intervals/timeouts in useEffect
- Missing dependency arrays in useEffect hooks
- Mutating state directly instead of using setState/state setters
- Missing error boundaries for component error handling
- Inefficient re-renders from inline functions and objects in JSX
- Improper handling of async operations in components
- Missing prop validation (PropTypes or TypeScript)
- XSS vulnerabilities from dangerouslySetInnerHTML usage

When reviewing:
1. If given a file path, review that specific file
2. If given a directory path, review all relevant files recursively (Python, PHP, JavaScript, CSS, React)
3. If no path provided, review files in current directory
4. Prioritize findings by severity (high/medium/low)
5. Provide specific suggestions for improvement
6. Use appropriate emojis for visual clarity (🚨 high, ⚠️ medium, 💡 low)

Use arguments as the target path: $ARGUMENTS