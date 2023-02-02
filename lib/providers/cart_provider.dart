import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getinfinitybox/models/cart.dart';
import 'package:getinfinitybox/models/product.dart';

final cartProvider = StateNotifierProvider<CartNotifier, Cart>((ref) {
  return CartNotifier();
});

class CartNotifier extends StateNotifier<Cart> {
  CartNotifier()
      : super(GetStorage().read('username') != null
            ? Cart.fromJson(
                GetStorage().read('cart_${GetStorage().read('username')}'))
            : const Cart(username: "", token: ""));

  void addToCart({
    required Product product,
  }) {
    state = state.copyWith(products: [...state.products, product]);

    GetStorage().write('cart_${state.username}', state.toJson());
  }

  void removeFromCart({
    required Product product,
  }) {
    List<Product> updatedList = [...state.products];
    updatedList.removeWhere((element) => element.id == product.id);

    state = state.copyWith(products: updatedList);

    GetStorage().write('cart_${state.username}', state.toJson());
  }
}
