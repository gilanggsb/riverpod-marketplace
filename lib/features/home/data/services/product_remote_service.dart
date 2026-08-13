import '../../../features.dart' show Product;

class ProductRemoteService {
  Future<List<Product?>> getProducts() async {
    await Future.delayed(const Duration(seconds: 2));
    final products = <Product>[];
    for (var i = 0; i < 10; i++) {
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
          thumbnail: "thumbnail $i",
          images: ["image $i"],
        ),
      );
    }
    return products;
  }
}
