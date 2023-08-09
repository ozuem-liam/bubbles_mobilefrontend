import 'package:bubbles/style/appColors.dart';
import 'package:bubbles/utils/app_info.dart';
import 'package:bubbles/utils/constvalues.dart';
import 'package:bubbles/utils/images.dart';
import 'package:bubbles/views/authentication/login.dart';
import 'package:bubbles/views/authentication/registration_page.dart';
import 'package:bubbles/widgets/custom_button.dart';
import 'package:bubbles/widgets/image_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// ignore: depend_on_referenced_packages
import 'package:get/get.dart';

class StepperScreen extends ConsumerWidget {
  const StepperScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: AppColors.white,
      // appBar: customAppBar(title: ''),
      body: ListView(
        shrinkWrap: true,
        padding:
            const EdgeInsets.symmetric(horizontal: generalHorizontalPadding),
        physics: const BouncingScrollPhysics(),
        children: [
          SizedBox(height: 50.h),
          // const ImageWidget(
          //   asset: installerIcon,
          //   height: 40,
          //   width: 200,
          // ),
          // SizedBox(height: 20.h),
          // ImageWidget(
          //   asset: welcomeImage,
          //   height: 200.h,
          //   width: MediaQuery.sizeOf(context).width,
          //   fit: BoxFit.fill,
          // ),
          SizedBox(height: 30.h),
          Text(
            'Go Solar, Save Big! 💰 Effortlessly!',
            textAlign: TextAlign.start,
            style: Theme.of(context)
                .primaryTextTheme
                .headlineMedium!
                .copyWith(fontWeight: FontWeight.w700, fontSize: 30.sp),
          ),
          SizedBox(height: 10.h),
          Text(
            'Discover solar options and request installation at the click of a button.',
            textAlign: TextAlign.start,
            style: Theme.of(context)
                .primaryTextTheme
                .headlineMedium!
                .copyWith(fontWeight: FontWeight.w300, fontSize: 12.sp),
          ),
          SizedBox(height: 50.h),
          ActionCustomButton(
              title: "Signup",
              isLoading: false,
              onclick: () {
                Get.to(() => RegistrationPage());
              }),
          SizedBox(height: 10.h),
          ActionCustomButton(
              btnColor: AppColors.secondary,
              title: "Login",
              isLoading: false,
              onclick: () {
                Get.to(() => LoginPage());
              }),
          SizedBox(height: 30.h),
          Center(
            child: Text(
              appVersion,
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .primaryTextTheme
                  .headlineMedium!
                  .copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 10.sp,
                      color: AppColors.gray),
            ),
          ),
        ],
      ),
    );
  }
}
