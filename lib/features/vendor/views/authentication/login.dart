import 'package:bubbles/features/customer/providers/customer_auth_providers.dart';
import 'package:bubbles/features/customer/viewModels/customer_auth_vm.dart';
import 'package:bubbles/features/customer/views/authentication/widgets/custom_top_widget.dart';
import 'package:bubbles/features/vendor/providers/vendor_auth_providers.dart';
import 'package:bubbles/features/vendor/viewModels/vendor_auth_vm.dart';
import 'package:bubbles/features/vendor/views/authentication/OTP/email_otp_verification.dart';
import 'package:bubbles/features/vendor/views/authentication/OTP/send_email_otp.dart';
import 'package:bubbles/features/vendor/views/authentication/password/reset_password.dart';
import 'package:bubbles/features/vendor/views/navigation_page.dart';
import 'package:bubbles/widgets/custom_appbar.dart';
import 'package:bubbles/widgets/drop_down_field.dart';
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

var selectUserTypeProvider = StateProvider.autoDispose<String>((ref) => '');

final userList = ["Customer", "Vendor"];

class LoginPage extends ConsumerWidget {
  LoginPage({super.key});
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final userTypeController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var authViewModel = ref.watch(vendorAuthViewModelProvider);
    String stateValue = ref.watch(selectUserTypeProvider);
    var toggleValue = ref.read(selectUserTypeProvider.notifier);

    Widget loginForm(
        {required BuildContext context,
        required VendorAuthViewModel authViewModel}) {
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
              stateValue == 'Vendor'
                  ? Center(
                      child: WordsButton(
                          firstTextSize: 12.sp,
                          secondTextSize: 12.sp,
                          secondTextColor: AppColors.secondary,
                          fontWeight2: FontWeight.bold,
                          //underline: TextDecoration.underline,
                          textHeight: 2,
                          onTap: () {
                            Get.to(() => VendorSendEmailOTP(
                                  onTap: () {
                                    Get.to(() =>
                                        VendorEmailOTPVerification(onTap: () {
                                          Get.to(
                                              () => VendorResetPasswordPage());
                                        }));
                                  },
                                  title: "Forgot password",
                                  subTitle:
                                      "Don’t worry, we’ll help you reset it.",
                                ));
                          },
                          firstText: "Forgot password?",
                          secondText: "Reset Here"),
                    )
                  : Center(
                      child: WordsButton(
                          firstTextSize: 12.sp,
                          secondTextSize: 12.sp,
                          secondTextColor: AppColors.secondary,
                          fontWeight2: FontWeight.bold,
                          //underline: TextDecoration.underline,
                          textHeight: 2,
                          onTap: () {
                            Get.to(() => SendEmailOTP(
                                  onTap: () {
                                    Get.to(
                                        () => EmailOTPVerification(onTap: () {
                                              Get.to(() => ResetPasswordPage());
                                            }));
                                  },
                                  title: "Forgot password",
                                  subTitle:
                                      "Don’t worry, we’ll help you reset it.",
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
                  onclick: () async {
                    if (stateValue == 'Vendor') {
                      // Get.to(() => const VendorHomeNavigation());
                      final validate = authViewModel.validateAndSave(formKey);
                      if (validate) {
                        authViewModel.login(
                            email: emailController.text.trim().toString(),
                            password:
                                passwordController.text.trim().toString());
                      }
                    } else {}
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
                      Get.to(() => const SelectUserType());
                    },
                    firstText: "Don’t have an account?",
                    secondText: "Sign up"),
              )
            ],
          ),
        ),
      );
    }

    return Scaffold(
      appBar: customAppBar(),
      body: Stack(
        children: [
          const CustomTopWidget(
              title: "Log in",
              subtitle: "Welcome back to easy laundry!",
              isBack: true),
          Padding(
            padding: EdgeInsets.only(top: customTopBarPadding.h),
            child: loginForm(context: context, authViewModel: authViewModel),
          ),
        ],
      ),
    );
  }
}
