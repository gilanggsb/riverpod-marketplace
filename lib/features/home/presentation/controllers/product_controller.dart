import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../lib.dart';

part 'product_controller.g.dart';

const _klimit = 10;

@riverpod
class ProductController extends _$ProductController {
  @override
  Future<ProductPaginationState> build() async {
    final categoryState = ref.watch(categoryControllerProvider).valueOrNull;
    final query = ref.watch(searchQueryProvider("product"));

    final params = ProductRequestParams(
      limit: _klimit,
      offset: 0,
      searchKey: query.isNotEmpty ? query : null,
      categoryId: categoryState?.selectedCategory?.id,
    );
    final products = await ref.watch(getProductsUseCaseProvider)(params);
    return ProductPaginationState(hasMore: products.length >= _klimit, products: products, offset: products.length);
  }

  Future<void> loadMore() async {
    final current = state.valueOrNull;
    if (current == null || current.isLoadingMore || !current.hasMore) return;

    final categoryState = ref.read(categoryControllerProvider).valueOrNull;
    final query = ref.read(searchQueryProvider("product"));
    state = AsyncData(current.copyWith(isLoadingMore: true));
    final params = ProductRequestParams(
      offset: current.offset,
      limit: _klimit,
      searchKey: query.isNotEmpty ? query : null,
      categoryId: categoryState?.selectedCategory?.id,
    );
    final products = await ref.read(getProductsUseCaseProvider)(params);
    state = AsyncData(
      current.copyWith(products: [...current.products, ...products], offset: current.offset, isLoadingMore: false, hasMore: products.isNotEmpty),
    );
  }
}
