import 'package:bubbles/providers/auth_providrs/auth_providers.dart';
import 'package:bubbles/style/appColors.dart';
import 'package:bubbles/utils/app_info.dart';
import 'package:bubbles/utils/constvalues.dart';
import 'package:bubbles/utils/images.dart';
import 'package:bubbles/viewmodels/auth/auth_vm.dart';
import 'package:bubbles/views/authentication/logout.dart';
import 'package:bubbles/views/home/profile/delete_account.dart';
import 'package:bubbles/views/home/profile/profile_details.dart';
import 'package:bubbles/views/home/settings/settings_page.dart';
import 'package:bubbles/widgets/activity_card_widget.dart';
import 'package:bubbles/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// ignore: depend_on_referenced_packages
import 'package:get/get.dart';

class ProfilePage extends ConsumerStatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProfilePageState();
}

class _ProfilePageState extends ConsumerState<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    var viewModel = ref.watch(userAuthViewModelProvider);
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Stack(
        children: [
          mainComponent(viewModel: viewModel),
        ],
      ),
    );
  }

  Widget mainComponent({required UserAuthViewModel viewModel}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: generalHorizontalPadding),
      child: Column(
        children: [
          SizedBox(
            height: 50.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Account',
                  textAlign: TextAlign.start,
                  style: Theme.of(context)
                      .primaryTextTheme
                      .headlineMedium!
                      .copyWith(fontWeight: FontWeight.w500, fontSize: 20.sp)),
              CircleAvatar(
                radius: 17.r,
                backgroundColor: AppColors.gray4,
                backgroundImage: const AssetImage(augustusPic),
              ),
            ],
          ),
          SizedBox(
            height: 50.h,
          ),
          ActivityCardWidget(
            title: 'My profile',
            onTap: () {
              viewModel.setProfileDetaisl();

              Get.to(() => const UserProfileDetails());
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
          ActivityCardWidget(
            title: 'Settings',
            onTap: () {
              Get.to(() => const SettingsPage());
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
          ActivityCardWidget(
              title: 'Logout',
              onTap: () {
                showLogout(context: context, ref: ref);
              },
              isTrailingTrue: true,
              swicthValue: false,
              isSwitchBtn: false,
              hideLeadingIcon: true,
              trailingIcon: const SizedBox.shrink()),
          const Divider(
            thickness: 0.1,
          ),
          SizedBox(
            height: 50.h,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: WordsButton(
                    firstTextSize: 12.sp,
                    secondTextSize: 12.sp,
                    secondTextColor: AppColors.red,
                    fontWeight2: FontWeight.bold,
                    underline: TextDecoration.underline,
                    textHeight: 2,
                    onTap: () {
                      Get.to(() => const DeleteAccount());
                    },
                    firstText: "",
                    secondText: "Delete account"),
              ),
              SizedBox(
                height: 5.h,
              ),
              Text(appVersion,
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .primaryTextTheme
                      .headlineMedium!
                      .copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize: 10.sp,
                          color: AppColors.gray)),
            ],
          )
        ],
      ),
    );
  }
}
