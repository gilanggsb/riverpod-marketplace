# Clean Architecture & Riverpod in Flutter

This document outlines the conventions and best practices based on the implementation of the "Marketplace Mini".

## 1. Layer Separation (Dependency Rule)
Primary Rule: **Dependency direction must always point inward (Presentation -> Domain <- Data).**
*   **Domain Layer (Entity & UseCase):** The center of business logic. Must NEVER import UI packages (`flutter`), Riverpod API (`flutter_riverpod`), or external data structures (Model/DTO/API/DB).
*   **Data Layer (Repository Impl & Data Source):** Responsible for translating Models (DTOs) into Entities. Allowed to import third-party libraries like Dio, http, or freezed.
*   **Presentation Layer (Controller/Notifier & UI):** Manages state and views. Communicates with UseCases, must NEVER communicate directly with the Repository.

## 2. DTO (Model) vs Entity
Always separate the data structures sent/received by the API from the pure application structures (Entities).

### Request Parameters
*   **`...RequestParams` (Domain):** Pure Dart class without JSON annotations. Carries data from Controller -> UseCase -> Repository.
*   **`...RequestModel` (Data):** DTO generated with `freezed`. Translates Params into a format understood by the API (using `@JsonKey` and `.toJson()`).

**Example (Request):**
```dart
// 1. DOMAIN LAYER (product_request_params.dart)
class ProductRequestParams {
  final int limit;
  final int offset;
  ProductRequestParams({this.limit = 10, this.offset = 0});
}

// 2. DATA LAYER (product_request_model.dart)
@freezed
class ProductRequestModel with _$ProductRequestModel {
  const factory ProductRequestModel({
    required int limit,
    @JsonKey(name: 'page_offset') required int offset, // Mapping for API
  }) = _ProductRequestModel;
  
  factory ProductRequestModel.fromJson(Map<String, dynamic> json) => _$ProductRequestModelFromJson(json);
}

// 3. REPOSITORY LAYER (product_repository_impl.dart)
// Translating Params to Model
Future<List<ProductEntity>> getProducts(ProductRequestParams params) async {
  final model = ProductRequestModel(limit: params.limit, offset: params.offset);
  return await remoteService.getProducts(model);
}
```

### Response Data
*   **`...ResponseModel` / `...Model` (Data):** Captures raw responses from the API (`.fromJson()`). Must use `@JsonKey` if the backend naming format is inconsistent with Dart's camelCase (e.g., *snake_case*).
*   **`...Entity` (Domain):** Core application object. Mapped by the Repository Impl from the Model.

**Example (Response):**
```dart
// 1. DATA LAYER (product_model.dart)
@freezed
class ProductModel with _$ProductModel {
  const factory ProductModel({
    @JsonKey(name: 'product_id') required int id,
    @JsonKey(name: 'product_title') required String title,
  }) = _ProductModel;
  
  factory ProductModel.fromJson(Map<String, dynamic> json) => _$ProductModelFromJson(json);
}

// 2. DOMAIN LAYER (product_entity.dart)
class ProductEntity {
  final int id;
  final String title;
  ProductEntity({required this.id, required this.title});
}

// 3. REPOSITORY LAYER (product_repository_impl.dart)
// Translating Model to Entity
ProductEntity toEntity(ProductModel model) {
  return ProductEntity(id: model.id, title: model.title);
}
```

## 3. Riverpod Best Practices
1. **Use `ref.watch` inside `build()`:** Never use `ref.read` inside the `build()` method (neither in widgets nor notifiers) to ensure the state always updates if its dependency changes.
   ```dart
   @riverpod
   class ProductController extends _$ProductController {
     @override
     Future<List<ProductEntity>> build() async {
       // CORRECT: Use watch to always re-fetch if dependency changes
       final useCase = ref.watch(getProductsUseCaseProvider);
       return await useCase.execute();
     }
   }
   ```
2. **Separate Independent States:** Independent data (like search queries or category filters) should be created as separate providers (`StateProvider`), not forced into one massive State class. The main Controller can `ref.watch` these independent providers.
   ```dart
   final searchQueryProvider = StateProvider<String>((ref) => '');
   ```
3. **Pagination State:** Use a dedicated State class (e.g., `ProductPaginationState`) to track the data list, `offset`, `hasMore`, and `isLoadingMore`.

---

## 4. Dos and Don'ts

### Architecture & Layering
*   ✅ **DO** ensure the Domain layer depends on nothing. It is the heart of the app.
*   ✅ **DO** pass dependencies through constructors for easier testing.
*   ❌ **DON'T** let UI widgets talk directly to the Repository or Data Source.
*   ❌ **DON'T** place JSON parsing logic (`fromJson`, `@JsonKey`) inside Entities.

### Riverpod Usage
*   ✅ **DO** use `ref.read` only in callbacks or lifecycle events (e.g., `onPressed`, `initState`).
*   ✅ **DO** use `ref.listen` for executing side-effects (e.g., showing SnackBars, navigating) based on state changes.
*   ❌ **DON'T** use `ref.read` inside the `build()` method to fetch dependencies that might change over time.
*   ❌ **DON'T** cache or store a `ref` or `Notifier` instance in a variable to use it after an `await`. Always look it up fresh if needed.

### State Management
*   ✅ **DO** group tightly related variables (like `list`, `isLoadingMore`, `hasMore`) into a single State class.
*   ❌ **DON'T** create "God States" that hold completely unrelated data (e.g., `searchQuery` and `userProfile` in the same class).
