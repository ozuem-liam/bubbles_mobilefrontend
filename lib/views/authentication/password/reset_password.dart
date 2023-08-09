
import 'package:bubbles/views/authentication/widgets/custom_top_widget.dart';
import 'package:flutter/services.dart';
import 'package:bubbles/providers/auth_providrs/auth_providers.dart';
import 'package:bubbles/utils/constvalues.dart';
import 'package:bubbles/viewmodels/auth/auth_vm.dart';
import 'package:bubbles/views/authentication/confirmation_screen.dart';
import 'package:bubbles/views/authentication/login.dart';
import 'package:bubbles/widgets/custom_button.dart';
import 'package:bubbles/widgets/customfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// ignore: depend_on_referenced_packages
import 'package:get/get.dart';

class ResetPasswordPage extends ConsumerWidget {
  ResetPasswordPage({super.key});

  final formKey = GlobalKey<FormState>();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var authViewModel = ref.watch(userAuthViewModelProvider);
    return Scaffold(
      body: Stack(
        children: [
          const CustomTopWidget(
              title: "Reset password",
              subtitle: "Enter and confirm new password",
              isBack: true),
          Padding(
            padding: EdgeInsets.only(top: customTopBarPadding.h),
            child: passwordWidget(
                context: context, userAuthViewModel: authViewModel),
          ),
        ],
      ),
    );
  }

  Widget passwordWidget(
      {required BuildContext context,
      required UserAuthViewModel userAuthViewModel}) {
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
              headtext: "New Password",
              controller: passwordController,
              validate: true,
              textInputFormatters: [
                FilteringTextInputFormatter.deny(RegExp('[ ]')),
              ],
              obscureText: userAuthViewModel.obscureText,
              sIcon: InkWell(
                  onTap: () {
                    userAuthViewModel.isObscure();
                  },
                  child: Icon(
                    userAuthViewModel.obscureText
                        ? Icons.visibility_off_outlined
                        : Icons.remove_red_eye,
                    size: 15.w,
                  )),
            ),
            SizedBox(
              height: 20.h,
            ),
            CustomField(
              headtext: "Confirm Password ",
              hint: "******",
              controller: confirmPasswordController,
              validate: true,
              textInputFormatters: [
                FilteringTextInputFormatter.deny(RegExp('[ ]')),
              ],
              obscureText: userAuthViewModel.obscureText,
              sIcon: InkWell(
                  onTap: () {
                    userAuthViewModel.isObscure();
                  },
                  child: Icon(
                    userAuthViewModel.obscureText
                        ? Icons.visibility_off_outlined
                        : Icons.remove_red_eye,
                    size: 15.w,
                  )),
            ),
            SizedBox(
              height: 30.h,
            ),
            ActionCustomButton(
                title: "Continue",
                isLoading: false,
                onclick: () async {
                  FocusScope.of(context).unfocus();
                  final validate = userAuthViewModel.validateAndSave(formKey);
                  if (validate) {
                    userAuthViewModel.resetPassword(
                        password: passwordController.text.trim(),
                        confirmPassword: confirmPasswordController.text.trim(),
                        nextAction: () {
                          Get.to(() => ConfirmationPage(
                                title:
                                    "Congratulations! \nYou’ve reset your Password",
                                description:
                                    "We’ll ask for your password each time you open the bubbles app for security reasons",
                                onTap: () {
                                  Get.to(() => LoginPage());
                                },
                              ));
                        });
                  }
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
