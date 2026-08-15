---
type: index
scope: shared
status: draft
---

# Shared Agent Rules

This area is the source of truth for reusable workflow rules followed by coding agents across repositories.

## Always Load

- [[Core Rules]]

## Load When Relevant

- [[Planning and Execution]]
- [[Documentation]]
- [[Testing]]
- [[Git Workflow]]
- [[Knowledge Lifecycle]]
- [[Knowledge Promotion]]
- [[Shared Rule Maintenance]]

Detailed rules are loaded only when relevant. Repository adapters should remain small and must not duplicate this content.

## Repository Integration

- Use [[AGENTS Template]] as the default adapter.
- Keep repository facts and constraints in repository-owned knowledge.
- Let repository-local rules extend shared recommendations when more specific.
- Do not create optional agent adapters until a repository actually uses them.

## Token Policy

- Keep the adapter and Core Rules small.
- Load stack, testing, Git, and documentation rules only when triggered.
- Follow links to task knowledge selectively; never load the complete vault by default.
