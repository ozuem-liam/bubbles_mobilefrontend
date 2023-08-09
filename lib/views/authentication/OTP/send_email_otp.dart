
import 'package:bubbles/views/authentication/widgets/custom_top_widget.dart';
import 'package:flutter/services.dart';
import 'package:bubbles/providers/auth_providrs/auth_providers.dart';
import 'package:bubbles/utils/constvalues.dart';
import 'package:bubbles/widgets/custom_button.dart';
import 'package:bubbles/widgets/customfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    var authViewModel = ref.watch(userAuthViewModelProvider);
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
                  FocusScope.of(context).unfocus();
                  final validate = authViewModel.validateAndSave(formKey);
                  if (validate) {
                    authViewModel.initiateResetPasswords(
                      email: authViewModel.emailController.text.trim(),
                      nextAction: onTap
                    );
                  }
                }),
          ],
        ),
      ),
    );
  }
}
