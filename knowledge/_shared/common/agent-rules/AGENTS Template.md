---
type: template
scope: repository
status: draft
---

# AGENTS.md Template

Keep the repository adapter short. Copy the following structure to the repository root and customize only the local section.

```md
# Agent Instructions

## Required Reading

1. `knowledge/_shared/common/agent-rules/Core Rules.md`
2. Relevant shared stack rules for the current task
3. `knowledge/Agent Workflow.md`
4. Documentation directly related to the task

## Repository Rules

- Add only repository-specific constraints here.
- Keep project knowledge in `knowledge/`.
- Never edit `knowledge/_shared/` directly.
- Follow existing build, test, and formatting commands.

## Knowledge Lifecycle

After meaningful work, follow:
`knowledge/_shared/common/agent-rules/Knowledge Lifecycle.md`

## Local Overrides

Repository-local rules may extend shared recommendations when more specific.
They may not weaken platform safety requirements.
```

Create other agent-specific adapters only when the repository actually uses them. They should point to the same shared and local sources instead of copying the rules.

