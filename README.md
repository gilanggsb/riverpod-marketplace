# Riverpod Marketplace Mini

A Flutter learning project implementing Clean Architecture and Riverpod.

## Tickets

### ✅ Ticket 1: Product List (Foundation)
- Display dummy products from a simulated network request.
- Handles `loading`, `data`, and `error` states using Riverpod's `AsyncValue`.
- Implementation follows Clean Architecture structure: **Repository → UseCase → Controller → Page**.
- UI separates logic with dumb widgets (e.g., `ProductCard`).

### ✅ Ticket 2: Infinite Pagination
- Added `ProductRequestParams` in Domain layer to handle API parameters independently.
- Managed complex `ProductPaginationState` to keep track of `offset`, `hasMore`, and partial `isLoadingMore` state without losing existing data.
- Built scroll listener inside UI to fetch more data reactively.

### ✅ Ticket 3: Shopping Cart (Feature-First)
- Designed `cart` as a completely decoupled feature from `home`.
- Enforced Domain Decoupling by using "Snapshotting" (`CartItemEntity` stores primitive product details instead of importing `ProductEntity`).
- Used `StateProvider` and `keepAlive: true` for the Cart Controller to persist data globally.
- Created derived provider (`cartTotal`) for reactive, UI-agnostic price calculation.

---
