import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:getinfinitybox/providers/cart_provider.dart';
import 'package:getinfinitybox/utils/colors.dart';
import 'package:getinfinitybox/utils/helper_widgets.dart';
import 'package:getinfinitybox/utils/text_styles.dart';
import 'package:getinfinitybox/widgets/cart_card.dart';

class CartScreen extends ConsumerWidget {
  static const String route = 'cart_screen';
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartList = ref.watch(cartProvider.select((value) => value.products));

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Cart",
          style: AppTextStyles.dmSans.copyWith(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: AppColors.pureBlackColor,
          ),
        ),
        centerTitle: true,
      ),
      body: cartList.isEmpty
          ? Center(
              child: Text(
                "Cart Is Empty",
                style: AppTextStyles.dmSans.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: AppColors.orange,
                ),
              ),
            )
          : ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              separatorBuilder: (context, index) => addVerticalSpace(16),
              itemBuilder: (context, index) => Card(
                borderOnForeground: true,
                clipBehavior: Clip.antiAlias,
                margin: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: CartCard(product: cartList[index]),
              ),
              itemCount: cartList.length,
            ),
      bottomNavigationBar: Container(
        height: kToolbarHeight,
        color: AppColors.orange,
        child: Padding(
          padding: const EdgeInsets.only(right: 16),
          child: Align(
            alignment: Alignment.centerRight,
            child: Text(
              "Total Price: ₹ ${cartList.fold(0.0, (sum, item) => sum + item.price).toStringAsFixed(2)}",
              style: AppTextStyles.dmSans.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: AppColors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
