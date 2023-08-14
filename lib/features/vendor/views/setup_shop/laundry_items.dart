import 'package:bubbles/features/vendor/providers/shop_service_providers.dart';
import 'package:bubbles/features/vendor/views/setup_shop/widgets/multi_card_option_widget.dart';
import 'package:bubbles/style/appColors.dart';
import 'package:bubbles/utils/constvalues.dart';
import 'package:bubbles/utils/logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LaundryItemsPage extends ConsumerWidget {
  const LaundryItemsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<String> laundryList = ref.watch(shopViewModelProvider).laundryTypeList;
    var shopService = ref.read(shopViewModelProvider.notifier);

    List laundryTypes = shopService.laundryItems();
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
          ]),
    );
  }
}
