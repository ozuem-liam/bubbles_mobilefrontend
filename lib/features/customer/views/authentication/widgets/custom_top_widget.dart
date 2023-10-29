import 'package:bubbles/style/appColors.dart';
import 'package:bubbles/utils/constvalues.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// ignore: depend_on_referenced_packages
import 'package:get/get.dart';

class CustomTopWidget extends ConsumerWidget {
  final String title;
  final String subtitle;
  final bool isBack;
  final Color? bgColor;
  final Color? textColor;
  final Color? iconColor;
  final double? height;
  final Function? onTap;
  final bool? isNavigation;
  const CustomTopWidget(
      {required this.title,
      required this.subtitle,
      required this.isBack,
      this.bgColor,
      this.textColor,
      this.iconColor,
      this.height,
      this.isNavigation = true,
      this.onTap,
      super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: height ?? 120.h,
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
          color: bgColor ?? Theme.of(context).scaffoldBackgroundColor),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: generalHorizontalPadding.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 40.h,
              child: Visibility(
                  visible: isBack == false ? false : true,
                  child: InkWell(
                      onTap: () {
                        if (isNavigation == true) {
                          Get.back();
                        } else {
                          onTap!();
                        }
                      },
                      child: Card(
                        color: Theme.of(context).canvasColor.withOpacity(0.1),
                        shape: RoundedRectangleBorder(
                            // side: BorderSide(width: 0.5.w),
                            borderRadius: BorderRadius.circular(10.r)),
                        child: Padding(
                          padding: EdgeInsets.all(10.0.w),
                          child: Icon(
                            Icons.arrow_back_ios,
                            color: Theme.of(context)
                                .iconTheme
                                .color!
                                .withOpacity(0.7),
                            size: 17.sp,
                            // color: iconColor ?? AppColors.white,
                          ),
                        ),
                      ))),
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              title,
              style:
                  Theme.of(context).primaryTextTheme.headlineMedium!.copyWith(
                      // color: textColor ?? AppColors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 28.sp),
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              subtitle,
              style:
                  Theme.of(context).primaryTextTheme.headlineMedium!.copyWith(
                      // color: textColor ?? AppColors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 12.sp),
            ),
            SizedBox(
              height: 16.h,
            ),
          ],
        ),
      ),
    );
  }
}

class HorizontalTopWidget extends ConsumerWidget {
  final String title;
  final Color? bgColor;
  final Color? textColor;
  final Color? iconColor;
  const HorizontalTopWidget(
      {required this.title,
      this.bgColor,
      this.textColor,
      this.iconColor,
      super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(
          color: bgColor ?? Theme.of(context).scaffoldBackgroundColor),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 40.h,
              child: InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Card(
                    color: Theme.of(context).canvasColor.withOpacity(0.1),
                    shape: RoundedRectangleBorder(
                        // side: BorderSide(width: 0.5.w),
                        borderRadius: BorderRadius.circular(10.r)),
                    child: Padding(
                      padding: EdgeInsets.all(10.0.w),
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: Theme.of(context)
                            .iconTheme
                            .color!
                            .withOpacity(0.7),
                        size: 17.sp,
                        // color: iconColor ?? AppColors.white,
                      ),
                    ),
                  )),
            ),
            SizedBox(
              width: 10.h,
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.h),
              child: Text(
                title,
                style:
                    Theme.of(context).primaryTextTheme.headlineMedium!.copyWith(
                        // color: textColor ?? AppColors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.sp),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SecondCustomTopWidget extends ConsumerWidget {
  final String title;
  final bool isBack;
  final Color? bgColor;
  final Color? textColor;
  final Color? iconColor;
  final double? height;
  final Function? onTap;
  const SecondCustomTopWidget(
      {required this.title,
      required this.isBack,
      this.bgColor,
      this.textColor,
      this.iconColor,
      this.height,
      this.onTap,
      super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: height ?? 100.h,
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(color: bgColor ?? AppColors.black),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: generalHorizontalPadding.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 10.h,
            ),
            SizedBox(
              height: 30.h,
              child: Visibility(
                  visible: isBack == false ? false : true,
                  child: InkWell(
                      onTap: () {
                        onTap!() ?? Get.back();
                      },
                      child: Icon(
                        Icons.arrow_back_rounded,
                        color: iconColor ?? AppColors.white,
                      ))),
            ),
            SizedBox(
              height: 2.h,
            ),
            Text(
              title,
              style: Theme.of(context)
                  .primaryTextTheme
                  .headlineMedium!
                  .copyWith(
                      color: textColor ?? AppColors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 22.sp),
            ),
          ],
        ),
      ),
    );
  }
}
