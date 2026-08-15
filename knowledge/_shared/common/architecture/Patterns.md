# Patterns

status: active
tags: architecture, patterns

## Common Patterns

### Repository Pattern

```
┌──────────────┐     ┌──────────────┐     ┌──────────────┐
│   Controller │────>│ Repository   │────>│  Data Source │
│              │<────│              │<────│   (API/DB)   │
└──────────────┘     └──────────────┘     └──────────────┘
```

```dart
class UserRepository {
  final DataSource _dataSource;

  Future<User> getUser(int id) async {
    return await _dataSource.fetchUser(id);
  }
}
```

### Dependency Injection

Inject dependencies via constructor or container.

```dart
class UserController {
  final UserRepository _repository;

  UserController({UserRepository? repository})
      : _repository = repository ?? Get.find<UserRepository>();
}
```

### Observer Pattern

Use reactive programming for state updates.

```dart
// GetX
final isLoading = false.obs;

// Cubit
emit(LoadingState());

// Stream
StreamController<Data> _controller;
```

## Anti-Patterns

- God Objects (class doing too much)
- Anemic Domain Model (no business logic)
- Circular Dependencies
- Premature Optimization

## Related

- [[Clean Architecture]]
