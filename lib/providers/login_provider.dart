import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getinfinitybox/api/api_services.dart';
import 'package:getinfinitybox/models/cart.dart';
import 'package:getinfinitybox/providers/cart_provider.dart';
import 'package:getinfinitybox/utils/helper_widgets.dart';

final loginProvider = StateNotifierProvider<LoginNotifier, Cart>((ref) {
  return LoginNotifier(ref);
});

class LoginNotifier extends StateNotifier<Cart> {
  LoginNotifier(StateNotifierProviderRef incomingRef)
      : super(const Cart(token: "", username: "")) {
    ref = incomingRef;
  }

  late StateNotifierProviderRef ref;

  Future<bool> login({
    required String username,
    required String password,
  }) async {
    dynamic result;
    loading(value: true);
    result = await ApiService()
        .login(username: username, password: password)
        .then((value) => value)
        .catchError((onError) {
      debugPrint('error while calling login api $onError');
      if (onError.toString().contains("[401]")) {
        return "Not a User";
      }
      return null;
    });

    if (result == null) {
      customToast(text: "Something went Wrong.", isLong: true);
      loading(value: false);
      return false;
    }

    if (result.toString().contains("token")) {
      result = result["token"];
    } else {
      customToast(text: result, isLong: true);
      loading(value: false);
      return false;
    }

    state = state.copyWith(
      token: result,
      username: username,
    );
    if (GetStorage().read('cart_$username') != null) {
      state = state.copyWith(
          products:
              Cart.fromJson(GetStorage().read('cart_$username')).products);
      ref.read(cartProvider.notifier).state = state;
    } else {
      ref.read(cartProvider.notifier).state = state;

      GetStorage().write('cart_$username', state.toJson());
      GetStorage().write('username', username);
    }

    loading(value: false);

    return true;
  }

  void logout() {
    GetStorage().remove('username');
  }
}
