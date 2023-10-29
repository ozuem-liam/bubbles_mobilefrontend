import 'package:bubbles/features/customer/providers/customer_auth_providers.dart';
import 'package:bubbles/features/customer/viewModels/customer_auth_vm.dart';
import 'package:bubbles/features/customer/views/authentication/widgets/custom_top_widget.dart';
import 'package:bubbles/widgets/custom_appbar.dart';
import 'package:flutter/services.dart';
import 'package:bubbles/utils/constvalues.dart';
import 'package:bubbles/widgets/confirmation_screen.dart';
import 'package:bubbles/features/vendor/views/authentication/login.dart';
import 'package:bubbles/widgets/custom_button.dart';
import 'package:bubbles/widgets/customfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// ignore: depend_on_referenced_packages
import 'package:get/get.dart';

class VendorResetPasswordPage extends ConsumerWidget {
  VendorResetPasswordPage({super.key});

  final formKey = GlobalKey<FormState>();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var authViewModel = ref.watch(customerAuthViewModelProvider);
    return Scaffold(
      appBar: customAppBar(),
      body: Stack(
        children: [
          const CustomTopWidget(
              title: "New password",
              subtitle: "Don’t worry, we’ll help you reset it.",
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
      required CustomerAuthViewModel userAuthViewModel}) {
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
                  Get.to(() => ConfirmationPage(
                        title: "Congratulations! \nYou’ve reset your Password",
                        description:
                            "We’ll ask for your password each time you open the bubbles app for security reasons",
                        onTap: () {
                          Get.to(() => LoginPage());
                        },
                      ));
                  // final validate = userAuthViewModel.validateAndSave(formKey);
                  // if (validate) {
                  //   userAuthViewModel.resetPassword(
                  //       password: passwordController.text.trim(),
                  //       confirmPassword: confirmPasswordController.text.trim(),
                  //       nextAction: () {
                  //         Get.to(() => ConfirmationPage(
                  //               title:
                  //                   "Congratulations! \nYou’ve reset your Password",
                  //               description:
                  //                   "We’ll ask for your password each time you open the bubbles app for security reasons",
                  //               onTap: () {
                  //                 Get.to(() => LoginPage());
                  //               },
                  //             ));
                  //       });
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
