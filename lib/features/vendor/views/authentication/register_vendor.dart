import 'package:bubbles/features/customer/providers/customer_auth_providers.dart';
import 'package:bubbles/features/customer/views/authentication/OTP/email_otp_verification.dart';
import 'package:bubbles/features/vendor/providers/vendor_auth_providers.dart';
import 'package:bubbles/features/vendor/views/authentication/OTP/email_otp_verification.dart';
import 'package:bubbles/features/vendor/views/setup_shop/setup_shop.dart';
import 'package:bubbles/widgets/buttons.dart';
import 'package:bubbles/widgets/confirmation_screen.dart';
import 'package:bubbles/widgets/custom_button.dart';
import 'package:bubbles/widgets/customfield.dart';
import 'package:flutter/services.dart';
import 'package:bubbles/style/appColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bubbles/onboarding/login.dart';
import 'package:get/get.dart';

class ResgisterVendor extends ConsumerWidget {
  ResgisterVendor({super.key});
  final formKey = GlobalKey<FormState>();
  final firstNameController = TextEditingController();
  final passwordController = TextEditingController();
  final lastNameController = TextEditingController();

  final addressController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  // final phoneController = TextEditingController();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var viewModel = ref.watch(vendorAuthViewModelProvider);
    return Form(
      key: formKey,
      child: Column(
        children: [
          SizedBox(
            height: 20.h,
          ),
          Row(
            children: [
              Expanded(
                child: CustomField(
                  pIcon: Icon(
                    Icons.person,
                    size: 13.w,
                  ),
                  headtext: "First name",
                  validate: true,
                  controller: firstNameController,
                ),
              ),
              SizedBox(
                width: 20.h,
              ),
              Expanded(
                child: CustomField(
                  pIcon: Icon(
                    Icons.person,
                    size: 13.w,
                  ),
                  headtext: "last name",
                  validate: true,
                  controller: lastNameController,
                  textInputFormatters: [
                    FilteringTextInputFormatter.deny(RegExp('[ ]')),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          CustomField(
            pIcon: Icon(
              Icons.email,
              size: 13.w,
            ),
            headtext: "Email",
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
            pIcon: Icon(
              Icons.phone,
              size: 13.w,
            ),
            headtext: "Phone Number",
            hint: '+234-123456789',
            validate: true,
            controller: phoneController,
            textInputFormatters: [
              FilteringTextInputFormatter.deny(RegExp('[ ]')),
              FilteringTextInputFormatter.digitsOnly,
              // FilteringTextInputFormatter.deny(RegExp('^0+')),
              LengthLimitingTextInputFormatter(11)
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          CustomField(
            pIcon: Icon(
              Icons.location_on,
              size: 13.w,
            ),
            headtext: "Address",
            controller: addressController,
          ),
          SizedBox(
            height: 20.h,
          ),
          CustomField(
            pIcon: Icon(
              Icons.security,
              size: 13.w,
            ),
            headtext: "Password",
            hint: '***********',
            validate: true,
            controller: passwordController,
            textInputFormatters: [
              FilteringTextInputFormatter.deny(RegExp('[ ]')),
            ],
            obscureText: viewModel.obscureText,
            sIcon: InkWell(
                onTap: () {
                  viewModel.isObscure();
                },
                child: Icon(
                  viewModel.obscureText
                      ? Icons.visibility_off_outlined
                      : Icons.remove_red_eye,
                  size: 15.w,
                )),
          ),
          SizedBox(
            height: 20.h,
          ),
          Center(
            child: WordsButton(
              secondTextSize: 12.sp,
              fontWeight2: FontWeight.w400,
              firstText: 'You agree to bubbles',
              secondText: ' Terms and Conditions ',
              thirdText: " by creating an account ",
              underline: TextDecoration.underline,
              secondTextColor: AppColors.secondary,
              firstTextSize: 12.sp,
              thirdTextSize: 12.sp,
              onTap: () {},
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          ActionCustomButton(
              btnColor: AppColors.primary,
              title: "Signup",
              isLoading: false,
              onclick: () async {
                final validate = viewModel.validateAndSave(formKey);
                if (validate) {
                  viewModel.registerVendor(
                      email: emailController.text.trim().toString(),
                      password: passwordController.text.trim().toString(),
                      firstName: firstNameController.text.trim(),
                      lastName: lastNameController.text.trim(),
                      phone: phoneController.text.trim(),
                      address: addressController.text.trim());
                }
              }),
          SizedBox(
            height: 15.h,
          ),
          Center(
            child: WordsButton(
                firstTextSize: 13.sp,
                secondTextSize: 13.sp,
                secondTextColor: AppColors.secondary,
                fontWeight2: FontWeight.bold,
                textHeight: 2,
                onTap: () {
                  Get.to(() => LoginPage());
                },
                firstText: "Have an existing account?",
                secondText: "Login"),
          ),
          SizedBox(
            height: 40.h,
          ),
        ],
      ),
    );
  }
}
