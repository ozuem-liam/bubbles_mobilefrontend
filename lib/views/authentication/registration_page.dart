import 'package:bubbles/views/authentication/widgets/custom_top_widget.dart';
import 'package:bubbles/widgets/buttons.dart';
import 'package:flutter/services.dart';
import 'package:bubbles/providers/auth_providrs/auth_providers.dart';
import 'package:bubbles/style/appColors.dart';
import 'package:bubbles/utils/constvalues.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bubbles/viewmodels/auth/auth_vm.dart';
import 'package:bubbles/views/authentication/login.dart';

import '../../widgets/custom_button.dart';
import '../../widgets/customfield.dart';
import 'package:get/get.dart';

class RegistrationPage extends ConsumerWidget {
  RegistrationPage({super.key});
  final formKey = GlobalKey<FormState>();
  final fullNameController = TextEditingController();
  final passwordController = TextEditingController();
  final userNameController = TextEditingController();

  final referralController = TextEditingController();
  final phoneController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var authViewModel = ref.watch(userAuthViewModelProvider);

    return Scaffold(
      body: Stack(
        children: [
          const CustomTopWidget(
              title: "Create an Account",
              subtitle: "Signup to get started",
              isBack: true),
          Padding(
            padding: EdgeInsets.only(top: customTopBarPadding.h),
            child: formTab(context: context, authViewModel: authViewModel),
          ),
        ],
      ),
    );
  }

  Widget formTab(
      {required BuildContext context,
      required UserAuthViewModel authViewModel}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: generalHorizontalPadding.w),
      child: Form(
        key: formKey,
        child: ListView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.zero,
          children: [
            SizedBox(
              height: 50.h,
            ),
            CustomField(
              headtext: "First name (legal name)",
              validate: true,
              controller: fullNameController,
            ),
            SizedBox(
              height: 20.h,
            ),
            CustomField(
              headtext: "Last name",
              validate: true,
              controller: userNameController,
              textInputFormatters: [
                FilteringTextInputFormatter.deny(RegExp('[ ]')),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            CustomField(
              headtext: "Email",
              validate: true,
              controller: authViewModel.emailController,
              textInputFormatters: [
                FilteringTextInputFormatter.deny(RegExp('[ ]')),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            CustomField(
              headtext: "Phone Number",
              hint: '+234-123456789',
              validate: true,
              controller: phoneController,
              textInputFormatters: [
                FilteringTextInputFormatter.deny(RegExp('[ ]')),
                FilteringTextInputFormatter.digitsOnly,
                FilteringTextInputFormatter.deny(RegExp('^0+')),
                LengthLimitingTextInputFormatter(11)
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            CustomField(
              headtext: "Gender",
              controller: referralController,
              textInputFormatters: [
                FilteringTextInputFormatter.deny(RegExp('[ ]')),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            CustomField(
              headtext: "Password",
              hint: '***********',
              validate: true,
              controller: passwordController,
              textInputFormatters: [
                FilteringTextInputFormatter.deny(RegExp('[ ]')),
              ],
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
              height: 20.h,
            ),
            ActionCustomButton(
                btnColor: AppColors.primary,
                title: "Signup",
                isLoading: false,
                onclick: () async {}),
            SizedBox(
              height: 15.h,
            ),
            Center(
              child: WordsButton(
                  firstTextSize: 13.sp,
                  secondTextSize: 13.sp,
                  secondTextColor: AppColors.black,
                  fontWeight2: FontWeight.bold,
                  textHeight: 2,
                  onTap: () {
                    Get.to(() => LoginPage());
                  },
                  firstText: "Have an existing account?",
                  secondText: "Login"),
            ),
          ],
        ),
      ),
    );
  }
}
