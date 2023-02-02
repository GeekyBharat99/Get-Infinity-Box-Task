import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:getinfinitybox/providers/products_provider.dart';
import 'package:getinfinitybox/screens/product_details_screen.dart';
import 'package:getinfinitybox/utils/custom_grid_delegate.dart';
import 'package:getinfinitybox/widgets/cart_button.dart';
import 'package:getinfinitybox/widgets/filters.dart';
import 'package:getinfinitybox/widgets/logout_button.dart';
import 'package:getinfinitybox/widgets/product_card.dart';
import 'package:getinfinitybox/widgets/searchbar.dart';

class ProductsListScreen extends ConsumerStatefulWidget {
  static const String route = 'product_list_screen';
  const ProductsListScreen({super.key});

  @override
  ConsumerState createState() => _ProductsListScreenState();
}

class _ProductsListScreenState extends ConsumerState<ProductsListScreen> {
  ScrollController? _scrollViewController;
  @override
  void initState() {
    ref.read(productsProvider.notifier).callInitialApi();
    ref.read(productsProvider.notifier).getCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final productsList =
        ref.watch(productsProvider.select((value) => value.searchedProducts));

    return Scaffold(
      appBar: AppBar(
        title: const SearchBar(),
        actions: const [
          CartBUtton(),
          LogoutButton(),
        ],
      ),
      body: NestedScrollView(
        controller: _scrollViewController,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              automaticallyImplyLeading: false,
              title: const Filters(),
              titleSpacing: 0.0,
              elevation: 0.0,
              floating: true,
              centerTitle: true,
              forceElevated: innerBoxIsScrolled,
            ),
          ];
        },
        floatHeaderSlivers: true,
        body: GridView.builder(
          padding: const EdgeInsets.only(
            left: 16,
            right: 16,
            top: 8,
            bottom: 16,
          ),
          itemBuilder: (context, index) => InkWell(
            onTap: () => Navigator.pushNamed(
              context,
              ProductDetailsScreen.route,
              arguments: productsList[index],
            ),
            child: ProductCard(
              product: productsList[index],
            ),
          ),
          itemCount: productsList.length,
          gridDelegate:
              const SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 20,
            height: 245,
          ),
        ),
      ),
    );
  }
}
