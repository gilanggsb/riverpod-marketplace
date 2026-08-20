import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../lib.dart';

class ProductScreen extends ConsumerWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          decoration: const InputDecoration(hintText: 'Search Products...', border: InputBorder.none, icon: Icon(Icons.search)),
          onChanged: (value) => ref.read(searchQueryProvider("product").notifier).update(value),
        ),
      ),
      body: const Column(
        children: [
          CategoryChips(),
          Expanded(child: ProductList()),
        ],
      ),
    );
  }
}
