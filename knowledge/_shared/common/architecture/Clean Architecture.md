# Clean Architecture

status: active
tags: architecture, clean-architecture

## Overview

Clean Architecture separates concerns into independent layers.

## Layers

```
┌─────────────────────────────────────┐
│         Presentation Layer          │
│    (UI, Controllers, ViewModels)    │
├─────────────────────────────────────┤
│          Domain Layer               │
│    (Entities, Use Cases, Repos)     │
├─────────────────────────────────────┤
│           Data Layer                │
│  (Repositories Impl, Data Sources)  │
└─────────────────────────────────────┘
```

## Principles

1. **Independence**: Inner layers do not depend on outer layers.
2. **Testability**: Inner layers can be tested without external dependencies.
3. **Dependency Rule**: Dependencies point inward.

## Implementation

### Domain Layer
- Entities / Models (business objects)
- Repository interfaces (abstractions)
- Use cases (business logic)

### Data Layer
- Repository implementations
- Data sources (API, local DB)
- DTOs (Data Transfer Objects)

### Presentation Layer
- UI (widgets, pages)
- Controllers / ViewModels
- Presenters

## Related

- [[Patterns]]
