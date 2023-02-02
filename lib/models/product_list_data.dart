import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:getinfinitybox/models/product.dart';

part 'product_list_data.freezed.dart';
part 'product_list_data.g.dart';

@freezed
class ProductListData with _$ProductListData {
  const factory ProductListData({
    @Default([]) List<String> categories,
    @Default([]) List<Product> products,
    @Default([]) List<Product> searchedProducts,
  }) = _ProductListData;

  factory ProductListData.fromJson(Map<String, dynamic> json) =>
      _$ProductListDataFromJson(json);
}
