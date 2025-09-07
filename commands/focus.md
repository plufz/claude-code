---
description: "Review recent changes against specific documentation or guidelines"
---

Review recent changes in the context of specific documentation, guidelines, or instructions provided by the user.

This command helps ensure that recent modifications align with project standards, security requirements, architectural decisions, or other documented guidelines.

**Usage Examples:**
- `/focus docs/security.md` - Review changes against security guidelines
- `/focus docs/coding-standards.md` - Check adherence to coding standards
- `/focus README.md` - Ensure changes align with project documentation
- `/focus "Use TypeScript interfaces for all API contracts"` - Review against specific instruction

**Review Process:**
1. **Analyze Target Changes:**
   - **Priority 1:** If staged files exist, focus primarily on those changes (git diff --cached)
   - **Priority 2:** If uncommitted or untracked files exist, focus on those changes (git status and git diff for unstaged/untracked files)
   - **Priority 3:** If working tree is clean, examine git diff of recent commits (last 1-3 commits)
   - Identify modified files and specific code changes
   - Understand the scope and nature of modifications

2. **Load Focus Document/Instruction:**
   - If path provided, read the specified document
   - If text instruction provided, use as review criteria
   - Extract relevant guidelines, standards, and requirements

3. **Contextual Review:**
   - Compare recent changes against the focus criteria
   - Identify alignment with documented standards
   - Flag potential violations or inconsistencies
   - Assess whether changes follow prescribed patterns

4. **Provide Focused Feedback:**
   - Highlight areas where changes align well with guidelines
   - Point out specific violations or deviations
   - Suggest corrections to better align with standards
   - Recommend improvements based on the focus document

**Focus Areas:**

**Security Guidelines:**
- Authentication and authorization implementations
- Input validation and sanitization practices
- Secure data handling and storage
- API security and rate limiting
- Credential and secret management

**Coding Standards:**
- Naming conventions and code style
- Function and class structure requirements
- Documentation and commenting standards
- Error handling patterns
- Testing requirements and coverage

**Architecture Guidelines:**
- Component organization and separation of concerns
- Dependency injection and inversion patterns
- Data flow and state management approaches
- API design and interface contracts
- Performance and scalability considerations

**Documentation Standards:**
- README and setup instruction completeness
- API documentation and examples
- Code comment quality and coverage
- Change log and version documentation
- User guide and tutorial accuracy

**Implementation:**
1. **First, determine review scope:**
   - Run `git status` to check for staged, uncommitted, and untracked changes
   - **Priority 1:** If staged files exist: use `git diff --cached` to analyze staged changes
   - **Priority 2:** If uncommitted/untracked files exist: use `git diff` and check untracked files from git status
   - **Priority 3:** If working tree is clean: use `git diff HEAD~3..HEAD` to review recent commits

2. **Then, load focus criteria:**
   - If argument is a file path: read the specified document and extract guidelines
   - If argument is text instruction: use the provided instruction as focus criteria
   - If no argument provided: look for common documentation files or ask user to specify

3. **Finally, perform focused review:**
   - Prioritize staged files (ready for commit) as highest priority
   - Then review uncommitted/untracked changes as current work in progress
   - Apply focus criteria to the identified changes
   - Provide targeted feedback based on the specific guidelines

**Output Format:**
- ✅ **Aligned:** Changes that follow the guidelines well
- ⚠️ **Attention:** Areas needing minor adjustments
- ❌ **Violation:** Clear deviations requiring correction
- 💡 **Suggestion:** Improvements to better align with standards

Use arguments as the focus document path or instruction: $ARGUMENTS