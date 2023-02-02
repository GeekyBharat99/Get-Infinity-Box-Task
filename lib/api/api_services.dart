import 'package:getinfinitybox/models/product.dart';
import 'api_client.dart';

class ApiService {
  static final ApiService _singleton = ApiService._internal();

  factory ApiService() {
    return _singleton;
  }

  late ApiClient apiClient;

  ApiService._internal() {
    apiClient = ApiClient();
  }

  Future<List<Product>?> getProducts({
    required bool isCategoryFilter,
    required String category,
  }) {
    return apiClient.get(
      isCategoryFilter ? '/products/category/$category' : '/products?limit=10',
      parser: (data) {
        if (data == null) {
          return null;
        }
        return (data as List)
            .map((itemData) => Product.fromJson(itemData))
            .toList();
      },
      headers: {},
    );
  }

  Future<List<String>?> getCategories() {
    return apiClient.get(
      '/products/categories',
      parser: (data) {
        if (data == null) {
          return null;
        }
        final List<String> result = [];
        for (var element in data) {
          result.add(element.toString());
        }
        return result;
      },
      headers: {},
    );
  }

  Future<dynamic> login({
    required String username,
    required String password,
  }) {
    return apiClient.post(
      '/auth/login',
      data: {'username': username, 'password': password},
      parser: (data) {
        if (data == null) {
          return null;
        }
        return data;
      },
      headers: {},
    );
  }
}
