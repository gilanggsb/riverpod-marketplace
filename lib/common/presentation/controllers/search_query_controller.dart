import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'search_query_controller.g.dart';

@riverpod
class SearchQuery extends _$SearchQuery {
  Timer? _timer;
  @override
  String build(String tag, {Duration delay = const Duration(milliseconds: 500)}) {
    ref.onDispose(() => _timer?.cancel());
    return '';
  }

  void update(String query) {
    _timer?.cancel();
    _timer = Timer(delay, () {
      state = query;
    });
  }
}
