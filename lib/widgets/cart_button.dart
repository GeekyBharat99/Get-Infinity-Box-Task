import 'package:flutter/material.dart';
import 'package:getinfinitybox/screens/cart_screen.dart';
import 'package:getinfinitybox/utils/colors.dart';

class CartBUtton extends StatelessWidget {
  const CartBUtton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.pushNamed(context, CartScreen.route);
      },
      icon: const Icon(
        Icons.shopping_cart_outlined,
        color: AppColors.pureBlackColor,
      ),
    );
  }
}
