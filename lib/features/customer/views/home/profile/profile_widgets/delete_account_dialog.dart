import 'package:bubbles/widgets/buttons.dart';
import 'package:bubbles/widgets/dialog_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DeleteAccountDialog extends ConsumerWidget {
  const DeleteAccountDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
        // color: Colors.red,
        height: 100.h,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: EdgeInsets.all(15.0.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Are you sure you want to delete your account?',
                  style: Theme.of(context)
                      .primaryTextTheme
                      .headlineMedium!
                      .copyWith(fontSize: 13.sp)),
              SizedBox(
                height: 20.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomTextButton(
                      actionText: 'NO',
                      style: Theme.of(context)
                          .primaryTextTheme
                          .headlineMedium!
                          .copyWith(fontWeight: FontWeight.w500, fontSize: 15.sp),
                      onTap: () {
                        Get.back();
                      }),
                  const SizedBox(width: 70),
                  CustomTextButton(
                      actionText: 'YES',
                      style: Theme.of(context)
                          .primaryTextTheme
                          .headlineMedium!
                          .copyWith(fontWeight: FontWeight.w500, fontSize: 15.sp),
                      onTap: () async {
                        
                      }),
                ],
              )
            ],
          ),
        ));
  }
}

showDeleteDialog({required BuildContext context, required WidgetRef ref}) {
  return DialogWidgets.dialog(
      child: const DeleteAccountDialog(),
      title: "Delete Account",
      context: context,
      ref: ref);
}
