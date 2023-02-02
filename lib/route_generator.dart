import 'package:flutter/material.dart';
import 'package:getinfinitybox/models/product.dart';
import 'package:getinfinitybox/screens/cart_screen.dart';
import 'package:getinfinitybox/screens/login_screen.dart';
import 'package:getinfinitybox/screens/product_details_screen.dart';
import 'package:getinfinitybox/screens/product_list_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case LoginScreen.route:
        return MaterialPageRoute(
          builder: (_) => LoginScreen(),
        );
      case ProductsListScreen.route:
        return MaterialPageRoute(
          builder: (_) => const ProductsListScreen(),
        );
      case CartScreen.route:
        return MaterialPageRoute(
          builder: (_) => const CartScreen(),
        );
      case ProductDetailsScreen.route:
        return MaterialPageRoute(
          builder: (_) => ProductDetailsScreen(product: args as Product),
        );

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Not Found'),
          ),
          body: const Center(
            child: Text('Not Found'),
          ),
        );
      },
    );
  }
}
