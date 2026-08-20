import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../lib.dart';

part 'category_controller.g.dart';

@riverpod
class CategoryController extends _$CategoryController {
  @override
  FutureOr<CategoryState> build() async {
    final categories = await ref.watch(getCategoriesUseCaseProvider)();
    return CategoryState(categories: categories);
  }

  void selectCategory(CategoryEntity? category) {
    final current = state.valueOrNull;
    if (current == null) return;
    state = AsyncValue.data(current.copyWith(selectedCategory: isCategorySelected(category) ? null : category));
  }

  bool isCategorySelected(CategoryEntity? category) {
    return state.valueOrNull?.selectedCategory?.id == category?.id;
  }
}
