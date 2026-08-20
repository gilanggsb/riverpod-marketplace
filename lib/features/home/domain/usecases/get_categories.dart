import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../lib.dart';

part 'get_categories.g.dart';

class GetCategoriesUseCase {
  final ProductRepository _productRepository;

  GetCategoriesUseCase(this._productRepository);

  FutureOr<List<CategoryEntity?>> call() async {
    return await _productRepository.getCategories();
  }
}

@riverpod
GetCategoriesUseCase getCategoriesUseCase(Ref ref) {
  return GetCategoriesUseCase(ref.watch(productRepositoryProvider));
}
