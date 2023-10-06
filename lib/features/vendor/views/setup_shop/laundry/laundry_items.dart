import 'package:bubbles/features/vendor/providers/shop_service_providers.dart';
import 'package:bubbles/features/vendor/views/setup_shop/laundry/dryclean_items.dart';
import 'package:bubbles/features/vendor/views/setup_shop/laundry/iron_items.dart';
import 'package:bubbles/features/vendor/views/setup_shop/laundry/self_wash_items.dart';
import 'package:bubbles/features/vendor/views/setup_shop/laundry/wash_items.dart';
import 'package:bubbles/features/vendor/views/setup_shop/widgets/multi_card_option_widget.dart';
import 'package:bubbles/style/appColors.dart';
import 'package:bubbles/utils/constvalues.dart';
import 'package:bubbles/utils/logger.dart';
import 'package:bubbles/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final categoryItemProvider = StateProvider.autoDispose<int>((ref) => 0);

final categoryListItems = ["Wash", "Dry clean", "Iron", "Self wash"];

final showCategoryProvider = StateProvider.autoDispose<bool>((ref) => false);

class LaundryItemsPage extends ConsumerWidget {
  const LaundryItemsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<String> laundryList = ref.watch(shopViewModelProvider).laundryTypeList;
    var shopService = ref.read(shopViewModelProvider.notifier);

    List laundryTypes = shopService.laundryItems();

    // Show Category
    var showCategoryValue = ref.watch(showCategoryProvider);
    var changeShowValueState = ref.read(showCategoryProvider.notifier);

    // Category Items

    var categoryState = ref.watch(categoryItemProvider);
    var changeCatState = ref.read(categoryItemProvider.notifier);
    return Scaffold(
      body: ListView(
          padding:
              const EdgeInsets.symmetric(horizontal: generalHorizontalPadding),
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          children: [
            SizedBox(
              height: 5.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Items categories',
                  textAlign: TextAlign.start,
                  style: Theme.of(context)
                      .primaryTextTheme
                      .headlineMedium
                      ?.copyWith(fontSize: 16.sp, fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 5.h),
                  child: Row(
                    children: [
                      Checkbox(
                          checkColor: AppColors.white,
                          activeColor: AppColors.secondary,
                          side: MaterialStateBorderSide.resolveWith((states) {
                            return const BorderSide(color: AppColors.secondary);
                          }),
                          value: shopService.selectAll,
                          onChanged: (val) {
                            shopService.toggleAllLaundryType();
                          }),
                      Text(
                        shopService.selectAll ? 'De-select all' : 'Select All',
                        textAlign: TextAlign.start,
                        style: Theme.of(context)
                            .primaryTextTheme
                            .headlineMedium
                            ?.copyWith(
                                fontSize: 13.sp, fontWeight: FontWeight.w300),
                      ),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            Wrap(
              direction: Axis.horizontal,
              spacing: 10,
              runSpacing: 9,
              children: List.generate(laundryTypes.length, (index) {
                String name = laundryTypes[index]['item'];
                String icon = laundryTypes[index]['icon'];
                return MultiCardOptionWidget(
                  isSelected: laundryList.contains(name),
                  onTap: () {
                    if (laundryList.contains(name)) {
                      AppLogger.logg("removed");
                      shopService.removeLaundryType(name);
                    } else {
                      AppLogger.logg("added");
                      shopService.addLaundryType(name);
                    }
                  },
                  icon: icon,
                  title: name,
                );
              }),
            ),
            SizedBox(
              height: 20.h,
            ),
            switch (showCategoryValue) {
              false => ActionCustomButton(
                  disabeled: laundryList.length <= 2 == true ? true : false,
                  btnColor: AppColors.primary,
                  title: "Next",
                  isLoading: false,
                  onclick: () async {
                    changeShowValueState.state = true;
                  }),
              true => Column(
                  children: [
                    Card(
                      margin: EdgeInsets.zero,
                      color: AppColors.gray.withOpacity(0.2),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.r)),
                      child: Padding(
                        padding: EdgeInsets.all(5.0.w),
                        child: Row(
                            children: List.generate(
                                categoryListItems.length,
                                (index) => Padding(
                                      padding: const EdgeInsets.only(left: 0),
                                      child: CategoryItemBox(
                                          onTap: () {
                                            changeCatState.state = index;
                                          },
                                          title: categoryListItems[index],
                                          isActive: categoryState == index),
                                    ))),
                      ),
                    ),
                    switch (categoryState) {
                      0 => const WashItemsPage(),
                      1 => const DryCleanItemsPage(),
                      2 => const IronItemsPage(),
                      _ => const SelfWashItemPage()
                    },
                    SizedBox(
                      height: 20.h,
                    ),
                    ActionCustomButton(
                        btnColor: AppColors.primary,
                        title: "Next",
                        isLoading: false,
                        onclick: () async {
                          shopService.changeSetup(val: 2);
                        }),
                  ],
                )
            },
            SizedBox(
              height: 20.h,
            ),
          ]),
    );
  }
}

class CategoryItemBox extends ConsumerWidget {
  final String title;
  final bool isActive;
  final Function onTap;
  const CategoryItemBox(
      {required this.title,
      required this.isActive,
      required this.onTap,
      super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Container(
        decoration: BoxDecoration(
            color: isActive ? AppColors.white : Colors.transparent,
            borderRadius: BorderRadius.circular(10.r)),
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 10.w),
            child: Text(
              title,
              style: Theme.of(context)
                  .primaryTextTheme
                  .headlineMedium!
                  .copyWith(fontSize: 10.5.sp, fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ),
    );
  }
}
