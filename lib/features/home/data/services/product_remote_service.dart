import 'package:riverpod_marketplace/features/home/home.dart';

class ProductRemoteService {
  Future<List<Product?>> getProducts(ProductRequestModel params) async {
    await Future.delayed(const Duration(seconds: 2));
    final products = <Product>[];
    for (var i = (params.offset ?? 0); i < (params.limit ?? 10) + (params.offset ?? 0); i++) {
      products.add(
        Product(
          id: i,
          title: "title $i",
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
}
