// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Product {

@JsonKey(name: "id") int? get id;@JsonKey(name: "title") String? get title;@JsonKey(name: "description") String? get description;@JsonKey(name: "category") String? get category;@JsonKey(name: "price") double? get price;@JsonKey(name: "discountPercentage") double? get discountPercentage;@JsonKey(name: "rating") double? get rating;@JsonKey(name: "stock") int? get stock;@JsonKey(name: "tags") List<String>? get tags;@JsonKey(name: "brand") String? get brand;@JsonKey(name: "thumbnail") List<String>? get images;
/// Create a copy of Product
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductCopyWith<Product> get copyWith => _$ProductCopyWithImpl<Product>(this as Product, _$identity);

  /// Serializes this Product to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Product&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.category, category) || other.category == category)&&(identical(other.price, price) || other.price == price)&&(identical(other.discountPercentage, discountPercentage) || other.discountPercentage == discountPercentage)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.stock, stock) || other.stock == stock)&&const DeepCollectionEquality().equals(other.tags, tags)&&(identical(other.brand, brand) || other.brand == brand)&&const DeepCollectionEquality().equals(other.images, images));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,description,category,price,discountPercentage,rating,stock,const DeepCollectionEquality().hash(tags),brand,const DeepCollectionEquality().hash(images));

@override
String toString() {
  return 'Product(id: $id, title: $title, description: $description, category: $category, price: $price, discountPercentage: $discountPercentage, rating: $rating, stock: $stock, tags: $tags, brand: $brand, images: $images)';
}


}

/// @nodoc
abstract mixin class $ProductCopyWith<$Res>  {
  factory $ProductCopyWith(Product value, $Res Function(Product) _then) = _$ProductCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "id") int? id,@JsonKey(name: "title") String? title,@JsonKey(name: "description") String? description,@JsonKey(name: "category") String? category,@JsonKey(name: "price") double? price,@JsonKey(name: "discountPercentage") double? discountPercentage,@JsonKey(name: "rating") double? rating,@JsonKey(name: "stock") int? stock,@JsonKey(name: "tags") List<String>? tags,@JsonKey(name: "brand") String? brand,@JsonKey(name: "thumbnail") List<String>? images
});




}
/// @nodoc
class _$ProductCopyWithImpl<$Res>
    implements $ProductCopyWith<$Res> {
  _$ProductCopyWithImpl(this._self, this._then);

  final Product _self;
  final $Res Function(Product) _then;

/// Create a copy of Product
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? title = freezed,Object? description = freezed,Object? category = freezed,Object? price = freezed,Object? discountPercentage = freezed,Object? rating = freezed,Object? stock = freezed,Object? tags = freezed,Object? brand = freezed,Object? images = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String?,price: freezed == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double?,discountPercentage: freezed == discountPercentage ? _self.discountPercentage : discountPercentage // ignore: cast_nullable_to_non_nullable
as double?,rating: freezed == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double?,stock: freezed == stock ? _self.stock : stock // ignore: cast_nullable_to_non_nullable
as int?,tags: freezed == tags ? _self.tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>?,brand: freezed == brand ? _self.brand : brand // ignore: cast_nullable_to_non_nullable
as String?,images: freezed == images ? _self.images : images // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}

}


/// Adds pattern-matching-related methods to [Product].
extension ProductPatterns on Product {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Product value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Product() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Product value)  $default,){
final _that = this;
switch (_that) {
case _Product():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Product value)?  $default,){
final _that = this;
switch (_that) {
case _Product() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "id")  int? id, @JsonKey(name: "title")  String? title, @JsonKey(name: "description")  String? description, @JsonKey(name: "category")  String? category, @JsonKey(name: "price")  double? price, @JsonKey(name: "discountPercentage")  double? discountPercentage, @JsonKey(name: "rating")  double? rating, @JsonKey(name: "stock")  int? stock, @JsonKey(name: "tags")  List<String>? tags, @JsonKey(name: "brand")  String? brand, @JsonKey(name: "thumbnail")  List<String>? images)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Product() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.category,_that.price,_that.discountPercentage,_that.rating,_that.stock,_that.tags,_that.brand,_that.images);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "id")  int? id, @JsonKey(name: "title")  String? title, @JsonKey(name: "description")  String? description, @JsonKey(name: "category")  String? category, @JsonKey(name: "price")  double? price, @JsonKey(name: "discountPercentage")  double? discountPercentage, @JsonKey(name: "rating")  double? rating, @JsonKey(name: "stock")  int? stock, @JsonKey(name: "tags")  List<String>? tags, @JsonKey(name: "brand")  String? brand, @JsonKey(name: "thumbnail")  List<String>? images)  $default,) {final _that = this;
switch (_that) {
case _Product():
return $default(_that.id,_that.title,_that.description,_that.category,_that.price,_that.discountPercentage,_that.rating,_that.stock,_that.tags,_that.brand,_that.images);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "id")  int? id, @JsonKey(name: "title")  String? title, @JsonKey(name: "description")  String? description, @JsonKey(name: "category")  String? category, @JsonKey(name: "price")  double? price, @JsonKey(name: "discountPercentage")  double? discountPercentage, @JsonKey(name: "rating")  double? rating, @JsonKey(name: "stock")  int? stock, @JsonKey(name: "tags")  List<String>? tags, @JsonKey(name: "brand")  String? brand, @JsonKey(name: "thumbnail")  List<String>? images)?  $default,) {final _that = this;
switch (_that) {
case _Product() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.category,_that.price,_that.discountPercentage,_that.rating,_that.stock,_that.tags,_that.brand,_that.images);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Product implements Product {
  const _Product({@JsonKey(name: "id") this.id, @JsonKey(name: "title") this.title, @JsonKey(name: "description") this.description, @JsonKey(name: "category") this.category, @JsonKey(name: "price") this.price, @JsonKey(name: "discountPercentage") this.discountPercentage, @JsonKey(name: "rating") this.rating, @JsonKey(name: "stock") this.stock, @JsonKey(name: "tags") final  List<String>? tags, @JsonKey(name: "brand") this.brand, @JsonKey(name: "thumbnail") final  List<String>? images}): _tags = tags,_images = images;
  factory _Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);

@override@JsonKey(name: "id") final  int? id;
@override@JsonKey(name: "title") final  String? title;
@override@JsonKey(name: "description") final  String? description;
@override@JsonKey(name: "category") final  String? category;
@override@JsonKey(name: "price") final  double? price;
@override@JsonKey(name: "discountPercentage") final  double? discountPercentage;
@override@JsonKey(name: "rating") final  double? rating;
@override@JsonKey(name: "stock") final  int? stock;
 final  List<String>? _tags;
@override@JsonKey(name: "tags") List<String>? get tags {
  final value = _tags;
  if (value == null) return null;
  if (_tags is EqualUnmodifiableListView) return _tags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override@JsonKey(name: "brand") final  String? brand;
 final  List<String>? _images;
@override@JsonKey(name: "thumbnail") List<String>? get images {
  final value = _images;
  if (value == null) return null;
  if (_images is EqualUnmodifiableListView) return _images;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of Product
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductCopyWith<_Product> get copyWith => __$ProductCopyWithImpl<_Product>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProductToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Product&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.category, category) || other.category == category)&&(identical(other.price, price) || other.price == price)&&(identical(other.discountPercentage, discountPercentage) || other.discountPercentage == discountPercentage)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.stock, stock) || other.stock == stock)&&const DeepCollectionEquality().equals(other._tags, _tags)&&(identical(other.brand, brand) || other.brand == brand)&&const DeepCollectionEquality().equals(other._images, _images));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,description,category,price,discountPercentage,rating,stock,const DeepCollectionEquality().hash(_tags),brand,const DeepCollectionEquality().hash(_images));

@override
String toString() {
  return 'Product(id: $id, title: $title, description: $description, category: $category, price: $price, discountPercentage: $discountPercentage, rating: $rating, stock: $stock, tags: $tags, brand: $brand, images: $images)';
}


}

/// @nodoc
abstract mixin class _$ProductCopyWith<$Res> implements $ProductCopyWith<$Res> {
  factory _$ProductCopyWith(_Product value, $Res Function(_Product) _then) = __$ProductCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "id") int? id,@JsonKey(name: "title") String? title,@JsonKey(name: "description") String? description,@JsonKey(name: "category") String? category,@JsonKey(name: "price") double? price,@JsonKey(name: "discountPercentage") double? discountPercentage,@JsonKey(name: "rating") double? rating,@JsonKey(name: "stock") int? stock,@JsonKey(name: "tags") List<String>? tags,@JsonKey(name: "brand") String? brand,@JsonKey(name: "thumbnail") List<String>? images
});




}
/// @nodoc
class __$ProductCopyWithImpl<$Res>
    implements _$ProductCopyWith<$Res> {
  __$ProductCopyWithImpl(this._self, this._then);

  final _Product _self;
  final $Res Function(_Product) _then;

/// Create a copy of Product
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? title = freezed,Object? description = freezed,Object? category = freezed,Object? price = freezed,Object? discountPercentage = freezed,Object? rating = freezed,Object? stock = freezed,Object? tags = freezed,Object? brand = freezed,Object? images = freezed,}) {
  return _then(_Product(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String?,price: freezed == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double?,discountPercentage: freezed == discountPercentage ? _self.discountPercentage : discountPercentage // ignore: cast_nullable_to_non_nullable
as double?,rating: freezed == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double?,stock: freezed == stock ? _self.stock : stock // ignore: cast_nullable_to_non_nullable
as int?,tags: freezed == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>?,brand: freezed == brand ? _self.brand : brand // ignore: cast_nullable_to_non_nullable
as String?,images: freezed == images ? _self._images : images // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}


}

// dart format on
