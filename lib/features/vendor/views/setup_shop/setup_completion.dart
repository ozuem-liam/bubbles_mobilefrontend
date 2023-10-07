import 'package:bubbles/features/vendor/views/home/navigation_page.dart';
import 'package:bubbles/style/appColors.dart';
import 'package:bubbles/utils/constvalues.dart';
import 'package:bubbles/utils/svgs.dart';
import 'package:bubbles/widgets/custom_appbar.dart';
import 'package:bubbles/widgets/custom_button.dart';
import 'package:bubbles/widgets/image_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: depend_on_referenced_packages
import 'package:get/get.dart';

class SetupCompletionPage extends ConsumerWidget {
  const SetupCompletionPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: customAppBar(),
      body: ListView(
        padding:
            const EdgeInsets.symmetric(horizontal: generalHorizontalPadding),
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        children: [
          SizedBox(
            height: 20.h,
          ),
          Text(
            'Setup completed',
            textAlign: TextAlign.start,
            style: Theme.of(context).primaryTextTheme.headlineMedium?.copyWith(
                //color: AppColors.primary,
                fontWeight: FontWeight.bold,
                fontSize: 22.sp),
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            'Welldone! You have successfully setup your shop. Keep checking back to see review status.',
            textAlign: TextAlign.start,
            style: Theme.of(context)
                .primaryTextTheme
                .headlineMedium
                ?.copyWith(fontSize: 12.sp, fontWeight: FontWeight.w400),
          ),
          SizedBox(
            height: 40.h,
          ),
          SvgImage(
            asset: completedSetupIcon,
            width: 200.w,
            height: 300.w,
          ),
          SizedBox(
            height: 50.h,
          ),
          Text(
            'Your shop will be reviewed and activated  within 2-3 business days.',
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .primaryTextTheme
                .headlineMedium
                ?.copyWith(fontSize: 14.sp, fontWeight: FontWeight.w400),
          ),
          SizedBox(
            height: 50.h,
          ),
          ActionCustomButton(
              btnColor: AppColors.primary,
              title: "Home",
              isLoading: false,
              onclick: () async {
                Get.offAll(() => const VendorHomeNavigation());
              }),
          SizedBox(
            height: 20.h,
          ),
        ],
      ),
    );
  }
}
