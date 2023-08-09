// ignore_for_file: use_build_context_synchronously

import 'package:bubbles/providers/auth_providrs/auth_providers.dart';
import 'package:bubbles/style/appColors.dart';
import 'package:bubbles/style/appCustomPaints.dart';
import 'package:bubbles/utils/constvalues.dart';
import 'package:bubbles/widgets/buttons.dart';
import 'package:bubbles/widgets/custom_button.dart';
import 'package:bubbles/widgets/customfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// ignore: depend_on_referenced_packages

class VerifyEmailAccount extends ConsumerWidget {
  final VoidCallback onTap;
  VerifyEmailAccount({required this.onTap, super.key});
  final formKey = GlobalKey<FormState>();
  final pinKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var keyboardVisible = MediaQuery.of(context).viewInsets.bottom == 0;
    return WillPopScope(
      onWillPop: () {
        return Future.delayed(const Duration(seconds: 0));
      },
      child: Scaffold(
        body: Stack(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: CustomPaint(
                size: Size(customPaintSizeValue,
                    (customPaintSizeValue * customPaintTop).toDouble()),
                painter: TopRightRPSCustomPainter(),
              ),
            ),
            keyboardVisible
                ? Align(
                    alignment: Alignment.bottomLeft,
                    child: CustomPaint(
                      size: Size(
                          customPaintSizeValue,
                          (customPaintSizeValue * customPaintBottom)
                              .toDouble()),
                      painter: RPSCustomPainterNew(),
                    ),
                  )
                : const SizedBox(),
            // const HelpIcon(),
            Center(
              child: ListView(
                children: [mainComponent(context: context, ref: ref)],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget mainComponent(
      {required BuildContext context, required WidgetRef ref}) {
   // var authViewModel = ref.watch(userAuthViewModelProvider);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // Text(
          //   'Account',
          //   textAlign: TextAlign.center,
          //   style: Theme.of(context).primaryTextTheme.headlineMedium?.copyWith(
          //       //color: AppColors.primary,
          //       fontWeight: FontWeight.bold,
          //       fontSize: 16.sp),
          // ),
          SizedBox(
            height: 60.h,
          ),
          Center(
            child: Icon(
              (Icons.verified_user),
              size: 70.w,
              color: AppColors.primary,
            ),
          ),

          emailVerification(context: context, ref: ref),
          //phoneVerification(context: context, ref: ref),
        ],
      ),
    );
  }

  Widget emailVerification(
      {required BuildContext context, required WidgetRef ref}) {
    var authViewModel = ref.watch(userAuthViewModelProvider);

    return Form(
      child: Form(
        key: pinKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 70.h,
            ),
            Text(
              "Email Verification",
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .primaryTextTheme
                  .headlineMedium
                  ?.copyWith(fontSize: 15.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              "A 6 Digit Code Has Been Sent To Your Provided Email Address ${authViewModel.emailController.text}",
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .primaryTextTheme
                  .headlineMedium
                  ?.copyWith(
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w400,
                      height: 1.3),
            ),
            SizedBox(
              height: 30.h,
            ),
            CustomField(
              //headtext: "Enter your 6-digit Passcode ",
              controller: authViewModel.otpController,
              isWordField: false,
              pinPutFieldCount: 6,
              onCompleted: (val) {},
            ),
            SizedBox(
              height: 50.h,
            ),
            WordsButton(
                firstTextSize: 11.sp,
                secondTextSize: 13.sp,
                secondTextColor: AppColors.primary,
                fontWeight2: FontWeight.bold,
                underline: TextDecoration.underline,
                textHeight: 2,
                onTap: () async {
                  // var res = await authViewModel.sendEmailOTP();
                  // if (res == true) {
                  //   // authViewModel.swicthEmailOTP();
                  // }
                },
                firstText: "Didn’t get the Code?",
                secondText: "Resend"),
            SizedBox(
              height: 70.h,
            ),
            // authViewModel.isVerifyEmailAccount == true
            2 == 4
                ? Column(
                    children: [
                      SizedBox(
                        height: 20.w,
                        width: 20.w,
                        child: const CircularProgressIndicator(),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        "Resending OTP",
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .primaryTextTheme
                            .headlineMedium
                            ?.copyWith(
                                fontSize: 11.sp,
                                fontWeight: FontWeight.w400,
                                height: 1.3),
                      ),
                    ],
                  )
                :
                // authViewModel.isVerifyEmailAccount == true
                3 == 5
                    ? Column(
                        children: [
                          SizedBox(
                            height: 20.w,
                            width: 20.w,
                            child: const CircularProgressIndicator(),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Text(
                            "Verifying OTP",
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .primaryTextTheme
                                .headlineMedium
                                ?.copyWith(
                                    fontSize: 11.sp,
                                    fontWeight: FontWeight.w400,
                                    height: 1.3),
                          ),
                        ],
                      )
                    : ActionCustomButton(
                        title: "CONTINUE",
                        onclick: () async {
                          onTap();
                          // final form = pinKey.currentState;
                          // if (form!.validate()) {
                          //   form.save();

                          //   var res = await authViewModel.verifyEmailAccount();
                          //   if (res == true) {
                          //     onTap();
                          //   } else {}
                          // } else {
                          //   NotifyMe.showScaffoldAlert(
                          //       context: context, message: "OTP is required");
                          // }
                        }),
            SizedBox(
              height: 20.h,
            ),
          ],
        ),
      ),
    );
  }
}
