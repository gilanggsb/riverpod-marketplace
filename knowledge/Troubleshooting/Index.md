# Troubleshooting & Debugging Guide

This index contains common issues encountered during development and how to resolve them.

## Code Generation Issues

### 1. `part '...g.dart';` or `...freezed.dart` shows error
*   **Cause:** The generated file does not exist yet or is outdated.
*   **Solution:** Run the build runner.
    ```bash
    dart run build_runner build -d
    ```

### 2. Build Runner fails with conflicting outputs
*   **Cause:** Leftover generated files from previous branch switches or renames.
*   **Solution:** Clean and rebuild.
    ```bash
    dart run build_runner clean
    dart run build_runner build -d
    ```

## Riverpod Issues

### 1. UI is not updating when State changes
*   **Cause:**
    *   You are using `ref.read` instead of `ref.watch` inside the `build()` method.
    *   You are mutating a list/map directly (e.g., `state.add(item)`) instead of creating a new instance (e.g., `state = [...state, item]`). Riverpod relies on object equality to trigger rebuilds.
*   **Solution:** Use `ref.watch` in `build()`, and always return new instances when updating state.

### 2. Provider is disposed too early
*   **Cause:** Using `riverpod_generator`, providers are `autoDispose` by default. If no widget is watching it, the state is destroyed.
*   **Solution:** If the state needs to persist (e.g., a Shopping Cart), add `keepAlive: true` to the annotation.
    ```dart
    @Riverpod(keepAlive: true)
    ```

## API & Network Issues

### 1. JSON parsing error (`type 'String' is not a subtype of type 'int'`)
*   **Cause:** The backend changed the data type, or the `Data Model` type definition does not match the actual JSON response.
*   **Solution:** Verify the API response using Postman/Swagger, and update the `freezed` model accordingly. Use `@JsonKey(name: '...')` if the field name changed.