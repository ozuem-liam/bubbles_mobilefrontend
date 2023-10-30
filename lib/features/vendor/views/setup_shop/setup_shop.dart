import 'package:bubbles/features/customer/views/authentication/widgets/custom_top_widget.dart';
import 'package:bubbles/features/vendor/providers/shop_service_providers.dart';
import 'package:bubbles/features/vendor/views/setup_shop/business_setup.dart';
import 'package:bubbles/features/vendor/views/setup_shop/laundry/laundry_items.dart';
import 'package:bubbles/features/vendor/views/setup_shop/opening_hours/opening_hours.dart';
import 'package:bubbles/style/appColors.dart';
import 'package:bubbles/utils/constvalues.dart';
import 'package:bubbles/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: depend_on_referenced_packages
import 'package:get/get.dart';

class SetupShopPage extends ConsumerWidget {
  const SetupShopPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int stateValue = ref.watch(shopViewModelProvider).setUpIndex;

    var shopService = ref.read(shopViewModelProvider.notifier);

    Widget headerWidget({required BuildContext context}) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10.h,
            ),
            CustomTopWidget(
                onTap: () {
                  if (shopService.setUpIndex == 0) {
                    Get.back();
                  } else {
                    shopService.changeSetup(val: shopService.setUpIndex - 1);
                  }
                },
                isNavigation: false,
                title: switch (stateValue) {
                  // 0 => "Setup shop",
                  1 => 'Laundry items',
                  2 => 'Opening hours',
                  _ => "Setup shop",
                },
                subtitle: switch (stateValue) {
                  // 0 => 'Please fill out your business details.',
                  1 => 'Choose items you wash and set rates.',
                  2 => 'Please fill out your business opening hours.',
                  _ => 'Please fill out your business details.',
                },
                isBack: true),
            SizedBox(
              height: 0.h,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: generalHorizontalPadding),
              child: Row(
                children: List.generate(
                    3,
                    (index) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 3.h,
                          width: MediaQuery.sizeOf(context).width / 4,
                          decoration: BoxDecoration(
                              color: stateValue >= index
                                  ? AppColors.secondary
                                  : AppColors.secondary.withOpacity(0.3)),
                        ))),
              ),
            )
          ],
        ),
      );
    }

    return WillPopScope(
      onWillPop: () async {
        if (shopService.setUpIndex == 0) {
          Get.back();
        } else {
          shopService.changeSetup(val: shopService.setUpIndex - 1);
        }
        return false;
      },
      child: Scaffold(
        appBar: customAppBar(),
        body: Stack(
          children: [
            headerWidget(context: context),
            Padding(
              padding: EdgeInsets.only(top: 160.h),
              child: switch (stateValue) {
                //0 => const BusinessSetupPage(),
                1 => const LaundryItemsPage(),
                2 => const OpeningHoursPage(),
                _ => const BusinessSetupPage(),
              },
            )
          ],
        ),
      ),
    );
  }
}
