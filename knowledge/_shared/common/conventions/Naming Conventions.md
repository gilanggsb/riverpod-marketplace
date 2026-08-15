# Naming Conventions

status: active
tags: conventions, naming

## General

- Use **English** for all code and documentation
- Use **meaningful names** that describe purpose
- Avoid abbreviations unless universally known (API, URL, ID)

## Variables & Functions

### Variables

```
 camelCase: local variables, function parameters
 PascalCase: class names, enum values
 SCREAMING_SNAKE_CASE: constants
```

```dart
// Variables
final userName = 'john';
final maxRetryCount = 3;
const API_BASE_URL = 'https://api.example.com';

// Parameters
void fetchUser(String userId) { }

// Class names
class UserService { }
enum UserRole { admin, user, guest }
```

## Files

```
 kebab-case: dart files
 snake_case: resource files
 PascalCase: class files
```

```dart
// Dart files
user_service.dart
user_repository.dart
constants.dart

// Resource files
ic_arrow_right.png
img_logo.png
```

## Directories

```
 kebab-case: folder names
```

```
lib/
├── user-management/
├── auth/
├── common/
└── features/
```

## Database/API

```
snake_case: database columns, API fields
PascalCase: JSON root objects
```

```json
{
  "user_id": 123,
  "user_name": "John",
  "created_at": "2025-01-01"
}
```

## Routes

```
 kebab-case: URL paths
 camelCase: route names
```

```dart
// Route name
static String get picking => '/picking';
static String get pickingDetail => '/picking/detail';

// URL
'/api/v1/users'
'/api/v1/stock-moves'
```

## Related

- [[Git Conventions]]
