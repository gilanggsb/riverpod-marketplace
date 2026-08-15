---
type: agent-rule
scope: shared
status: draft
load: always
---

# Core Rules

These rules define the minimum workflow for coding agents across repositories.

## Instruction Order

Follow instructions in this order:

1. Platform and safety requirements.
2. Shared core rules.
3. Shared stack-specific rules.
4. Repository-local rules.
5. Task-specific user instructions.

More specific repository or task instructions may extend shared recommendations, but they cannot weaken higher-priority safety requirements.

## Operating Rules

- Understand the requested outcome before changing files.
- Inspect relevant repository instructions and existing implementation first.
- Keep work scoped to the request and preserve unrelated user changes.
- Make reasonable, reversible assumptions; disclose assumptions that materially affect the result.
- Request approval before destructive actions, external publication, or scope expansion.
- Verify changes in proportion to their risk.
- Never claim that a check passed if it was not run.
- Report the outcome, changed files, verification, and remaining risks.
- After meaningful work, perform the knowledge-impact check in [[Knowledge Lifecycle]].

## Context Discipline

- Load only rules and knowledge relevant to the task.
- Prefer indexes and targeted retrieval over loading complete folders.
- Do not duplicate shared rules in repository adapters.
- Treat generated `knowledge/_shared/` content as read-only source material.

## Data Safety

- Do not expose or promote secrets, credentials, customer data, personal notes, or sensitive internal identifiers.
- Redact sensitive values from logs, examples, and documentation.
- Stop and request direction when ownership or safe handling is unclear.
