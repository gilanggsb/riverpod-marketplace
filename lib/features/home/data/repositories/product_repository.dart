import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_marketplace/features/features.dart';

part 'product_repository.g.dart';

abstract class ProductRepository {
  Future<List<ProductEntity?>> getProducts();
}

class ProductRepositoryImpl extends ProductRepository {
  late ProductRemoteService _productRemoteService;

  @override
  Future<List<ProductEntity?>> getProducts() async {
    final products = await _productRemoteService.getProducts();
    final productEntities = <ProductEntity>[];
    for (Product? product in products) {
      productEntities.add(ProductEntity(id: product?.id, name: product?.title));
    }
    return productEntities;
  }
}

@Riverpod(keepAlive: true)
ProductRepository productRepository(Ref ref) {
  return ProductRepositoryImpl();
}
