import 'package:bubbles/providers/finger_print_provider.dart';
import 'package:bubbles/providers/push_notification_provider.dart';
import 'package:bubbles/style/appColors.dart';
import 'package:bubbles/utils/constvalues.dart';
import 'package:bubbles/features/customer/views/authentication/password/change_password.dart';
import 'package:bubbles/features/customer/views/authentication/widgets/custom_top_widget.dart';
import 'package:bubbles/widgets/activity_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// ignore: unused_import
import 'package:get/get.dart';

class SettingsPage extends ConsumerStatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SettingsPageState();
}

class _SettingsPageState extends ConsumerState<SettingsPage> {
  bool d2fa = false;
  bool bio = false;
  bool push = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: Stack(
          children: [
            SecondCustomTopWidget(
                bgColor: AppColors.white,
                textColor: AppColors.black.withOpacity(0.8),
                iconColor: AppColors.black,
                height: 120.h,
                title: "Settings",
                isBack: true),
            Padding(
              padding: EdgeInsets.only(top: customTopBarPadding.h - 20),
              child: mainComponent(),
            ),
          ],
        ));
  }

  Widget mainComponent() {
    final fingerPrintModel = ref.watch(fingerPrintProvider);
    final pushNotifyModel = ref.watch(pushNotificationprovider);

    return Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: generalHorizontalPadding),
        child: Column(
          children: [
            ActivityCardWidget(
              title: 'Receive notifications',
              onTap: () {
                pushNotifyModel.togglePushMode();
                // Get.to(() =>const UserProfileDetails());
              },
              isTrailingTrue: true,
              swicthValue: pushNotifyModel.isPushSet,
              isSwitchBtn: true,
              hideLeadingIcon: true,
             
            ),
            const Divider(
              thickness: 0.1,
            ),
            ActivityCardWidget(
              title: 'Login with biometric',
              onTap: () {
                fingerPrintModel.toggleFingerPrintMode();
              },
              isTrailingTrue: true,
              swicthValue: fingerPrintModel.isFingerPrint,
              isSwitchBtn: true,
              hideLeadingIcon: true,
            ),
            const Divider(
              thickness: 0.1,
            ),
            ActivityCardWidget(
              title: 'Change password',
              onTap: () {
                Get.to(()=> ChangePasswordPage());
              },
              isTrailingTrue: true,
              swicthValue: false,
              isSwitchBtn: false,
              hideLeadingIcon: true,
              trailingIcon: Icon(
                Icons.arrow_forward_ios_outlined,
                size: 14.w,
              ),
            ),
            const Divider(
              thickness: 0.1,
            ),
          ],
        ));
  }
}
