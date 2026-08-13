import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../home.dart';

part 'product_controller.g.dart';

@riverpod
class ProductController extends _$ProductController {
  @override
  Future<List<ProductEntity?>> build() async {
    final products = await ref.watch(getProductsUseCaseProvider)();
    return products;
  }
}
