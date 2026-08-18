// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_pagination_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProductPaginationState {

 List<ProductEntity?> get products; int get offset; bool get hasMore; bool get isLoadingMore;
/// Create a copy of ProductPaginationState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductPaginationStateCopyWith<ProductPaginationState> get copyWith => _$ProductPaginationStateCopyWithImpl<ProductPaginationState>(this as ProductPaginationState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductPaginationState&&const DeepCollectionEquality().equals(other.products, products)&&(identical(other.offset, offset) || other.offset == offset)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore)&&(identical(other.isLoadingMore, isLoadingMore) || other.isLoadingMore == isLoadingMore));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(products),offset,hasMore,isLoadingMore);

@override
String toString() {
  return 'ProductPaginationState(products: $products, offset: $offset, hasMore: $hasMore, isLoadingMore: $isLoadingMore)';
}


}

/// @nodoc
abstract mixin class $ProductPaginationStateCopyWith<$Res>  {
  factory $ProductPaginationStateCopyWith(ProductPaginationState value, $Res Function(ProductPaginationState) _then) = _$ProductPaginationStateCopyWithImpl;
@useResult
$Res call({
 List<ProductEntity?> products, int offset, bool hasMore, bool isLoadingMore
});




}
/// @nodoc
class _$ProductPaginationStateCopyWithImpl<$Res>
    implements $ProductPaginationStateCopyWith<$Res> {
  _$ProductPaginationStateCopyWithImpl(this._self, this._then);

  final ProductPaginationState _self;
  final $Res Function(ProductPaginationState) _then;

/// Create a copy of ProductPaginationState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? products = null,Object? offset = null,Object? hasMore = null,Object? isLoadingMore = null,}) {
  return _then(_self.copyWith(
products: null == products ? _self.products : products // ignore: cast_nullable_to_non_nullable
as List<ProductEntity?>,offset: null == offset ? _self.offset : offset // ignore: cast_nullable_to_non_nullable
as int,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,isLoadingMore: null == isLoadingMore ? _self.isLoadingMore : isLoadingMore // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [ProductPaginationState].
extension ProductPaginationStatePatterns on ProductPaginationState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProductPaginationState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProductPaginationState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProductPaginationState value)  $default,){
final _that = this;
switch (_that) {
case _ProductPaginationState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProductPaginationState value)?  $default,){
final _that = this;
switch (_that) {
case _ProductPaginationState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<ProductEntity?> products,  int offset,  bool hasMore,  bool isLoadingMore)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProductPaginationState() when $default != null:
return $default(_that.products,_that.offset,_that.hasMore,_that.isLoadingMore);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<ProductEntity?> products,  int offset,  bool hasMore,  bool isLoadingMore)  $default,) {final _that = this;
switch (_that) {
case _ProductPaginationState():
return $default(_that.products,_that.offset,_that.hasMore,_that.isLoadingMore);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<ProductEntity?> products,  int offset,  bool hasMore,  bool isLoadingMore)?  $default,) {final _that = this;
switch (_that) {
case _ProductPaginationState() when $default != null:
return $default(_that.products,_that.offset,_that.hasMore,_that.isLoadingMore);case _:
  return null;

}
}

}

/// @nodoc


class _ProductPaginationState implements ProductPaginationState {
  const _ProductPaginationState({final  List<ProductEntity?> products = const [], this.offset = 0, this.hasMore = true, this.isLoadingMore = false}): _products = products;
  

 final  List<ProductEntity?> _products;
@override@JsonKey() List<ProductEntity?> get products {
  if (_products is EqualUnmodifiableListView) return _products;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_products);
}

@override@JsonKey() final  int offset;
@override@JsonKey() final  bool hasMore;
@override@JsonKey() final  bool isLoadingMore;

/// Create a copy of ProductPaginationState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductPaginationStateCopyWith<_ProductPaginationState> get copyWith => __$ProductPaginationStateCopyWithImpl<_ProductPaginationState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductPaginationState&&const DeepCollectionEquality().equals(other._products, _products)&&(identical(other.offset, offset) || other.offset == offset)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore)&&(identical(other.isLoadingMore, isLoadingMore) || other.isLoadingMore == isLoadingMore));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_products),offset,hasMore,isLoadingMore);

@override
String toString() {
  return 'ProductPaginationState(products: $products, offset: $offset, hasMore: $hasMore, isLoadingMore: $isLoadingMore)';
}


}

/// @nodoc
abstract mixin class _$ProductPaginationStateCopyWith<$Res> implements $ProductPaginationStateCopyWith<$Res> {
  factory _$ProductPaginationStateCopyWith(_ProductPaginationState value, $Res Function(_ProductPaginationState) _then) = __$ProductPaginationStateCopyWithImpl;
@override @useResult
$Res call({
 List<ProductEntity?> products, int offset, bool hasMore, bool isLoadingMore
});




}
/// @nodoc
class __$ProductPaginationStateCopyWithImpl<$Res>
    implements _$ProductPaginationStateCopyWith<$Res> {
  __$ProductPaginationStateCopyWithImpl(this._self, this._then);

  final _ProductPaginationState _self;
  final $Res Function(_ProductPaginationState) _then;

/// Create a copy of ProductPaginationState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? products = null,Object? offset = null,Object? hasMore = null,Object? isLoadingMore = null,}) {
  return _then(_ProductPaginationState(
products: null == products ? _self._products : products // ignore: cast_nullable_to_non_nullable
as List<ProductEntity?>,offset: null == offset ? _self.offset : offset // ignore: cast_nullable_to_non_nullable
as int,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,isLoadingMore: null == isLoadingMore ? _self.isLoadingMore : isLoadingMore // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
