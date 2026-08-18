import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_request_model.freezed.dart';
part 'product_request_model.g.dart';

@freezed
abstract class ProductRequestModel with _$ProductRequestModel {
  const factory ProductRequestModel({
    @JsonKey(name: "limit") final int? limit,
    @JsonKey(name: "offset") final int? offset,
    @JsonKey(name: "search_Key") final String? searchKey,
  }) = _ProductRequestModel;
  factory ProductRequestModel.fromJson(Map<String, dynamic> json) => _$ProductRequestModelFromJson(json);
}
