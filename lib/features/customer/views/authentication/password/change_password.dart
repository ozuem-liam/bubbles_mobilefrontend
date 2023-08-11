import 'package:bubbles/features/customer/providers/customer_auth_providers.dart';
import 'package:bubbles/features/customer/viewModels/customer_auth_vm.dart';
import 'package:bubbles/features/customer/views/authentication/widgets/custom_top_widget.dart';
import 'package:flutter/services.dart';
import 'package:bubbles/style/appColors.dart';
import 'package:bubbles/utils/constvalues.dart';
import 'package:bubbles/widgets/custom_button.dart';
import 'package:bubbles/widgets/customfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// ignore: depend_on_referenced_packages

class ChangePasswordPage extends ConsumerWidget {
  ChangePasswordPage({super.key});

  final formKey = GlobalKey<FormState>();
  final currentpasswordController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var authViewModel = ref.watch(customerAuthViewModelProvider);

    return Scaffold(
      body: Stack(
        children: [
          SecondCustomTopWidget(
              bgColor: AppColors.white,
              textColor: AppColors.black.withOpacity(0.8),
              iconColor: AppColors.black,
              height: 120.h,
              title: "Change password",
              isBack: true),
          Padding(
            padding: EdgeInsets.only(top: customTopBarPadding.h - 20),
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
            // CustomField(
            //   headtext: "Current Password",
            //   controller: currentpasswordController,
            //   validate: true,
            //   textInputFormatters: [
            //     FilteringTextInputFormatter.deny(RegExp('[ ]')),
            //   ],
            //   obscureText: userAuthViewModel.obscureText,
            //   sIcon: InkWell(
            //       onTap: () {
            //         userAuthViewModel.isObscure();
            //       },
            //       child: Icon(
            //         userAuthViewModel.obscureText
            //             ? Icons.visibility_off_outlined
            //             : Icons.remove_red_eye,
            //         size: 15.w,
            //       )),
            // ),
            // SizedBox(
            //   height: 20.h,
            // ),
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
              height: 50.h,
            ),
            ActionCustomButton(
                title: "Change password",
                isLoading: false,
                onclick: () async {
                  FocusScope.of(context).unfocus();
                  final validate = userAuthViewModel.validateAndSave(formKey);
                  if (validate) {
                    userAuthViewModel.changePassword(
                        password: passwordController.text.trim(),
                        confirmPassword: confirmPasswordController.text.trim());
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
