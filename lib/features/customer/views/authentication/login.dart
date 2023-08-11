import 'package:bubbles/features/customer/providers/customer_auth_providers.dart';
import 'package:bubbles/features/customer/viewModels/customer_auth_vm.dart';
import 'package:bubbles/features/customer/views/authentication/widgets/custom_top_widget.dart';
import 'package:flutter/services.dart';
import 'package:bubbles/style/appColors.dart';
import 'package:bubbles/utils/constvalues.dart';
import 'package:bubbles/features/customer/views/authentication/OTP/email_otp_verification.dart';
import 'package:bubbles/features/customer/views/authentication/OTP/send_email_otp.dart';
import 'package:bubbles/features/customer/views/authentication/password/reset_password.dart';
import 'package:bubbles/onboarding/select_user_type.dart';
import 'package:bubbles/widgets/buttons.dart';
import 'package:bubbles/widgets/custom_button.dart';
import 'package:bubbles/widgets/customfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// ignore: depend_on_referenced_packages
import 'package:get/get.dart';

class LoginPage extends ConsumerWidget {
  LoginPage({super.key});
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var authViewModel = ref.watch(customerAuthViewModelProvider);

    return Scaffold(
      body: Stack(
        children: [
          const CustomTopWidget(
              title: "Welcome back",
              subtitle: "Sign in to your account",
              isBack: true),
          Padding(
            padding: EdgeInsets.only(top: customTopBarPadding.h),
            child: loginForm(context: context, authViewModel: authViewModel),
          ),
        ],
      ),
    );
  }

  Widget loginForm(
      {required BuildContext context,
      required CustomerAuthViewModel authViewModel}) {
    return Form(
      key: formKey,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: generalHorizontalPadding.w),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.zero,
          children: [
            SizedBox(
              height: 50.h,
            ),
            CustomField(
              headtext: "Email",
              hint: 'abc@gmail.com',
              validate: true,
              controller: emailController,
              textInputFormatters: [
                FilteringTextInputFormatter.deny(RegExp('[ ]')),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            CustomField(
              headtext: "Password",
              hint: "******",
              textInputFormatters: [
                FilteringTextInputFormatter.deny(RegExp('[ ]')),
              ],
              controller: passwordController,
              validate: true,
              obscureText: authViewModel.obscureText,
              sIcon: InkWell(
                  onTap: () {
                    authViewModel.isObscure();
                  },
                  child: Icon(
                    authViewModel.obscureText
                        ? Icons.visibility_off_outlined
                        : Icons.remove_red_eye,
                    size: 15.w,
                  )),
            ),
            SizedBox(
              height: 10.h,
            ),
            Center(
              child: WordsButton(
                  firstTextSize: 12.sp,
                  secondTextSize: 12.sp,
                  secondTextColor: AppColors.black,
                  fontWeight2: FontWeight.bold,
                  underline: TextDecoration.underline,
                  textHeight: 2,
                  onTap: () {
                    Get.to(() => SendEmailOTP(
                          onTap: () {
                            Get.to(() => EmailOTPVerification(onTap: () {
                                  Get.to(() => ResetPasswordPage());
                                }));
                          },
                          title: "Forgot password",
                          subTitle:
                              "Enter your email account to reset password",
                        ));
                  },
                  firstText: "Forgot password?",
                  secondText: "Reset Here"),
            ),
            SizedBox(
              height: 20.h,
            ),
            ActionCustomButton(
                title: "LOGIN",
                isLoading: false,
                onclick: () {
                  FocusScope.of(context).unfocus();
                  final validate = authViewModel.validateAndSave(formKey);
                  if (validate) {
                    authViewModel.login(
                        email: emailController.text.trim(),
                        password: passwordController.text.trim());
                  }

                  // Get.to(() => const HomeNavigation());
                }),
            SizedBox(
              height: 20.h,
            ),
            Center(
              child: WordsButton(
                  firstTextSize: 12.sp,
                  secondTextSize: 12.sp,
                  secondTextColor: AppColors.black,
                  fontWeight2: FontWeight.bold,
                  underline: TextDecoration.underline,
                  textHeight: 2,
                  onTap: () {
                    Get.to(() => const SelectUserType());
                  },
                  firstText: "Don’t have an account?",
                  secondText: "Register"),
            )
          ],
        ),
      ),
    );
  }
}
