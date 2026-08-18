import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_marketplace/features/features.dart';

class ProductCard extends ConsumerWidget {
  final ProductEntity? productEntity;
  const ProductCard({super.key, this.productEntity});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      child: ListTile(
        title: Text(productEntity?.name ?? ""),
        trailing: IconButton(onPressed: () => ref.read(cartControllerProvider.notifier).addToCart(productEntity!), icon: const Icon(Icons.add)),
      ),
    );
  }
}
