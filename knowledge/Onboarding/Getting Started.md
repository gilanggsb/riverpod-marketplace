# Getting Started

Welcome to the Riverpod Marketplace Mini project! This document will guide you on how to set up the project and understand the development workflow.

## Prerequisites

Ensure you have the following installed:
*   [Flutter SDK](https://docs.flutter.dev/get-started/install) (latest stable version recommended)
*   [Dart SDK](https://dart.dev/get-dart)
*   An IDE (VS Code or Android Studio) with Flutter extensions.

## Initial Setup

1.  **Clone the repository** (if you haven't already).
2.  **Install dependencies:**
    ```bash
    flutter pub get
    ```
3.  **Code Generation:**
    This project relies heavily on code generation for Riverpod (`riverpod_generator`) and Data Models (`freezed`). You must run the build runner to generate the necessary `.g.dart` and `.freezed.dart` files.
    
    *   To build once:
        ```bash
        dart run build_runner build -d
        ```
    *   To watch for changes (recommended during active development):
        ```bash
        dart run build_runner watch -d
        ```

4.  **Run the App:**
    ```bash
    flutter run
    ```

## Development Workflow

When adding a new feature, follow this sequence to maintain Clean Architecture:

1.  **Domain Layer First:**
    *   Define the `Entity` (core data structure).
    *   Define the `RequestParams` (if the feature requires fetching/sending data with parameters).
    *   Define the `Repository Interface` (abstract class).
    *   Create the `UseCase` (business logic).
2.  **Data Layer Second:**
    *   Define the `Data Model` (DTO with `freezed` and `@JsonKey` for JSON parsing).
    *   Create the `Remote/Local Service` (API calls).
    *   Implement the `Repository` (map Models to Entities).
3.  **Presentation Layer Last:**
    *   Create the `Controller` (Riverpod Notifier) to manage the state (`AsyncValue`, `PaginationState`, etc.) and connect to the UseCase.
    *   Build the `UI (Screens & Widgets)` and `ref.watch` the Controller.

## Useful Commands

*   `flutter analyze` - Check for linting errors.
*   `flutter test` - Run unit and widget tests.