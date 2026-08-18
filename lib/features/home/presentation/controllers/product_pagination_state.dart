import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../features.dart';

part 'product_pagination_state.freezed.dart';

@Freezed(toJson: false, fromJson: false)
abstract class ProductPaginationState with _$ProductPaginationState {
  const factory ProductPaginationState({
    @Default([]) List<ProductEntity?> products,
    @Default(0) int offset,
    @Default(true) bool hasMore,
    @Default(false) bool isLoadingMore,
  }) = _ProductPaginationState;

  factory ProductPaginationState.initial() => const ProductPaginationState();
}
