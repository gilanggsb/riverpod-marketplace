---
type: agent-rule
scope: shared
status: draft
load: when-reviewing-candidates
---

# Knowledge Promotion

Repository discoveries enter shared knowledge only through explicit review. Collection is read-only and promotion is never automatic.

## Candidate Location

Store candidates in repository-owned:

```text
knowledge/candidates/
```

Use [[../templates/Knowledge Candidate Template]] and keep the source repository in metadata.

## Statuses

| Status | Meaning |
|---|---|
| `proposed` | Awaiting review |
| `accepted` | Reviewed, generalized, and published to shared knowledge |
| `rejected` | Not reusable, insufficiently supported, or unsafe to share |
| `superseded` | Replaced by another candidate or existing shared rule |

Only `proposed` candidates appear in the default collection view.

## Review Checklist

1. Confirm the repository owns the source knowledge.
2. Confirm the pattern is useful beyond one repository.
3. Check implementation, test, debugging, or operational evidence.
4. Remove business logic and repository-specific identifiers.
5. Remove secrets, credentials, customer data, and personal notes.
6. Document constraints and counterexamples.
7. Check whether shared knowledge already covers the pattern.
8. Select the narrowest correct shared target.
9. Reject or request revision if evidence or sanitization is incomplete.

## Publication

For an accepted candidate:

1. Write the generalized content in the selected shared layer.
2. Update relevant indexes and links.
3. Validate the shared document independently.
4. Record the shared destination in the candidate.
5. Change candidate status to `accepted`.
6. Distribute through the normal one-way sync.

Do not copy the candidate verbatim when it contains repository context that is unnecessary globally.

## Archive Policy

- Keep `proposed` candidates in the active candidate area.
- Move terminal candidates to `knowledge/candidates/archive/<year>/` when the repository team is ready.
- Preserve the decision, reason, source repository, and promoted destination.
- Use `superseded` instead of deleting useful review history.
- Repository teams own archive changes; the collector never moves files.
