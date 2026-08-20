import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../features.dart';

part 'category_state.freezed.dart';

@Freezed(toJson: false, fromJson: false)
abstract class CategoryState with _$CategoryState {
  const factory CategoryState({@Default([]) List<CategoryEntity?> categories, CategoryEntity? selectedCategory}) = _CategoryState;

  factory CategoryState.initial() => const CategoryState();
}
