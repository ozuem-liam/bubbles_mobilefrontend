import 'package:bubbles/features/vendor/views/setup_shop/business_setup.dart';
import 'package:bubbles/features/vendor/views/setup_shop/laundry_items.dart';
import 'package:bubbles/features/vendor/views/setup_shop/opening_hours.dart';
import 'package:bubbles/style/appColors.dart';
import 'package:bubbles/utils/constvalues.dart';
import 'package:bubbles/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

var setupShopProvider = StateProvider<int>((ref) => 0);

class SetupShotPage extends ConsumerWidget {
  const SetupShotPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int stateValue = ref.watch(setupShopProvider);
    // var toggleValue = ref.read(setupShopProvider.notifier);

    Widget headerWidget({required BuildContext context}) {
      return Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: generalHorizontalPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10.h,
            ),
            Text(
              "Setup shop",
              textAlign: TextAlign.start,
              style:
                  Theme.of(context).primaryTextTheme.headlineMedium?.copyWith(
                      //color: AppColors.primary,
                      fontWeight: FontWeight.bold,
                      fontSize: 22.sp),
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              'Please fill out your business details.',
              textAlign: TextAlign.start,
              style: Theme.of(context)
                  .primaryTextTheme
                  .headlineMedium
                  ?.copyWith(fontSize: 12.sp, fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: 15.h,
            ),
            Row(
              children: List.generate(
                  3,
                  (index) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 3.h,
                        width: MediaQuery.sizeOf(context).width / 4,
                        decoration: BoxDecoration(
                            color: stateValue == index
                                ? AppColors.secondary
                                : AppColors.secondary.withOpacity(0.3)),
                      ))),
            )
          ],
        ),
      );
    }

    return Scaffold(
      appBar: customAppBar(),
      body: Stack(
        children: [
          headerWidget(context: context),
          Padding(
            padding: EdgeInsets.only(top: 100.h),
            child: switch (stateValue) {
              0 => BusinessSetupPage(),
              1 => LaundryItemsPage(),
              2 => OpeningHoursPage(),
              _ => Container(),
            },
          )
        ],
      ),
    );
  }
}
