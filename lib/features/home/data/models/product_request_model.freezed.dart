// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProductRequestModel {

@JsonKey(name: "limit") int? get limit;@JsonKey(name: "offset") int? get offset;@JsonKey(name: "search_Key") String? get searchKey;@JsonKey(name: "category_id") int? get categoryId;
/// Create a copy of ProductRequestModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductRequestModelCopyWith<ProductRequestModel> get copyWith => _$ProductRequestModelCopyWithImpl<ProductRequestModel>(this as ProductRequestModel, _$identity);

  /// Serializes this ProductRequestModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductRequestModel&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.offset, offset) || other.offset == offset)&&(identical(other.searchKey, searchKey) || other.searchKey == searchKey)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,limit,offset,searchKey,categoryId);

@override
String toString() {
  return 'ProductRequestModel(limit: $limit, offset: $offset, searchKey: $searchKey, categoryId: $categoryId)';
}


}

/// @nodoc
abstract mixin class $ProductRequestModelCopyWith<$Res>  {
  factory $ProductRequestModelCopyWith(ProductRequestModel value, $Res Function(ProductRequestModel) _then) = _$ProductRequestModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "limit") int? limit,@JsonKey(name: "offset") int? offset,@JsonKey(name: "search_Key") String? searchKey,@JsonKey(name: "category_id") int? categoryId
});




}
/// @nodoc
class _$ProductRequestModelCopyWithImpl<$Res>
    implements $ProductRequestModelCopyWith<$Res> {
  _$ProductRequestModelCopyWithImpl(this._self, this._then);

  final ProductRequestModel _self;
  final $Res Function(ProductRequestModel) _then;

/// Create a copy of ProductRequestModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? limit = freezed,Object? offset = freezed,Object? searchKey = freezed,Object? categoryId = freezed,}) {
  return _then(_self.copyWith(
limit: freezed == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int?,offset: freezed == offset ? _self.offset : offset // ignore: cast_nullable_to_non_nullable
as int?,searchKey: freezed == searchKey ? _self.searchKey : searchKey // ignore: cast_nullable_to_non_nullable
as String?,categoryId: freezed == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [ProductRequestModel].
extension ProductRequestModelPatterns on ProductRequestModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProductRequestModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProductRequestModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProductRequestModel value)  $default,){
final _that = this;
switch (_that) {
case _ProductRequestModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProductRequestModel value)?  $default,){
final _that = this;
switch (_that) {
case _ProductRequestModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "limit")  int? limit, @JsonKey(name: "offset")  int? offset, @JsonKey(name: "search_Key")  String? searchKey, @JsonKey(name: "category_id")  int? categoryId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProductRequestModel() when $default != null:
return $default(_that.limit,_that.offset,_that.searchKey,_that.categoryId);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "limit")  int? limit, @JsonKey(name: "offset")  int? offset, @JsonKey(name: "search_Key")  String? searchKey, @JsonKey(name: "category_id")  int? categoryId)  $default,) {final _that = this;
switch (_that) {
case _ProductRequestModel():
return $default(_that.limit,_that.offset,_that.searchKey,_that.categoryId);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "limit")  int? limit, @JsonKey(name: "offset")  int? offset, @JsonKey(name: "search_Key")  String? searchKey, @JsonKey(name: "category_id")  int? categoryId)?  $default,) {final _that = this;
switch (_that) {
case _ProductRequestModel() when $default != null:
return $default(_that.limit,_that.offset,_that.searchKey,_that.categoryId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProductRequestModel implements ProductRequestModel {
  const _ProductRequestModel({@JsonKey(name: "limit") this.limit, @JsonKey(name: "offset") this.offset, @JsonKey(name: "search_Key") this.searchKey, @JsonKey(name: "category_id") this.categoryId});
  factory _ProductRequestModel.fromJson(Map<String, dynamic> json) => _$ProductRequestModelFromJson(json);

@override@JsonKey(name: "limit") final  int? limit;
@override@JsonKey(name: "offset") final  int? offset;
@override@JsonKey(name: "search_Key") final  String? searchKey;
@override@JsonKey(name: "category_id") final  int? categoryId;

/// Create a copy of ProductRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductRequestModelCopyWith<_ProductRequestModel> get copyWith => __$ProductRequestModelCopyWithImpl<_ProductRequestModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProductRequestModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductRequestModel&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.offset, offset) || other.offset == offset)&&(identical(other.searchKey, searchKey) || other.searchKey == searchKey)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,limit,offset,searchKey,categoryId);

@override
String toString() {
  return 'ProductRequestModel(limit: $limit, offset: $offset, searchKey: $searchKey, categoryId: $categoryId)';
}


}

/// @nodoc
abstract mixin class _$ProductRequestModelCopyWith<$Res> implements $ProductRequestModelCopyWith<$Res> {
  factory _$ProductRequestModelCopyWith(_ProductRequestModel value, $Res Function(_ProductRequestModel) _then) = __$ProductRequestModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "limit") int? limit,@JsonKey(name: "offset") int? offset,@JsonKey(name: "search_Key") String? searchKey,@JsonKey(name: "category_id") int? categoryId
});




}
/// @nodoc
class __$ProductRequestModelCopyWithImpl<$Res>
    implements _$ProductRequestModelCopyWith<$Res> {
  __$ProductRequestModelCopyWithImpl(this._self, this._then);

  final _ProductRequestModel _self;
  final $Res Function(_ProductRequestModel) _then;

/// Create a copy of ProductRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? limit = freezed,Object? offset = freezed,Object? searchKey = freezed,Object? categoryId = freezed,}) {
  return _then(_ProductRequestModel(
limit: freezed == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int?,offset: freezed == offset ? _self.offset : offset // ignore: cast_nullable_to_non_nullable
as int?,searchKey: freezed == searchKey ? _self.searchKey : searchKey // ignore: cast_nullable_to_non_nullable
as String?,categoryId: freezed == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
