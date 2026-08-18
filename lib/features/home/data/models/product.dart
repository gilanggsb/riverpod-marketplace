import 'package:freezed_annotation/freezed_annotation.dart';

part 'product.freezed.dart';
part 'product.g.dart';

@freezed
abstract class Product with _$Product {
  const factory Product({
    @JsonKey(name: "id") final int? id,
    @JsonKey(name: "title") final String? title,
    @JsonKey(name: "description") final String? description,
    @JsonKey(name: "category") final String? category,
    @JsonKey(name: "price") final double? price,
    @JsonKey(name: "discountPercentage") final double? discountPercentage,
    @JsonKey(name: "rating") final double? rating,
    @JsonKey(name: "stock") final int? stock,
    @JsonKey(name: "tags") final List<String>? tags,
    @JsonKey(name: "brand") final String? brand,
    @JsonKey(name: "thumbnail") final List<String>? images,
  }) = _Product;

  factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);
}
