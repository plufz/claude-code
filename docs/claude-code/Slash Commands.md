# Claude Code Custom Slash Commands

## Overview

Custom slash commands in Claude Code allow you to define frequently-used prompts as Markdown files that can be invoked with a simple `/command-name` syntax.

## Command Types

### 1. Project Commands (Team Shared)
- **Location**: `.claude/commands/`
- **Scope**: Available to all team members working on the project
- **Use case**: Project-specific workflows, team conventions

### 2. Personal Commands (User-wide)
- **Location**: `~/.claude/commands/`
- **Scope**: Available across all your projects
- **Use case**: Personal workflows, frequently used patterns

## Creating Commands

### Basic Structure
1. Create a `.md` file in the appropriate commands directory
2. The filename (without `.md`) becomes the command name
3. The file content becomes the prompt that gets executed

### Example Command Creation
```bash
# Create project command
mkdir -p .claude/commands
echo "Analyze this code for performance issues:" > .claude/commands/optimize.md

# Create personal command
mkdir -p ~/.claude/commands
echo "Review this code for security vulnerabilities:" > ~/.claude/commands/security-review.md
```

### Advanced Features

#### Arguments
- `$ARGUMENTS` - Captures all arguments passed to the command
- `$1`, `$2`, etc. - Specific positional arguments

#### Frontmatter (Optional)
```markdown
---
description: "Brief description of what this command does"
allowed_tools: ["Bash", "Edit", "Read"]
---

Your command prompt here...
```

#### Example with Arguments
```markdown
---
description: "Commit changes with custom message"
---

Create a git commit using the provided message: $1

If no message provided, analyze the changes and create an appropriate commit message.
```

## Command Execution

### Usage
- Type `/command-name` in Claude Code
- Add arguments: `/command-name arg1 arg2`
- Commands are executed as if you typed the content as a regular prompt

### Execution Context
- Commands run in the current working directory
- Have access to all files and tools available to Claude Code
- Can execute bash commands, read files, and make edits

## Best Practices

### Command Design
1. **Be specific**: Clear, actionable prompts work best
2. **Use arguments**: Make commands flexible with `$ARGUMENTS` and `$1`, `$2`
3. **Add descriptions**: Use frontmatter for team clarity
4. **Keep focused**: One command should do one thing well

### Organization
- Use descriptive filenames (e.g., `commit.md`, `test-all.md`, `review-pr.md`)
- Group related commands with consistent naming (e.g., `git-commit.md`, `git-push.md`)
- Document complex commands with examples in the file

### Example Commands for Development

#### `/commit` - Smart Git Commits
```markdown
---
description: "Commit staged and unstaged changes with automatic git add && git commit"
---

Create git commits by automatically staging files and committing them. If changes span multiple logical areas, split into separate commits. Otherwise, create a single commit. Use only "Generated with Claude" as attribution.

Please run git status and git diff to understand the current changes, then:

1. Analyze the changes to determine if they should be split into multiple logical commits
2. Stage and commit the changes using `git add <files> && git commit -m "commit message"`
3. Use descriptive commit messages that explain what was changed and why

If provided arguments, use them as the commit message: $ARGUMENTS
```

#### `/test` - Run Tests
```markdown
---
description: "Run the appropriate test suite for this project"
---

Run the project's test suite. Check for existing test commands in package.json, pyproject.toml, or other configuration files, then execute the appropriate test command.
```

#### `/review` - Code Review
```markdown
---
description: "Perform a comprehensive code review of recent changes"
---

Perform a code review of the current changes:
1. Run git diff to see what has changed
2. Analyze code quality, performance, security, and best practices
3. Check for potential bugs or edge cases
4. Suggest improvements or optimizations
5. Verify tests are adequate

Focus on: $ARGUMENTS
```

## Troubleshooting

### Command Not Found
- Check the filename has no typos
- Ensure the `.claude/commands/` directory exists
- Verify the file has `.md` extension
- Restart Claude Code session if needed

### Command Not Working
- Check the markdown syntax
- Ensure frontmatter is properly formatted with `---`
- Verify arguments are properly referenced (`$ARGUMENTS`, `$1`, etc.)
- Test the command content as a regular prompt first

## Integration with Project Workflow

Custom slash commands integrate seamlessly with:
- Git operations (`/commit`, `/push`, `/review`)
- Testing workflows (`/test`, `/coverage`)
- Code quality (`/lint`, `/format`, `/security`)
- Documentation (`/docs`, `/readme`)
- Deployment (`/build`, `/deploy`)

This makes them perfect for standardizing team workflows and reducing repetitive prompt typing.