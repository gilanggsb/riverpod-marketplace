// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProductRequestModel _$ProductRequestModelFromJson(Map<String, dynamic> json) =>
    _ProductRequestModel(
      limit: (json['limit'] as num?)?.toInt(),
      offset: (json['offset'] as num?)?.toInt(),
      searchKey: json['search_Key'] as String?,
      categoryId: (json['category_id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ProductRequestModelToJson(
  _ProductRequestModel instance,
) => <String, dynamic>{
  'limit': instance.limit,
  'offset': instance.offset,
  'search_Key': instance.searchKey,
  'category_id': instance.categoryId,
};
