import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:getinfinitybox/models/rating.dart';

part 'product.freezed.dart';
part 'product.g.dart';

@freezed
class Product with _$Product {
  const factory Product({
    required int id,
    @Default('') String title,
    @Default('') String description,
    @Default('') String category,
    @Default('') String image,
    @Default(0.0) double price,
    @Default(Rating(count: 0, rate: 0)) Rating rating,
  }) = _Product;

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
}
