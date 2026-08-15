# Architectural Decision Records (ADR)

This document tracks the significant architectural decisions made during the development of this project.

## List of Decisions

### 1. State Management: Riverpod
*   **Context:** Need a robust state management solution that supports dependency injection, asynchronous data handling, and compile-time safety.
*   **Decision:** Adopted `flutter_riverpod` combined with `riverpod_generator`.
*   **Consequences:** Enables granular UI rebuilds, easy testing via provider overriding, and safer asynchronous state handling (`AsyncValue`).

### 2. Architecture: Feature-first Clean Architecture
*   **Context:** To ensure the codebase remains maintainable and scalable as features grow.
*   **Decision:** Organized the folder structure by feature (`lib/features/home/`), and inside each feature, divided into `presentation`, `domain`, and `data` layers.
*   **Consequences:** High cohesion within features, loose coupling between UI and Data sources. Requires boilerplate for mapping Models to Entities.

### 3. Data Parsing: Freezed & Json Serializable
*   **Context:** Parsing JSON manually is error-prone and tedious.
*   **Decision:** Used `freezed` and `json_serializable` for Data Models.
*   **Consequences:** Provides immutable classes, `copyWith` methods, and safe JSON serialization. Requires running `build_runner`.

### 4. Pagination State Handling
*   **Context:** Infinite scrolling requires tracking the current list, offset, and loading states simultaneously.
*   **Decision:** Instead of keeping variables inside the Notifier class, a dedicated `PaginationState` class is created to act as the single source of truth for the UI to watch.