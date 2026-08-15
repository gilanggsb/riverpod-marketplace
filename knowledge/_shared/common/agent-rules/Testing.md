---
type: agent-rule
scope: shared
status: draft
load: when-changing-behavior
---

# Testing

Verification must be proportional to the change and its risk.

## Rules

- Identify the smallest check that can catch the likely failure.
- Prefer focused checks first, then broader checks when risk justifies them.
- Use the repository's established commands and test structure.
- Test changed behavior, important failure paths, and affected boundaries.
- For bug fixes, reproduce the failure when practical and verify the fix.
- For documentation, validate links, examples, and described commands.
- For scripts, validate syntax, dry-run behavior, exit codes, and filesystem boundaries.
- Do not modify production data or external systems during verification without authorization.
- Do not hide failing checks or unrelated failures.
- Distinguish failures caused by the change from pre-existing or environmental failures.

## Handoff

Report:

- Checks run and their results.
- Checks not run and why.
- Known limitations or residual risk.

