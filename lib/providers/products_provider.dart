import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:getinfinitybox/api/api_services.dart';
import 'package:getinfinitybox/models/product.dart';
import 'package:getinfinitybox/models/product_list_data.dart';
import 'package:getinfinitybox/utils/helper_widgets.dart';

final selectedCategory = StateProvider.autoDispose<String>((ref) => "");

final productsProvider =
    StateNotifierProvider.autoDispose<ProductNotifier, ProductListData>((ref) {
  return ProductNotifier(ref);
});

class ProductNotifier extends StateNotifier<ProductListData> {
  ProductNotifier(AutoDisposeStateNotifierProviderRef incomingRef)
      : super(const ProductListData()) {
    ref = incomingRef;
  }

  late AutoDisposeStateNotifierProviderRef ref;

  Future<void> callInitialApi() async {
    List<Product>? result;
    loading(value: true);
    result = await ApiService()
        .getProducts(
          isCategoryFilter:
              ref.read(selectedCategory.notifier).state.isNotEmpty,
          category: ref.read(selectedCategory.notifier).state,
        )
        .then((value) => value)
        .catchError((onError) {
      debugPrint('error while calling get Products api $onError');
      return null;
    });

    if (result == null) {
      customToast(text: "Something went Wrong.", isLong: true);
      loading(value: false);
      return;
    }

    state = state.copyWith(
      products: result,
      searchedProducts: result,
    );
    loading(value: false);
  }

  Future<void> getCategories() async {
    List<String>? result;

    result = await ApiService()
        .getCategories()
        .then((value) => value)
        .catchError((onError) {
      debugPrint('error while calling get categories api $onError');
      return null;
    });

    if (result == null) {
      customToast(text: "Something went Wrong.", isLong: true);

      return;
    }

    state = state.copyWith(categories: result);
  }

  void search({required String query}) {
    state = state.copyWith(
      searchedProducts: state.products.where((element) {
        final title = element.title.toLowerCase();
        final input = query.toLowerCase();
        return title.contains(input);
      }).toList(),
    );
  }
}
