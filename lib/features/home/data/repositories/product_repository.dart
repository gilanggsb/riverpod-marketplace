import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_marketplace/features/features.dart';

part 'product_repository.g.dart';

abstract class ProductRepository {
  Future<List<ProductEntity?>> getProducts(ProductRequestParams params);
  Future<List<CategoryEntity?>> getCategories();
}

class ProductRepositoryImpl extends ProductRepository {
  final ProductRemoteService _productRemoteService;

  ProductRepositoryImpl({required this._productRemoteService});

  @override
  Future<List<ProductEntity?>> getProducts(ProductRequestParams params) async {
    final requestParams = ProductRequestModel(limit: params.limit, offset: params.offset, searchKey: params.searchKey, categoryId: params.categoryId);
    final products = await _productRemoteService.getProducts(requestParams);
    final productEntities = <ProductEntity>[];
    for (Product? product in products) {
      productEntities.add(ProductEntity(id: product?.id, name: product?.title, price: product?.price));
    }
    return productEntities;
  }

  @override
  Future<List<CategoryEntity?>> getCategories() async {
    final categories = await _productRemoteService.getCategories();
    final categoryEntities = <CategoryEntity>[];
    for (CategoryModel? category in categories) {
      categoryEntities.add(CategoryEntity(id: category?.id, name: category?.name));
    }
    return categoryEntities;
  }
}

@Riverpod(keepAlive: true)
ProductRepository productRepository(Ref ref) {
  return ProductRepositoryImpl(productRemoteService: ProductRemoteService());
}
