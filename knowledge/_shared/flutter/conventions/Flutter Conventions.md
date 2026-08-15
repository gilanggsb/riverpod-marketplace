# Flutter Conventions

status: active
tags: conventions, flutter, dart

## Project Structure

```
lib/
├── common/               # Reusable: components, constants, models, services
├── features/              # Feature modules (GetX-first)
│   └── [feature]/
│       ├── bindings/      # DI bindings
│       ├── controllers/   # State & UI orchestration
│       ├── models/        # Data models
│       ├── repositories/  # Data access
│       └── views/
│           ├── pages/     # Screens
│           └── widgets/   # Reusable components
├── src/                   # Legacy modules (Bloc/Cubit)
└── main.dart
```

## State Management

### GetX Pattern (New Features)

```
Binding → Controller → Repository → ApiService → Backend
```

```dart
// Binding
class FeatureBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FeatureController());
    Get.lazyPut(() => FeatureRepository());
  }
}

// Controller
class FeatureController extends GetxController {
  final isLoading = false.obs;
  final items = <Item>[].obs;

  void fetchItems() async { }
}
```

### Rules

- Keep state in the controller, not the view
- No `setState()`
- Use `enum` for states and categories
- Load data in `onInit()`
- Handle errors in the controller and display them through `SnackbarManager`

## Code Style

### Widgets

- Always use **Class Widgets** (StatelessWidget/StatefulWidget)
- Never function-based widgets
- Extract reusable widgets into `views/widgets/`

```dart
// Good
class UserTile extends StatelessWidget {
  const UserTile({super.key, required this.user});

  final User user;

  @override
  Widget build(BuildContext context) {
    return ListTile(title: Text(user.name));
  }
}

// Bad
Widget userTile(User user) {
  return ListTile(title: Text(user.name));
}
```

### Build Methods

- Avoid complex expressions (for, map, where, etc.)
- Keep widget trees declarative
- Move iteration logic to the controller

```dart
// Good
@override
Widget build(BuildContext context) {
  return Column(
    children: [
      Header(),
      if (isLoading) LoadingIndicator(),
      Expanded(child: _buildList()),
    ],
  );
}

// Bad
return Column(
  children: items.map((e) => ComplexWidget(data: e)).toList(),
);
```

## Data Models

### Freezed + json_serializable

```dart
@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    String? id,
    String? name,
    String? email,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
```

### Rules

- All properties **nullable**
- No `required` fields
- Use snake_case naming, the json_serializable default
- No `@JsonKey` unless API key genuinely differs
- Generated files: **DON'T EDIT** → run `make build_runner`

## Typed API Response Parsing

Keep request orchestration in repositories and response-shape normalization in typed model or response factories.

```dart
return apiService.get<ItemResponse>(
  endpoint,
  fromJsonT: (dynamic json) => ItemResponse.fromJson(json),
);
```

### Rules

- Pass typed `fromJson` factories through the API client's deserialization callback.
- Let response or model classes normalize envelopes and fields.
- Keep repositories focused on endpoints, parameters, payloads, and error context.
- Return raw dynamic payloads only when an endpoint intentionally has no typed response.
- Do not add a second response wrapper when the API client already normalizes the same envelope.
- Use a dedicated parser or discriminator for genuinely polymorphic payloads.

## Alerts & Notifications

Use `SnackbarManager` or `DialogManager`:

```dart
// Success
SnackbarManager.showSuccessSnackbar(message: 'Success!');

// Error
SnackbarManager.showErrorSnackbar(message: 'Error occurred');

// Dialog
await DialogManager.showSimpleDialog<bool>(
  title: 'Confirm',
  message: 'Are you sure?',
);
```

## Flutter Gotchas

### Bottom Sheets

Use `showModalBottomSheet` Flutter native, not `Get.bottomSheet`:

```dart
showModalBottomSheet(
  context: context,
  isScrollControlled: true,
  builder: (_) => SomeBottomSheet(),
);
```

### Safe Area in Modals

If `SafeArea` doesn't work in bottom sheet:

```dart
MediaQuery.of(context).padding.bottom  // won't work
Get.mediaQuery.padding.bottom           // use this instead
```

### setState During Build

Never trigger reactive state changes synchronously during build:

```dart
// Bad
@override
Widget build(BuildContext context) {
  controller.fetchData(); // triggers state change during build!
  return ...
}

// Good
@override
void initState() {
  super.initState();
  WidgetsBinding.instance.addPostFrameCallback((_) {
    controller.fetchData();
  });
}
```

## Related

- [[../../common/conventions/Naming Conventions]]
- [[../../common/architecture/Patterns]]

---

# Global Loading Overlay Pattern

## Context

Applications frequently need to block user interaction and show a loading spinner during asynchronous operations (API calls, data syncing). Instead of managing `isLoading` state locally inside every UI component, a global overlay ensures consistency and prevents accidental double-taps.

## Evidence

Implemented in `mobile-tms-cas` within `lib/common/components/loading_overlay.dart`. The solution uses a `ValueNotifier` and global context to show/hide the loader from anywhere in the app (UI or Controller layer).

## Reusable Pattern

1. Wrap `MaterialApp` router output or the main `Scaffold` with `LoadingOverlayAlt`.
2. Provide a globally accessible navigator key.
3. Call `showLoading()` and `dismissLoading()` seamlessly.

```dart
class LoadingOverlayAlt extends StatelessWidget {
  LoadingOverlayAlt({super.key, required this.child})
      : _isLoadingNotifier = ValueNotifier<bool>(false);
  final ValueNotifier<bool> _isLoadingNotifier;
  final Widget child;

  static LoadingOverlayAlt of(BuildContext context) {
    return context.findAncestorWidgetOfExactType<LoadingOverlayAlt>()!;
  }
  void show() => _isLoadingNotifier.value = true;
  void hide() => _isLoadingNotifier.value = false;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: _isLoadingNotifier,
      child: child,
      builder: (context, isLoading, child) {
        return Material(
          child: Stack(
            children: [
              child!,
              if (isLoading) ModalBarrier(dismissible: false, color: Colors.black54),
              if (isLoading) Center(child: CircularProgressIndicator()),
            ],
          ),
        );
      },
    );
  }
}

// Global functions utilizing a navigator key
void showLoading() => LoadingOverlayAlt.of(globalNavigatorKey.currentContext!).show();
void dismissLoading() => LoadingOverlayAlt.of(globalNavigatorKey.currentContext!).hide();
```

## Constraints

- Ensure `globalNavigatorKey` is always attached to `MaterialApp`.
- Be cautious of overlapping overlays (e.g., triggering `showLoading` twice without dismissing the first).
- Use localized loading indicators (e.g., Shimmer) for partial page loads, reserving this for blocking operations.

---

# Offline State Detection and UI Pattern

## Context

Warehouse and Transport Management applications are frequently used in areas with poor or no network connectivity. Failing gracefully and notifying the user of network status is a critical UX requirement.

## Evidence

Implemented in `mobile-tms-cas` within `lib/common/components/connectivity_widget.dart` utilizing `internet_connection_checker_plus`.

## Reusable Pattern

This pattern provides a lifecycle-aware global listener that doesn't leak memory.

```dart
class ConnectivityWidget extends StatefulWidget {
  final Widget child;
  const ConnectivityWidget({super.key, required this.child});
  @override
  State<ConnectivityWidget> createState() => _ConnectivityWidgetState();
}

class _ConnectivityWidgetState extends State<ConnectivityWidget> {
  late final StreamSubscription<InternetStatus> _subscription;
  late final AppLifecycleListener _listener;

  @override
  void initState() {
    super.initState();
    _subscription = InternetConnection().onStatusChange.listen((status) {
        if (status == InternetStatus.disconnected) {
           SnackbarManager.showErrorSnackbar(message: "No internet connection");
        }
    });
    // PAUSE CHECKING WHEN IN BACKGROUND
    _listener = AppLifecycleListener(
      onResume: _subscription.resume,
      onHide: _subscription.pause,
      onPause: _subscription.pause,
    );
  }

  @override
  void dispose() {
    _subscription.cancel();
    _listener.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.child;
}
```

## Constraints

- Do not use standard `connectivity_plus` alone if you require actual ping checks to the internet. `internet_connection_checker_plus` is preferred because it verifies actual routing, not just Wi-Fi/Cellular toggles.
- Avoid locking the UI entirely during offline states if local caching allows the user to continue working.

---

# Background and Foreground Location Tracking

## Context

Transport applications (TMS) require robust location tracking to update dispatcher dashboards, track delivery progress, and validate driver activity locations (geofencing). This involves requesting specific permissions, handling mock location detection, and performing coordinate comparisons without bloating UI layers.

## Evidence

Found in `mobile-tms-cas` inside `lib/common/services/location_service.dart`. This service abstracts the `geolocator` package, providing standardized UI alerts for disabled services and centralized mathematical comparisons.

## Reusable Pattern

Centralize location logic into a service that returns standard models, rather than exposing the underlying package logic (e.g., `Geolocator`) directly to GetX/Bloc controllers.

```dart
class LocationService {
  // 1. Unify readiness check
  Future<bool> _isLocationReady({bool showDialog = true}) async {
    if (!await requestPermission()) return false;
    if (!await isLocationServiceEnabled(showDialog: showDialog)) return false;
    return true;
  }

  // 2. Wrap the package model with a custom domain model
  Future<BaseLocationData?> getLocation({bool showDialog = true}) async {
      if (!await _isLocationReady(showDialog: showDialog)) return null;
      final position = await Geolocator.getCurrentPosition();
      return BaseLocationData(
        latitude: position.latitude,
        longitude: position.longitude,
        isMocked: position.isMocked,
      );
  }

  // 3. Centralize distance math
  DistanceBetweenResult compareDistance({
    required DistanceComparison comparison,
    BaseLocationData? prev,
    BaseLocationData? curr,
    double limit = 0,
  }) {
      final distance = Geolocator.distanceBetween(
        prev?.latitude ?? 0, prev?.longitude ?? 0,
        curr?.latitude ?? 0, curr?.longitude ?? 0,
      );
      return DistanceBetweenResult(
        result: comparison == DistanceComparison.lessThan ? distance < limit : distance > limit, 
        distanceResult: distance
      );
  }
}
```

## Constraints

- iOS and Android have different background location requirements (e.g., `UIBackgroundModes` in `Info.plist` and Foreground Services in Android). The Dart service pattern must be paired with the correct native configuration.
- Battery drain: Avoid `Geolocator.getPositionStream()` unless the app is in an active delivery mode. Prefer point-in-time checks (`getCurrentPosition`) for simple activity logging.

---

# Draggable Floating Button Pattern

## Context

Mobile operational applications (like TMS and WMS) often require persistent floating action buttons for quick access to core utilities (like a barcode scanner or chat widget). These buttons need to be accessible without obstructing the main UI.

## Evidence

Implemented successfully in `mobile-tms-cas` within `lib/common/components/draggable_floating_button.dart`. The UI prevents obstruction by automatically fading to 40% opacity after 2 seconds of inactivity and snaps to the left or right edges when dragged.

## Reusable Pattern

This component is highly reusable across the CAS ecosystem. Place it inside a `Stack` at the top level of the screen or application layout.

```dart
class DraggableFloatingButton extends StatefulWidget {
  final Widget child;
  final VoidCallback? onTap;
  final double size;

  // Implementation uses AnimatedPositioned and Timer to handle fading and snapping
  // ...
}

// Usage:
DraggableFloatingButton(
  size: 50,
  onTap: () => print('FAB tapped'),
  child: Container(
    decoration: BoxDecoration(color: Colors.blue, shape: BoxShape.circle),
    child: Icon(Icons.qr_code_scanner, color: Colors.white),
  ),
)
```

## Constraints

- Must be used within a `Stack`.
- The parent container should bound to the full screen size to ensure `MediaQuery.of(context).size` provides accurate dragging limits.
- Do not use if standard `FloatingActionButton` and `Scaffold` FAB locations are sufficient.

---

# Stateful Wrapper for Lifecycle Management

## Context

In Flutter, specifically when using state management solutions like GetX or Provider, UI components are often built as `StatelessWidget`. However, we frequently need to execute lifecycle events (e.g., fetching data `onInit`, cleaning up controllers `onDispose`) without refactoring the entire widget into a `StatefulWidget`.

## Evidence

Implemented in `mobile-tms-cas` within `lib/common/components/stateful_wrapper_component.dart`. Used across multiple UI components to trigger initialization logic cleanly.

## Reusable Pattern

```dart
StatefulWrapper(
  onInit: () {
    // Controller initialization logic
    controller.fetchData();
  },
  onDispose: () {
    // Cleanup logic
    controller.clearData();
  },
  child: MyStatelessWidget(),
)
```

## Constraints

- **Do not overuse:** If a widget inherently needs local state (animations, local toggles), it should be a proper `StatefulWidget` instead of using this wrapper.
- **GetX Alternative:** If using GetX, `GetBuilder` or `GetX` widgets already provide `initState` and `dispose` callbacks, which might make this wrapper redundant depending on the context.


## Context

Mobile apps often struggle with bulk selection on paginated endpoints. Forcing the frontend to fetch and send an array of thousands of IDs for a "Select All" action causes out-of-memory errors and sluggish UX. A dedicated pattern for global bulk selection mitigates this.

## Evidence

The `DispatchOrdersPage` (in mobile-wms-cas) implements a hybrid bulk selection UX (the "Gmail Pattern"). The frontend maintains local selection state (`selectedIds`) for specific items, and a global selection state (`isSelectAllGlobal`) triggered when the user wants to apply an action to the entire filtered dataset.

The API payload (`BatchConfirmDispatchOrdersParams`) was modified to remove the hard requirement for `dispatch_ids` and instead accepts `isSelectAll` alongside the active filter parameters.

## Reusable Pattern

- **UX:** Use a subtle icon/action button for local selection. When all loaded selectable items are checked, offer a global "Select All {TotalItems}" banner.
- **Payload:** Include an `is_select_all` boolean in the bulk action API. If true, omit explicit IDs and send the active filter parameters instead.
- **State Guarding:** If global selection is active and a user unchecks a single local item, immediately deactivate global selection but preserve the remaining local selection state.

## Constraints

- The backend MUST support receiving filter parameters in the bulk action endpoint to process the un-paginated data independently.
- The bulk endpoint should return a model containing the `confirmedCount` to provide accurate UI feedback (Snackbar).

---

# Draggable Bottom Sheet

## Context

Complex filter sheets with multiple sections (like chips, checkboxes, and lists) often exceed screen height. Using a standard `Container` with a nested `SingleChildScrollView` inside a `showModalBottomSheet` creates conflicting scroll gestures between dismissing the modal and scrolling its content.

## Evidence

The `DispatchOrdersFilterSheet` (in mobile-wms-cas) was refactored from a constrained `Container` holding a `SingleChildScrollView` to a native `DraggableScrollableSheet`.

## Reusable Pattern

- Use `DraggableScrollableSheet` as the root of bottom sheets that contain long, scrollable content.
- Set `expand: false` to ensure it still looks like a modal.
- Pass the `ScrollController` from the builder into the inner `ListView` to seamlessly merge the swipe-to-dismiss gesture with content scrolling.

## Constraints

- Do not use `Column` with `Flexible` inside the sheet builder if the inner content uses `ListView`. Use `Expanded` to wrap the `ListView`.
- Ensure fixed headers or sticky buttons are placed outside the inner `ListView` but inside the main sheet Column.
