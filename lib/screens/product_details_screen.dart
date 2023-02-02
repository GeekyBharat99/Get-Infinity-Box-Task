import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:getinfinitybox/models/product.dart';
import 'package:getinfinitybox/providers/cart_provider.dart';
import 'package:getinfinitybox/utils/colors.dart';
import 'package:getinfinitybox/utils/helper_widgets.dart';
import 'package:getinfinitybox/utils/text_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getinfinitybox/widgets/cart_button.dart';

class ProductDetailsScreen extends ConsumerWidget {
  static const String route = 'product_details_screen';
  final Product product;

  const ProductDetailsScreen({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartList = ref.watch(cartProvider.select((value) => value.products));
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Product Details",
          style: AppTextStyles.dmSans.copyWith(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: AppColors.pureBlackColor,
          ),
        ),
        centerTitle: true,
        actions: const [
          CartBUtton(),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 25.r),
        children: [
          addVerticalSpace(27.h),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: CachedNetworkImage(
                height: 232.h,
                width: 236.h,
                imageUrl: product.image,
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                placeholder: (context, url) => Image.asset(
                  "assets/cupertino_activity_indicator.gif",
                  height: 232.h,
                  width: 236.h,
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
          ),
          addVerticalSpace(50.h),
          Text(
            product.title,
            style: AppTextStyles.dmSans.copyWith(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: AppColors.navyBlackColor,
            ),
          ),
          addVerticalSpace(10.h),
          Text(
            "₹ ${product.price}",
            style: AppTextStyles.dmSans.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: AppColors.orange,
            ),
          ),
          addVerticalSpace(10.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.star_rate_rounded,
                    size: 14,
                    color: AppColors.yellowColor,
                  ),
                  addHorizontalSpace(4),
                  Text(
                    product.rating.rate.toString(),
                    style: AppTextStyles.dmSans.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AppColors.navyBlackColor),
                  ),
                  addHorizontalSpace(10),
                  Text(
                    "${product.rating.count} Reviews",
                    style: AppTextStyles.dmSans.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColors.navyBlackColor,
                    ),
                  ),
                ],
              ),
              Container(
                height: 20,
                width: 100,
                decoration: BoxDecoration(
                  color: AppColors.lightGreenColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  product.category.toUpperCase(),
                  textAlign: TextAlign.center,
                  style: AppTextStyles.dmSans.copyWith(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: AppColors.greenColor,
                  ),
                ),
              ),
            ],
          ),
          addVerticalSpace(30.h),
          Text(
            "Product Description",
            style: AppTextStyles.dmSans.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: AppColors.navyBlackColor,
            ),
          ),
          addVerticalSpace(15.h),
          Text(
            product.description,
            style: AppTextStyles.dmSans.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: AppColors.navyBlackColor,
            ),
          ),
          addVerticalSpace(100.h),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          if (!cartList.contains(product)) {
            ref.read(cartProvider.notifier).addToCart(product: product);
          } else {
            customToast(text: "Already in Cart", isLong: false);
          }
        },
        backgroundColor: AppColors.orange,
        icon: const Icon(
          Icons.shopping_cart_outlined,
        ),
        label: Text(
          cartList.contains(product) ? "Added To Cart" : "Add to cart",
          style: AppTextStyles.dmSans.copyWith(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
