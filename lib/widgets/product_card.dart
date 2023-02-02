import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:getinfinitybox/models/product.dart';
import 'package:getinfinitybox/utils/colors.dart';
import 'package:getinfinitybox/utils/helper_widgets.dart';
import 'package:getinfinitybox/utils/text_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.zero,
      borderOnForeground: true,
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          addVerticalSpace(15.h),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: CachedNetworkImage(
                height: 120,
                width: 120,
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
                  height: 120.0,
                  width: 120.0,
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
          ),
          addVerticalSpace(12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: Text(
              product.title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.dmSans.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: AppColors.navyBlackColor,
              ),
            ),
          ),
          addVerticalSpace(5),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: Text(
              "₹ ${product.price}",
              style: AppTextStyles.dmSans.copyWith(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                color: AppColors.orange,
              ),
            ),
          ),
          addVerticalSpace(10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: Row(
              children: [
                const Icon(
                  Icons.star_rate_rounded,
                  size: 12,
                  color: AppColors.yellowColor,
                ),
                addHorizontalSpace(4),
                Text(
                  product.rating.rate.toString(),
                  style: AppTextStyles.dmSans.copyWith(
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                      color: AppColors.navyBlackColor),
                ),
                addHorizontalSpace(10),
                Text(
                  "${product.rating.count} Reviews",
                  style: AppTextStyles.dmSans.copyWith(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: AppColors.navyBlackColor,
                  ),
                )
              ],
            ),
          ),
          addVerticalSpace(10),
        ],
      ),
    );
  }
}
