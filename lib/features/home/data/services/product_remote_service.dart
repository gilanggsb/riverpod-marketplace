import 'package:riverpod_marketplace/features/home/home.dart';

class ProductRemoteService {
  Future<List<Product?>> getProducts(ProductRequestModel params) async {
    await Future.delayed(const Duration(seconds: 2));
    final products = <Product>[];
    for (var i = (params.offset ?? 0); i < (params.limit ?? 10) + (params.offset ?? 0); i++) {
      // If there's a search key, append it to show it works
      final suffix = params.searchKey != null ? ' (Search: ${params.searchKey})' : '';
      final categoryName = params.categoryId != null ? ' (Category: ${params.categoryId})' : '';

      products.add(
        Product(
          id: i,
          title: "title $i$suffix $categoryName",
          description: "description $i",
          category: "category $i",
          price: i.toDouble(),
          discountPercentage: i.toDouble(),
          rating: i.toDouble(),
          stock: i,
          tags: ["tag $i"],
          brand: "brand $i",
          images: ["image $i"],
        ),
      );
    }
    return products;
  }

  Future<List<CategoryModel>> getCategories() async {
    await Future.delayed(const Duration(seconds: 2));
    return [const CategoryModel(id: 1, name: "Electronics"), const CategoryModel(id: 2, name: "Fashion"), const CategoryModel(id: 3, name: "Books")];
  }
}
