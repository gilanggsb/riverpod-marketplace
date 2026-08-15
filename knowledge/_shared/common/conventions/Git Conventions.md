# Git Conventions

status: active
tags: conventions, git

## Commit Message Format

```
type(scope): short description

[optional body]
[optional footer]
```

## Type

| Type | Description |
|---|---|
| `feat` | New feature |
| `fix` | Bug fix |
| `docs` | Documentation changes |
| `style` | Code style changes (formatting, semicolons) |
| `refactor` | Code refactoring |
| `test` | Adding tests |
| `chore` | Maintenance tasks |

## Scope

| Scope | Description |
|---|---|
| `auth` | Authentication module |
| `picking` | Picking feature |
| `transfer` | Transfer feature |
| `api` | API layer |
| `ui` | UI components |
| `config` | Configuration |

## Examples

```
feat(auth): add login with biometrics
fix(picking): handle empty stock move lines
docs(api): update endpoint documentation
refactor(transfer): extract validation logic
```

## Rules

1. Use imperative mood: "add" not "added"
2. First line max 72 characters
3. Separate subject from body with blank line
4. Reference issues: `Fixes #123`

## Branch Naming

```
type/description
feature/add-packing-feature
bugfix/fix-scanner-crash
hotfix/critical-auth-bypass
```

## Related

- [[Naming Conventions]]
