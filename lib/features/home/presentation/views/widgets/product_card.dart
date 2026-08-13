import 'package:flutter/material.dart';
import 'package:riverpod_marketplace/features/features.dart';

class ProductCard extends StatelessWidget {
  final ProductEntity? productEntity;
  const ProductCard({super.key, this.productEntity});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(title: Text(productEntity?.name ?? ""), subtitle: Text((productEntity?.id ?? "").toString())),
    );
  }
}
