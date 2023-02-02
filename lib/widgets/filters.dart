import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:getinfinitybox/providers/products_provider.dart';
import 'package:getinfinitybox/utils/colors.dart';
import 'package:getinfinitybox/utils/helper_widgets.dart';

class Filters extends ConsumerWidget {
  const Filters({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categories =
        ref.watch(productsProvider.select((value) => value.categories));
    return SizedBox(
      height: kToolbarHeight,
      child: ListView.separated(
        separatorBuilder: (context, index) => addHorizontalSpace(18),
        itemBuilder: (context, index) => FilterChip(
          label: Text(categories[index]),
          onSelected: (value) {
            if (ref.watch(selectedCategory) == categories[index]) {
              ref.read(selectedCategory.notifier).state = "";
            } else {
              ref.read(selectedCategory.notifier).state = categories[index];
            }
            ref.read(productsProvider.notifier).callInitialApi();
          },
          selected: ref.watch(selectedCategory) == categories[index],
          showCheckmark: false,
          backgroundColor: AppColors.lightGreenColor,
          selectedColor: AppColors.greenColor,
        ),
        itemCount: categories.length,
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
      ),
    );
  }
}
