// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_list_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ProductListData _$ProductListDataFromJson(Map<String, dynamic> json) {
  return _ProductListData.fromJson(json);
}

/// @nodoc
mixin _$ProductListData {
  List<String> get categories => throw _privateConstructorUsedError;
  List<Product> get products => throw _privateConstructorUsedError;
  List<Product> get searchedProducts => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductListDataCopyWith<ProductListData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductListDataCopyWith<$Res> {
  factory $ProductListDataCopyWith(
          ProductListData value, $Res Function(ProductListData) then) =
      _$ProductListDataCopyWithImpl<$Res, ProductListData>;
  @useResult
  $Res call(
      {List<String> categories,
      List<Product> products,
      List<Product> searchedProducts});
}

/// @nodoc
class _$ProductListDataCopyWithImpl<$Res, $Val extends ProductListData>
    implements $ProductListDataCopyWith<$Res> {
  _$ProductListDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categories = null,
    Object? products = null,
    Object? searchedProducts = null,
  }) {
    return _then(_value.copyWith(
      categories: null == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<String>,
      products: null == products
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as List<Product>,
      searchedProducts: null == searchedProducts
          ? _value.searchedProducts
          : searchedProducts // ignore: cast_nullable_to_non_nullable
              as List<Product>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ProductListDataCopyWith<$Res>
    implements $ProductListDataCopyWith<$Res> {
  factory _$$_ProductListDataCopyWith(
          _$_ProductListData value, $Res Function(_$_ProductListData) then) =
      __$$_ProductListDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<String> categories,
      List<Product> products,
      List<Product> searchedProducts});
}

/// @nodoc
class __$$_ProductListDataCopyWithImpl<$Res>
    extends _$ProductListDataCopyWithImpl<$Res, _$_ProductListData>
    implements _$$_ProductListDataCopyWith<$Res> {
  __$$_ProductListDataCopyWithImpl(
      _$_ProductListData _value, $Res Function(_$_ProductListData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categories = null,
    Object? products = null,
    Object? searchedProducts = null,
  }) {
    return _then(_$_ProductListData(
      categories: null == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<String>,
      products: null == products
          ? _value._products
          : products // ignore: cast_nullable_to_non_nullable
              as List<Product>,
      searchedProducts: null == searchedProducts
          ? _value._searchedProducts
          : searchedProducts // ignore: cast_nullable_to_non_nullable
              as List<Product>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ProductListData implements _ProductListData {
  const _$_ProductListData(
      {final List<String> categories = const [],
      final List<Product> products = const [],
      final List<Product> searchedProducts = const []})
      : _categories = categories,
        _products = products,
        _searchedProducts = searchedProducts;

  factory _$_ProductListData.fromJson(Map<String, dynamic> json) =>
      _$$_ProductListDataFromJson(json);

  final List<String> _categories;
  @override
  @JsonKey()
  List<String> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  final List<Product> _products;
  @override
  @JsonKey()
  List<Product> get products {
    if (_products is EqualUnmodifiableListView) return _products;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_products);
  }

  final List<Product> _searchedProducts;
  @override
  @JsonKey()
  List<Product> get searchedProducts {
    if (_searchedProducts is EqualUnmodifiableListView)
      return _searchedProducts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_searchedProducts);
  }

  @override
  String toString() {
    return 'ProductListData(categories: $categories, products: $products, searchedProducts: $searchedProducts)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProductListData &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories) &&
            const DeepCollectionEquality().equals(other._products, _products) &&
            const DeepCollectionEquality()
                .equals(other._searchedProducts, _searchedProducts));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_categories),
      const DeepCollectionEquality().hash(_products),
      const DeepCollectionEquality().hash(_searchedProducts));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProductListDataCopyWith<_$_ProductListData> get copyWith =>
      __$$_ProductListDataCopyWithImpl<_$_ProductListData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProductListDataToJson(
      this,
    );
  }
}

abstract class _ProductListData implements ProductListData {
  const factory _ProductListData(
      {final List<String> categories,
      final List<Product> products,
      final List<Product> searchedProducts}) = _$_ProductListData;

  factory _ProductListData.fromJson(Map<String, dynamic> json) =
      _$_ProductListData.fromJson;

  @override
  List<String> get categories;
  @override
  List<Product> get products;
  @override
  List<Product> get searchedProducts;
  @override
  @JsonKey(ignore: true)
  _$$_ProductListDataCopyWith<_$_ProductListData> get copyWith =>
      throw _privateConstructorUsedError;
}
