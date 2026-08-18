# Riverpod Q&A: Deep Dive & Best Practices

This document captures important Q&A sessions regarding Riverpod state management, specifically focusing on `ref.read` vs `ref.watch`, and the usage of independent `StateProvider`s.

## 1. Why `ref.watch` in `build()` and `ref.read` in events?

### Q: Can you give a real-case example of why `watch` must be used in `build()` and `read` in events (like `loadMore`)? What happens if they are swapped?

**A:**
Let's look at a real case involving a category filter:

```dart
final selectedCategoryProvider = StateProvider<String?>((ref) => null); 
```

**Case 1: Inside `build()`**
If your `ProductController` needs this category to fetch data:

*   **WRONG (`ref.read`):**
    ```dart
    @override
    Future<ProductPaginationState> build() async {
      final categoryId = ref.read(selectedCategoryProvider); // ONLY READS ONCE
      final params = ProductRequestParams(categoryId: categoryId);
      return await ref.read(getProductsUseCaseProvider)(params);
    }
    ```
    *Result:* If the user clicks "Electronics", `selectedCategoryProvider` changes, but `ProductController` does nothing. The data will not refresh because it is not listening to the changes.

*   **CORRECT (`ref.watch`):**
    ```dart
    @override
    Future<ProductPaginationState> build() async {
      final categoryId = ref.watch(selectedCategoryProvider); // LISTENS TO CHANGES
      final params = ProductRequestParams(categoryId: categoryId);
      // Also watch the UseCase in case its dependencies change
      return await ref.watch(getProductsUseCaseProvider)(params); 
    }
    ```
    *Result:* When the user clicks "Electronics", Riverpod destroys the old state and automatically re-runs the `build()` method. The app instantly fetches the filtered data.

**Case 2: Inside an Event (e.g., `loadMore()`)**

*   **WRONG (`ref.watch`):**
    ```dart
    Future<void> loadMore() async {
      // ERROR: Cannot watch inside an event handler
      final useCase = ref.watch(getProductsUseCaseProvider); 
      // ...
    }
    ```
    *Result:* Riverpod will throw an exception or a lint warning. `ref.watch` registers a listener to re-run the surrounding block of code. It makes no sense to re-run a button click event automatically. Event handlers should only take a one-time "snapshot" of the state.

*   **CORRECT (`ref.read`):**
    ```dart
    Future<void> loadMore() async {
      final useCase = ref.read(getProductsUseCaseProvider); // SAFE
      // ...
    }
    ```

## 2. Independent States (`StateProvider`)

### Q: What is `StateProvider` and why use it? Is it separate from the main Controller?

**A:**
`StateProvider` is a simple provider used to store a single, simple value (like a `String`, `int`, `bool`, or `enum`).

Example: `final searchQueryProvider = StateProvider<String>((ref) => '');`

**Why separate it from `ProductController`?**
To achieve **Separation of Concerns** and prevent unnecessary rebuilds.

*   **Bad Scenario (Combined State):** If `searchQuery` is inside `ProductPaginationState`, any widget that just wants to display the current search text in an AppBar must watch the entire `ProductController`. When `ProductController` loads more data (`isLoadingMore: true`), the AppBar rebuilds unnecessarily.
*   **Good Scenario (Separated State):** The AppBar watches *only* `searchQueryProvider`. The `ProductController` also watches `searchQueryProvider`. When the search text changes, the AppBar rebuilds cheaply, and `ProductController` triggers a fresh data fetch.

## 3. Dependency Injection and Testing

### Q: Why use `final` and Constructor Injection in Repositories instead of initializing them directly (e.g., `late` or `final _service = ProductRemoteService();`)?

**A:**
For **Testability**. If a Repository instantiates its own Data Source internally, you cannot easily test the Repository in isolation. By passing the Data Source through the constructor (Constructor Injection), you can easily pass a `MockRemoteService` (using tools like Mockito or Mocktail) during unit testing without making real API calls.
