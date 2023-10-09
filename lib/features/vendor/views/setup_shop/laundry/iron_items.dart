import 'package:bubbles/features/vendor/views/setup_shop/widgets/shop_category_widgets.dart';
import 'package:bubbles/style/appColors.dart';
import 'package:bubbles/utils/svgs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IronItemsPage extends ConsumerWidget {
  const IronItemsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      //physics: const NeverScrollableScrollPhysics(),
      children: [
        SizedBox(
          height: 20.h,
        ),
        Card(
          margin: EdgeInsets.zero,
          color: AppColors.gray.withOpacity(0.2),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.r)),
          child: ShopCategoryWidget(
              title: "Apparel",
              icon: apparelsIcon,
              widget: Column(
                children: [
                  ShopItemWidget(
                      amount: "N400",
                      icon: apparelsIcon,
                      increase: () {},
                      decrease: () {},
                      title: "Tops"),
                  SizedBox(
                    height: 10.h,
                  ),
                  ShopItemWidget(
                      amount: "N400",
                      icon: apparelsIcon,
                      increase: () {},
                      decrease: () {},
                      title: "Bottoms"),
                  SizedBox(
                    height: 10.h,
                  ),
                  ShopItemWidget(
                      amount: "N400",
                      icon: apparelsIcon,
                      increase: () {},
                      decrease: () {},
                      title: "Outer wear"),
                  SizedBox(
                    height: 10.h,
                  ),
                ],
              )),
        ),
        SizedBox(
          height: 20.h,
        ),
        Card(
          margin: EdgeInsets.zero,
          color: AppColors.gray.withOpacity(0.2),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.r)),
          child: ShopCategoryWidget(
              title: "Bath Items",
              icon: bathTowelIcon,
              widget: Column(
                children: [
                  ShopItemWidget(
                      amount: "N400",
                      icon: apparelsIcon,
                      increase: () {},
                      decrease: () {},
                      title: "Tops"),
                  SizedBox(
                    height: 10.h,
                  ),
                  ShopItemWidget(
                      amount: "N400",
                      icon: apparelsIcon,
                      increase: () {},
                      decrease: () {},
                      title: "Bottoms"),
                  SizedBox(
                    height: 10.h,
                  ),
                  ShopItemWidget(
                      amount: "N400",
                      icon: apparelsIcon,
                      increase: () {},
                      decrease: () {},
                      title: "Outer wear"),
                  SizedBox(
                    height: 10.h,
                  ),
                ],
              )),
        ),
        SizedBox(
          height: 20.h,
        ),
        Card(
          margin: EdgeInsets.zero,
          color: AppColors.gray.withOpacity(0.2),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.r)),
          child: ShopCategoryWidget(
              title: "Bed Items",
              icon: bedIcon,
              widget: Column(
                children: [
                  ShopItemWidget(
                      amount: "N400",
                      icon: apparelsIcon,
                      increase: () {},
                      decrease: () {},
                      title: "Tops"),
                  SizedBox(
                    height: 10.h,
                  ),
                  ShopItemWidget(
                      amount: "N400",
                      icon: apparelsIcon,
                      increase: () {},
                      decrease: () {},
                      title: "Bottoms"),
                  SizedBox(
                    height: 10.h,
                  ),
                  ShopItemWidget(
                      amount: "N400",
                      icon: apparelsIcon,
                      increase: () {},
                      decrease: () {},
                      title: "Outer wear"),
                  SizedBox(
                    height: 10.h,
                  ),
                ],
              )),
        ),
        SizedBox(
          height: 20.h,
        ),
        Card(
          margin: EdgeInsets.zero,
          color: AppColors.gray.withOpacity(0.2),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.r)),
          child: ShopCategoryWidget(
              title: "Foot wear",
              icon: footWearIcon,
              widget: Column(
                children: [
                  ShopItemWidget(
                      amount: "N400",
                      icon: apparelsIcon,
                      increase: () {},
                      decrease: () {},
                      title: "Tops"),
                  SizedBox(
                    height: 10.h,
                  ),
                  ShopItemWidget(
                      amount: "N400",
                      icon: apparelsIcon,
                      increase: () {},
                      decrease: () {},
                      title: "Bottoms"),
                  SizedBox(
                    height: 10.h,
                  ),
                  ShopItemWidget(
                      amount: "N400",
                      icon: apparelsIcon,
                      increase: () {},
                      decrease: () {},
                      title: "Outer wear"),
                  SizedBox(
                    height: 10.h,
                  ),
                ],
              )),
        ),
      ],
    );
  }
}
