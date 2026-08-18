import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../home.dart';

part 'get_products.g.dart';

class GetProductsUseCase {
  final ProductRepository _productRepository;

  GetProductsUseCase(this._productRepository);

  Future<List<ProductEntity?>> call(ProductRequestParams params) async {
    return await _productRepository.getProducts(params);
  }
}

@Riverpod(keepAlive: true)
GetProductsUseCase getProductsUseCase(Ref ref) {
  return GetProductsUseCase(ref.watch(productRepositoryProvider));
}
