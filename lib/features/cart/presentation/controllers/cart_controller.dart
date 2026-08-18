import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../features.dart';

part 'cart_controller.g.dart';

@Riverpod(keepAlive: true)
class CartController extends _$CartController {
  @override
  List<CartItemEntity> build() => [];

  void addToCart(ProductEntity product) {
    final index = state.indexWhere((item) => item.productId == product.id);
    // add to cart if exist
    if (index == -1) {
      state = [...state, CartItemEntity(productId: product.id ?? 0, quantity: 1, productName: product.name ?? '', price: product.price ?? 0)];
      return;
    }
    // update quantity
    final updated = [...state];
    updated[index] = updated[index].copyWith(quantity: updated[index].quantity + 1);
    state = updated;
  }

  void removeFromCart(ProductEntity product) {
    state = state.where((item) => item.productId != product.id).toList();
  }

  void decreaseQty(ProductEntity product) {
    final index = state.indexWhere((item) => item.productId == product.id);
    if (index == -1) return;

    final item = state[index];
    if (item.quantity <= 1) return removeFromCart(product);

    final updated = [...state];
    updated[index] = item.copyWith(quantity: item.quantity - 1);
    state = updated;
  }
}

@riverpod
double cartTotal(Ref ref) {
  final cartItems = ref.watch(cartControllerProvider);

  double total = 0;
  for (final item in cartItems) {
    total += item.price * item.quantity;
  }
  return total;
}
