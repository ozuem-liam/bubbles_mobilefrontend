import 'package:bubbles/features/vendor/providers/shop_service_providers.dart';
import 'package:bubbles/features/vendor/views/setup_shop/laundry/dryclean_items.dart';
import 'package:bubbles/features/vendor/views/setup_shop/laundry/iron_items.dart';
import 'package:bubbles/features/vendor/views/setup_shop/laundry/self_wash_items.dart';
import 'package:bubbles/features/vendor/views/setup_shop/laundry/wash_items.dart';
import 'package:bubbles/features/vendor/views/setup_shop/widgets/multi_card_option_widget.dart';
import 'package:bubbles/features/vendor/views/setup_shop/widgets/shop_category_widgets.dart';
import 'package:bubbles/style/appColors.dart';
import 'package:bubbles/utils/constvalues.dart';
import 'package:bubbles/utils/logger.dart';
import 'package:bubbles/utils/svgs.dart';
import 'package:bubbles/widgets/custom_button.dart';
import 'package:bubbles/widgets/image_widgets.dart';
import 'package:bubbles/widgets/single_text_line_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final categoryItemProvider = StateProvider.autoDispose<int>((ref) => 0);

final categoryListItems = ["Wash", "Dry clean", "Iron", "Self wash"];

class LaundryItemsPage extends ConsumerWidget {
  const LaundryItemsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<String> laundryList = ref.watch(shopViewModelProvider).laundryTypeList;
    var shopService = ref.read(shopViewModelProvider.notifier);

    List laundryTypes = shopService.laundryItems();

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
              height: 10.h,
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
                Row(
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
            // Wrap(
            //     // physics: const NeverScrollableScrollPhysics(),
            //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            //         crossAxisCount: 3,
            //         crossAxisSpacing: 10.w,
            //         childAspectRatio: 2.8,
            //         mainAxisSpacing: 10.w),
            //     // shrinkWrap: true,
            //     // itemCount: laundryTypes.length,
            //     itemBuilder: (context, index) {
            //       return MultiCardOptionWidget(
            //         isSelected:
            //             laundryList.contains(laundryTypes[index]['item']),
            //         onTap: () {
            //           if (laundryList.contains(laundryTypes[index]['item'])) {
            //             AppLogger.logg("removed");
            //             shopService.removeService(laundryTypes[index]['item']);
            //           } else {
            //             AppLogger.logg("added");
            //             shopService.addService(laundryTypes[index]['item']);
            //           }
            //         },
            //         icon: laundryTypes[index]['icon'],
            //         title: laundryTypes[index]['item'],
            //       );
            //     }),

            SizedBox(
              height: 20.h,
            ),

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

            SizedBox(
              height: 0.h,
            ),
            switch (categoryState) {
              0 => const WashItemsPage(),
              1 => DryCleanItemsPage(),
              2 => IronItemsPage(),
              _ => SelfWashItemPage()
            },
            SizedBox(
              height: 20.h,
            ),

            // DefaultTabController(
            //   length: 4,
            //   child: Column(
            //     children: [
            //       Card(
            //         margin: EdgeInsets.zero,
            //         color: AppColors.gray.withOpacity(0.2),
            //         shape: RoundedRectangleBorder(
            //             borderRadius: BorderRadius.circular(10.r)),
            //         child: TabBar(
            //           padding: EdgeInsets.all(5.w),
            //           indicator: BoxDecoration(
            //               color: AppColors.white,
            //               borderRadius: BorderRadius.circular(10.r)),
            //           indicatorColor: Colors.transparent,
            //           labelColor: AppColors.black,
            //           unselectedLabelColor: AppColors.black,
            //           unselectedLabelStyle: TextStyle(fontSize: 12.sp),
            //           labelStyle: TextStyle(fontSize: 12.sp),
            //           tabs: [
            //             Padding(
            //               padding: EdgeInsets.all(10.0.w),
            //               child: Text(
            //                 "Wash",
            //                 style: Theme.of(context)
            //                     .primaryTextTheme
            //                     .headlineMedium!
            //                     .copyWith(fontSize: 12.sp),
            //               ),
            //             ),
            //             Text(
            //               "Dry clean",
            //               style: Theme.of(context)
            //                   .primaryTextTheme
            //                   .headlineMedium!
            //                   .copyWith(fontSize: 12.sp),
            //             ),
            //             Text(
            //               "Iron",
            //               style: Theme.of(context)
            //                   .primaryTextTheme
            //                   .headlineMedium!
            //                   .copyWith(fontSize: 12.sp),
            //             ),
            //             Text(
            //               "Self wash",
            //               style: Theme.of(context)
            //                   .primaryTextTheme
            //                   .headlineMedium!
            //                   .copyWith(fontSize: 12.sp),
            //             ),
            //           ],
            //         ),
            //       ),
            //       SizedBox(
            //         height: 500,
            //         //height: double.maxFinite,
            //         // height:double.maxFinite,
            //         child: TabBarView(
            //           children: [
            //             WashItemsPage(),
            //             Container(),
            //             Container(),
            //             Container()
            //           ],
            //         ),
            //       ),
            //     ],
            //   ),
            // ),

            ActionCustomButton(
                btnColor: AppColors.primary,
                title: "Next",
                isLoading: false,
                onclick: () async {
                  //shopService.changeSetup(val: 2);
                }),

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
