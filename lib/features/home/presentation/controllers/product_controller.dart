import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../home.dart';

part 'product_controller.g.dart';

const _klimit = 10;

@riverpod
class ProductController extends _$ProductController {
  @override
  Future<ProductPaginationState> build() async {
    final params = ProductRequestParams(limit: _klimit, offset: 0);
    final products = await ref.watch(getProductsUseCaseProvider)(params);
    return ProductPaginationState(hasMore: true, products: products, offset: _klimit);
  }

  Future<void> loadMore() async {
    final current = state.valueOrNull;
    if (current == null || current.isLoadingMore || !current.hasMore) return;

    state = AsyncData(current.copyWith(isLoadingMore: true));
    final params = ProductRequestParams(offset: current.offset + _klimit, limit: _klimit);
    final products = await ref.read(getProductsUseCaseProvider)(params);
    state = AsyncData(
      current.copyWith(products: [...current.products, ...products], offset: current.offset, isLoadingMore: false, hasMore: products.isNotEmpty),
    );
  }
}
