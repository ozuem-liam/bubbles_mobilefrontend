import 'package:bubbles/features/customer/providers/customer_auth_providers.dart';
import 'package:bubbles/features/vendor/providers/vendor_auth_providers.dart';
import 'package:bubbles/utils/temporary_storage.dart';
import 'package:bubbles/features/customer/views/authentication/widgets/custom_top_widget.dart';
import 'package:bubbles/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bubbles/style/appColors.dart';
import 'package:bubbles/utils/constvalues.dart';
import 'package:bubbles/widgets/buttons.dart';
import 'package:bubbles/widgets/custom_button.dart';
import 'package:bubbles/widgets/customfield.dart';
// ignore: depend_on_referenced_packages

class VendorEmailOTPVerification extends ConsumerWidget {
  final VoidCallback onTap;
  final String email;
  VendorEmailOTPVerification(
      {required this.onTap, required this.email, super.key});
  final formKey = GlobalKey<FormState>();
  final otpController = TextEditingController();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: customAppBar(),
      body: Stack(
        children: [
          const CustomTopWidget(
              //bgColor: AppColors.black,
              title: "Verify email",
              subtitle: "Check email to see the verification code",
              isBack: true),
          Padding(
            padding: EdgeInsets.only(top: customTopBarPadding.h),
            child: emailVerification(context: context, ref: ref),
          ),
        ],
      ),
    );
  }

  Widget emailVerification(
      {required BuildContext context, required WidgetRef ref}) {
    var authViewModel = ref.watch(vendorAuthViewModelProvider);

    return Form(
      key: formKey,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 70.h,
            ),
            CustomField(
              //headtext: "Enter your 6-digit Passcode ",
              controller: otpController,
              isWordField: false,
              pinPutFieldCount: 6,
              onCompleted: (val) {},
            ),
            SizedBox(
              height: 20.h,
            ),
            ActionCustomButton(
                title: "Verify email",
                onclick: () async {
                  FocusScope.of(context).unfocus();

                  final validate = authViewModel.validateAndSave(formKey);
                  if (validate) {
                    authViewModel.verifyEmailOTP(
                        otp: otpController.text.trim(), nextAction: onTap, email: email);
                  }
                }),
            SizedBox(
              height: 20.h,
            ),
            Center(
              child: WordsButton(
                  firstTextSize: 12.sp,
                  secondTextSize: 12.sp,
                  secondTextColor: AppColors.secondary,
                  fontWeight2: FontWeight.bold,
                  // underline: TextDecoration.underline,
                  textHeight: 2,
                  onTap: () async {
                    authViewModel.resendVerifyEmailOTP(
                        nextAction: () {}, email: email);
                  },
                  firstText: "Did not receive Code?",
                  secondText: "Resend"),
            ),
            SizedBox(
              height: 40.h,
            ),
          ],
        ),
      ),
    );
  }
}
