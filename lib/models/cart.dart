import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:getinfinitybox/models/product.dart';

part 'cart.freezed.dart';
part 'cart.g.dart';

@freezed
class Cart with _$Cart {
  const factory Cart({
    required String username,
    required String token,
    @Default([]) List<Product> products,
  }) = _Cart;

  factory Cart.fromJson(Map<String, dynamic> json) => _$CartFromJson(json);
}
