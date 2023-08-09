import 'package:bubbles/style/appColors.dart';
import 'package:bubbles/utils/constvalues.dart';
import 'package:bubbles/views/authentication/widgets/custom_top_widget.dart';
import 'package:bubbles/views/home/profile/profile_widgets/delete_account_dialog.dart';
import 'package:bubbles/widgets/buttons.dart';
import 'package:bubbles/widgets/custom_button.dart';
import 'package:bubbles/widgets/customfield.dart';
import 'package:bubbles/widgets/warning_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final warningProvider = StateProvider.autoDispose<bool>((ref) => true);

class DeleteAccount extends ConsumerWidget {
  const DeleteAccount({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Stack(
        children: [
          SecondCustomTopWidget(
              bgColor: AppColors.white,
              textColor: AppColors.black.withOpacity(0.8),
              iconColor: AppColors.black,
              height: 120.h,
              title: "Delete account",
              isBack: true),
          Padding(
            padding: EdgeInsets.only(top: customTopBarPadding.h - 20),
            child: mainComponent(context: context, ref: ref),
          ),
        ],
      ),
    );
  }

  Widget mainComponent(
      {required BuildContext context, required WidgetRef ref}) {
    bool turnIt = ref.watch(warningProvider);
    return ListView(
      shrinkWrap: true,
      padding: EdgeInsets.symmetric(horizontal: generalHorizontalPadding.w),
      physics: const BouncingScrollPhysics(),
      children: [
        Visibility(
          visible: turnIt,
          child: WarningWidget(
            title:
                'Deleting your account is irreversible. Please proceed with caution',
            bgColor: Colors.red,
            trailing: InkWell(
                onTap: () {
                  ref.read(warningProvider.state).state = !turnIt;
                },
                child: Icon(
                  Icons.close,
                  color: Colors.red,
                  size: 16.w,
                )),
          ),
        ),
        SizedBox(height: 20.h),
        WordsButton(
          onTap: () {},
          firstText: "By selecting",
          secondText: "YES, DELETE MY ACCOUNT",
          thirdText:
              "your RenewableTek account as an installer will be immediately terminated and all your data including your consumers will be lost.",
          secondTextColor: AppColors.black,
          secondTextSize: 13.sp,
          fontWeight2: FontWeight.w600,
        ),
        SizedBox(height: 30.h),
        Text(
          "Please enter ‘Delete my account’ to confirm",
          style: Theme.of(context).primaryTextTheme.headlineMedium!.copyWith(
                fontWeight: FontWeight.w500,
                fontSize: 11.sp,
              ),
        ),
        SizedBox(height: 10.h),
        const CustomField(
          headtext: "Confirmation",
          validate: true,
          // controller: TextEditingController(text: "Augustus Onyekachi"),
        ),
        SizedBox(
          height: 20.h,
        ),
        ActionCustomButton(
            btnColor: AppColors.primary,
            title: "Yes, Delete My Account",
            isLoading: false,
            onclick: () async {
              showDeleteDialog(context: context, ref: ref);
            }),
        SizedBox(height: 20.h),
        ActionCustomButton(
            btnColor: AppColors.secondary,
            title: "Cancel",
            isLoading: false,
            onclick: () async {}),
      ],
    );
  }
}
