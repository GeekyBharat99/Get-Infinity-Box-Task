// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_list_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProductListData _$$_ProductListDataFromJson(Map<String, dynamic> json) =>
    _$_ProductListData(
      categories: (json['categories'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      products: (json['products'] as List<dynamic>?)
              ?.map((e) => Product.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      searchedProducts: (json['searchedProducts'] as List<dynamic>?)
              ?.map((e) => Product.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_ProductListDataToJson(_$_ProductListData instance) =>
    <String, dynamic>{
      'categories': instance.categories,
      'products': instance.products,
      'searchedProducts': instance.searchedProducts,
    };
