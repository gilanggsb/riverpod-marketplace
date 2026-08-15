---
type: agent-rule
scope: shared
status: draft
---

# Documentation

Update documentation when work changes behavior, architecture, operational procedures, or other meaningful knowledge.

## Rules

- Keep repository-specific facts in repository-owned `knowledge/`.
- Follow [[Knowledge Lifecycle]] before proposing reusable guidance.
- Keep reusable guidance in shared knowledge only after review and sanitization.
- Do not document trivial or already-documented implementation details.
- Update related plans and knowledge after completing an approved phase.
- Never edit generated `knowledge/_shared/` content directly.
- Do not copy secrets, customer data, credentials, or personal notes into shared documentation.
- Preserve evidence and important constraints without copying unnecessary project context.
