import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getinfinitybox/models/product.dart';
import 'package:getinfinitybox/providers/cart_provider.dart';
import 'package:getinfinitybox/utils/colors.dart';
import 'package:getinfinitybox/utils/helper_widgets.dart';
import 'package:getinfinitybox/utils/text_styles.dart';

class CartCard extends ConsumerWidget {
  final Product product;
  const CartCard({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          Row(
            children: [
              CachedNetworkImage(
                height: 100.h,
                width: 100.h,
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
                  height: 100.h,
                  width: 100.h,
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
              addHorizontalSpace(20.w),
              Expanded(
                child: Text(
                  product.title,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.dmSans.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: AppColors.navyBlackColor,
                  ),
                ),
              ),
            ],
          ),
          addVerticalSpace(12.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "₹ ${product.price}",
                style: AppTextStyles.dmSans.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: AppColors.orange,
                ),
              ),
              TextButton(
                onPressed: () {
                  ref
                      .read(cartProvider.notifier)
                      .removeFromCart(product: product);
                },
                style: TextButton.styleFrom(
                  backgroundColor: AppColors.orange,
                ),
                child: Text(
                  "Remove From Cart",
                  style: AppTextStyles.dmSans.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: AppColors.white,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
