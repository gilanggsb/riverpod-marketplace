# Feature Template

status: template
tags: template, feature

## Metadata

```
title: [Feature Name]
status: proposed
created: YYYY-MM-DD
updated: YYYY-MM-DD
tags: feature, [domain]
```

## Overview

[Briefly describe the feature, why it exists, and its primary use case.]

## User Flow

```
[Sequential user steps; Mermaid may be used.]

1. User ...
2. App ...
3. User ...
```

## Source Files

| Path | Purpose |
|---|---|
| `[lib/features/[feature]/]` | Root folder |
| `[lib/features/[feature]/bindings/]` | DI bindings |
| `[lib/features/[feature]/controllers/]` | Controllers |
| `[lib/features/[feature]/repositories/]` | Data access |
| `[lib/features/[feature]/models/]` | Data models |
| `[lib/features/[feature]/views/pages/]` | Pages |
| `[lib/features/[feature]/views/widgets/]` | Reusable widgets |

## Controllers

| Controller | Responsibility |
|---|---|
| `[Feature]Controller` | Main state and logic |

## Routes

| Route | Page | Description |
|---|---|---|
| `/[route]` | `[Feature]Page` | Description |

## API Endpoints

| Endpoint | Method | Purpose |
|---|---|---|
| `/api/...` | GET/POST/PUT/DELETE | Description |

## State

```dart
enum [Feature]Status { initial, loading, success, failure }

class [Feature]State {
  final [Feature]Status status;
  final List<Item>? items;
  final String? error;
}
```

## Constraints

- [Constraint 1]
- [Constraint 2]

## Dependencies

- [Dependency 1]
- [Dependency 2]

## Related

- Architecture: `knowledge/architecture/Overview.md`
- Related flow: `knowledge/flows/<flow-name>.md`
