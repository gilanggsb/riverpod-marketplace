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
For **Testability**. If a Repository instantiates its own Data Source internally, you cannot easily test the Repository in isolation. ## 4. Feature-First Architecture and Entity Decoupling

### Q: Is it valid for an Entity in the Cart feature (`CartItemEntity`) to directly import and use `ProductEntity` from the Home feature?
**A:**
In a strict **Feature-First Architecture**, this is structurally flawed. 
If `CartItemEntity` directly imports `ProductEntity` from the `home` feature, you create tight coupling. If the `home` feature is restructured, renamed, or deleted, the `cart` feature breaks. A feature should be an independent, reusable module.

### Q: How do we solve this coupling? Should we only store the `productId` and `quantity` in the Cart?
**A:**
No, you shouldn't *only* store the `productId`. If you do, the Cart UI cannot autonomously render the product's name or price without making heavy, continuous API calls back to the product catalog just to display the cart list.

**The Solution: Snapshotting (Data Duplication across Domains)**
Instead of importing the `ProductEntity`, the Cart feature defines its own entity that captures the necessary primitive data (a "snapshot" at the time of adding to the cart).

```dart
// Inside the Cart Feature
@freezed
abstract class CartItemEntity with _$CartItemEntity {
  const factory CartItemEntity({
    required int productId,
    required String productName,
    required double price, // Snapshot of the price when added
    required int quantity,
  }) = _CartItemEntity;
}
```
When the UI triggers `addToCart`, it maps the `ProductEntity` fields into primitive arguments:
`addToCart(productId: product.id, productName: product.name, price: product.price)`.
This allows the Cart to render instantly without depending on the Home module's codebase.

### Q: If the Cart uses a "Snapshot" price, what happens if the Admin changes the product price on the server before the user checks out?
**A:**
The Local Cart is designed to be instantly responsive and holds the price *as the user saw it*.
The reconciliation happens during **Checkout**. 
When the user taps "Checkout", the mobile app sends the Cart data (or just the IDs and quantities) to the Backend API. The server *never* trusts the client's price. The server checks the current database price.
If there's a mismatch (Admin updated the price), the server returns an error (e.g., `409 Conflict`). The mobile app catches this error, updates the local `CartItemEntity` snapshot with the new server price, and shows a warning to the user: *"The price has changed, do you still want to proceed?"*
