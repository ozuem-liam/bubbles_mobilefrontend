import 'package:bubbles/features/customer/providers/customer_auth_providers.dart';
import 'package:bubbles/features/customer/views/authentication/OTP/email_otp_verification.dart';
import 'package:bubbles/features/customer/views/authentication/password/reset_password.dart';
import 'package:bubbles/features/customer/views/authentication/widgets/custom_top_widget.dart';
import 'package:bubbles/onboarding/login.dart';
import 'package:bubbles/style/appColors.dart';
import 'package:bubbles/utils/notify_me.dart';
import 'package:bubbles/widgets/buttons.dart';
import 'package:bubbles/widgets/custom_appbar.dart';
import 'package:bubbles/widgets/drop_down_field.dart';
import 'package:flutter/services.dart';
import 'package:bubbles/utils/constvalues.dart';
import 'package:bubbles/widgets/custom_button.dart';
import 'package:bubbles/widgets/customfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// ignore: depend_on_referenced_packages
import 'package:get/get.dart';

class SendEmailOTP extends ConsumerWidget {
  final VoidCallback onTap;
  final String title;
  final String subTitle;
  SendEmailOTP(
      {required this.onTap,
      required this.title,
      required this.subTitle,
      super.key});
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: customAppBar(),
      body: Stack(
        children: [
          CustomTopWidget(title: title, subtitle: subTitle, isBack: true),
          Padding(
            padding: EdgeInsets.only(top: customTopBarPadding.h),
            child: inputEmail(context: context, ref: ref),
          ),
        ],
      ),
    );
  }

  Widget inputEmail({required BuildContext context, required WidgetRef ref}) {
    var authViewModel = ref.watch(customerAuthViewModelProvider);
    String stateValue = ref.watch(selectUserTypeProvider);
    var toggleValue = ref.read(selectUserTypeProvider.notifier);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: generalHorizontalPadding.w),
      child: Form(
        key: formKey,
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            SizedBox(
              height: 50.h,
            ),
            DropDownFeild(
              value: stateValue,
              valuePlaceHolder: "Select your account type",
              item: List.generate(
                userList.length,
                (index) => PopupMenuItem<String>(
                  value: stateValue,
                  onTap: () {
                    toggleValue.state = userList[index];
                  },
                  child: Text(
                    userList[index],
                    style: Theme.of(context).primaryTextTheme.headlineMedium,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            CustomField(
              headtext: 'Email',
              validate: true,
              controller: authViewModel.emailController,
              textInputFormatters: [
                FilteringTextInputFormatter.deny(RegExp('[ ]')),
              ],
            ),
            SizedBox(
              height: 30.h,
            ),
            ActionCustomButton(
                title: "Continue",
                isLoading: false,
                onclick: () async {
                  switch (stateValue) {
                    case "Vendor":
                      final validate = authViewModel.validateAndSave(formKey);
                      if (validate) {}
                      break;
                    case "Customer":
                      final validate = authViewModel.validateAndSave(formKey);
                      if (validate) {}
                    default:
                      NotifyMe.showScaffoldAlert(
                          context: context,
                          message: "Select your account type to proceed");
                  }
                 
                  // FocusScope.of(context).unfocus();
                  // Get.to(() => EmailOTPVerification(onTap: () {
                  //       Get.to(() => ResetPasswordPage());
                  //     }));
                  // final validate = authViewModel.validateAndSave(formKey);
                  // if (validate) {
                  //   authViewModel.initiateResetPasswords(
                  //       email: authViewModel.emailController.text.trim(),
                  //       nextAction: onTap);
                  // }
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
                  //underline: TextDecoration.underline,
                  textHeight: 2,
                  onTap: () {
                    Get.back();
                  },
                  firstText: "Remember password? ",
                  secondText: "Log in"),
            )
          ],
        ),
      ),
    );
  }
}
