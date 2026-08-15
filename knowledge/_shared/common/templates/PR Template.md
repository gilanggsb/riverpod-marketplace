# Pull Request Template

status: template
tags: pull-request, review, template

## Summary

[Explain the outcome of this change in one or two paragraphs.]

## Context

[Link the issue, plan, incident, ADR, or requirement that motivated the change.]

## Changes

- [Change 1]
- [Change 2]

## Verification

| Check | Result |
|---|---|
| `[command or manual check]` | Pass/Fail/Not run |

List checks that were not run and explain why.

## Risk and Rollback

- Risk level: low/medium/high
- Known limitations:
- Rollback approach:

## Documentation and Knowledge

- Repository documentation updated: yes/no/not needed
- Reusable candidate proposed: yes/no/not needed
- Related documentation: `knowledge/<path>.md`

## Checklist

- [ ] Scope is limited to the requested change
- [ ] Unrelated user changes are preserved
- [ ] Relevant verification passes
- [ ] Failure paths and boundaries were considered
- [ ] Secrets and sensitive data are excluded
- [ ] Documentation impact was evaluated
- [ ] Generated `_shared` content was not edited manually

