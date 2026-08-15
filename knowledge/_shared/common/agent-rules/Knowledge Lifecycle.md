---
type: agent-rule
scope: shared
status: draft
load: after-meaningful-work
---

# Knowledge Lifecycle

After meaningful work, evaluate whether the task changed or revealed knowledge worth preserving.

Meaningful knowledge includes changed behavior, architecture decisions, non-obvious constraints, reusable patterns, operational procedures, and recurring troubleshooting.

## Classification

### Repository-specific

Examples:

- Business rules and project workflows.
- API behavior and integration constraints.
- Project ADRs, operations, and troubleshooting.

Action: update repository-owned `knowledge/`.

### Reusable candidate

A discovery is a candidate when it:

- Applies to more than one repository.
- Does not depend on project-specific business logic.
- Is supported by implementation, testing, or debugging evidence.
- Is safe to share after sanitization.

Action: create a proposal in repository-owned `knowledge/candidates/`. Do not publish it directly to shared knowledge.

Use [[../templates/Knowledge Candidate Template]] for the proposal.

### Incidental

Examples:

- Obvious implementation details.
- One-off exploration with no durable result.
- Information already documented.

Action: do not create new documentation.

## Candidate Requirements

A reusable candidate should include:

- Context and evidence.
- Repository implementation.
- Generalized pattern.
- Constraints and counterexamples.
- Suggested shared target.
- Confirmation that secrets, customer data, business identifiers, and personal notes were removed.

## Promotion

Promotion is an explicit review process:

1. Detect and document the candidate in the repository.
2. Review ownership, evidence, and reuse potential.
3. Generalize and sanitize the content.
4. Approve or reject the proposal.
5. Publish accepted knowledge to the appropriate shared layer.
6. Distribute it through one-way sync.

Agents may detect and propose candidates. They must not automatically copy repository content into shared knowledge.

Reviewers must follow [[Knowledge Promotion]].

## Completion Report

At handoff, report one of:

- Repository knowledge updated.
- Reusable candidate proposed.
- No documentation change needed.
