# Shared Rule Maintenance

Current ruleset version: **1.0.0**

This document defines how global agent rules are reviewed, versioned, published, and retired.

## Change Workflow

1. Confirm the rule is reusable across repositories.
2. Prefer a reviewed knowledge candidate with concrete evidence.
3. Check for conflicts with repository and platform rules.
4. Keep the rule focused and use progressive disclosure.
5. Update this ruleset version.
6. Run `./validate.py` and all integration tests.
7. Review `./sync.sh --dry-run`.
8. Sync and review repositories one at a time.

Repository discoveries never publish themselves automatically. Human review remains the promotion gate.

## Versioning

Use semantic versioning for the shared rule set:

- **Patch**: wording, links, or clarification with no behavioral change.
- **Minor**: new guidance or a backward-compatible workflow addition.
- **Major**: changed defaults, removed behavior, or a rule that requires repository adaptation.

Git history is the detailed change log. The version here is the compact compatibility signal copied to every active repository.

## Review Cadence

- Review proposed candidates and invalid entries at least monthly.
- Review obsolete, duplicated, or conflicting shared rules quarterly.
- Review active repository mappings whenever paths or ownership change.
- Archive or disable mappings that no longer have a confirmed repository owner.
- Re-run validation after every config, source-layer, or link change.

## Token Budget

- Root adapters should normally stay below 150 words.
- Load `Core Rules` first, then only task-relevant rule files.
- Keep the normal shared-rule context below roughly 1,500 words per task.
- Do not load templates, stack conventions, or the full vault unless the task needs them.
- Split or retire rules when repeated context becomes larger than its operational value.

## Compatibility

Repository rules may be stricter and more specific. They may not weaken platform safety requirements. A major shared-rule change must identify repositories that require adapter or workflow updates before rollout.

## Retirement

Before removing a rule:

1. search active repositories for dependencies and links;
2. provide a replacement or migration note when behavior changes;
3. bump the ruleset version appropriately;
4. validate and review managed deletions in dry-run output.
