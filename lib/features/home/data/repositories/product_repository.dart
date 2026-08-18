import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_marketplace/features/features.dart';

part 'product_repository.g.dart';

abstract class ProductRepository {
  Future<List<ProductEntity?>> getProducts(ProductRequestParams params);
}

class ProductRepositoryImpl extends ProductRepository {
  final ProductRemoteService _productRemoteService;

  ProductRepositoryImpl({required this._productRemoteService});

  @override
  Future<List<ProductEntity?>> getProducts(ProductRequestParams params) async {
    final requestParams = ProductRequestModel(limit: params.limit, offset: params.offset, searchKey: params.searchKey);
    final products = await _productRemoteService.getProducts(requestParams);
    final productEntities = <ProductEntity>[];
    for (Product? product in products) {
      productEntities.add(ProductEntity(id: product?.id, name: product?.title));
    }
    return productEntities;
  }
}

@Riverpod(keepAlive: true)
ProductRepository productRepository(Ref ref) {
  return ProductRepositoryImpl(productRemoteService: ProductRemoteService());
}
