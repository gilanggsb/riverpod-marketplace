# Architecture Overview

This project follows a **Feature-first Clean Architecture** approach, combined with **Riverpod** for state management and dependency injection.

## Core Philosophy

The primary goal is the Separation of Concerns. The UI should not know about network requests, and the core business logic (Domain) should not know about JSON parsing or UI states.

## Dependency Rule

Dependencies must always point **inwards**:
`Presentation Layer -> Domain Layer <- Data Layer`

*   **Domain Layer** is the core. It has NO dependencies on any other layer or external frameworks (except core Dart).
*   **Presentation** depends on Domain (UseCases, Entities).
*   **Data** depends on Domain (implements Domain's Repository Interfaces, maps Models to Entities).

## Folder Structure

The codebase is organized by features (e.g., `home`, `cart`, `search`). Each feature contains three main architectural layers:

```text
lib/features/<feature_name>/
├── data/                      # External data communication
│   ├── models/                # DTOs, JSON parsing (Freezed)
│   ├── repositories/          # Repository implementations
│   └── services/              # Remote/Local data sources (API calls)
├── domain/                    # Core business logic
│   ├── entities/              # Pure Dart data structures
│   └── usecases/              # Business logic operations
└── presentation/              # UI and State Management
    ├── controllers/           # Riverpod Notifiers/Providers
    └── views/                 
        ├── screens/           # Main page widgets
        └── widgets/           # Dumb/Reusable UI components
```

## State Management (Riverpod)

*   We use `flutter_riverpod` and `riverpod_generator` (`@riverpod`).
*   **Controllers** manage the state of the UI and orchestrate UseCases.
*   We strongly avoid using `ref.read` inside `build()` methods (both in Widgets and Notifiers) to ensure reactivity.
*   Independent states (like search queries, filters) are kept in separate providers to prevent unnecessary massive state objects.

## Data Mapping

Data mapping is strictly enforced to protect the Domain layer:
1.  **Incoming (API -> UI):** JSON -> Data Model (`fromJson`) -> Domain Entity (mapped in Repository) -> UI.
2.  **Outgoing (UI -> API):** Domain Params -> Data Model (mapped in Repository) -> JSON (`toJson`) -> API.