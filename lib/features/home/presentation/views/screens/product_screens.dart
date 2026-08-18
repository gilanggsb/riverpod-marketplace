import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_marketplace/features/features.dart';

class ProductScreen extends ConsumerWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productAsync = ref.watch(productControllerProvider);
    return Scaffold(
      body: productAsync.when(
        data: (state) {
          return NotificationListener(
            onNotification: (ScrollNotification scrollInfo) {
              if (scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent) {
                //call loadmore
                ref.read(productControllerProvider.notifier).loadMore();
              }
              return true;
            },
            child: ListView.builder(
              itemCount: (state.isLoadingMore ? 1 : 0) + state.products.length,
              itemBuilder: (context, index) {
                if (index == state.products.length) {
                  return const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Center(child: CircularProgressIndicator()),
                  );
                }

                final product = state.products[index];
                return ProductCard(productEntity: product);
              },
            ),
          );
        },
        error: (error, stackTrace) {
          return Center(child: Text(error.toString()));
        },
        loading: () {
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
