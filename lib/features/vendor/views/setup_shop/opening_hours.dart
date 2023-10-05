import 'package:bubbles/features/vendor/views/setup_shop/setup_completion.dart';
import 'package:bubbles/style/appColors.dart';
import 'package:bubbles/utils/constvalues.dart';
import 'package:bubbles/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// ignore: depend_on_referenced_packages
import 'package:get/get.dart';

class OpeningHoursPage extends ConsumerWidget {
  const OpeningHoursPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: ListView(
          padding:
              const EdgeInsets.symmetric(horizontal: generalHorizontalPadding),
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          children: [



              SizedBox(
              height: 20.h,
            ),

            ActionCustomButton(
                btnColor: AppColors.primary,
                title: "Finish setup",
                isLoading: false,
                onclick: () async {
                  Get.to(()=> SetupCompletionPage());
                }),

            SizedBox(
              height: 20.h,
            ),
          ]),
    );
  }
}
