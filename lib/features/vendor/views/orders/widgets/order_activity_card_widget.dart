import 'package:bubbles/style/appColors.dart';
import 'package:bubbles/utils/images.dart';
import 'package:bubbles/utils/svgs.dart';
import 'package:bubbles/widgets/image_widgets.dart';
import 'package:bubbles/widgets/single_text_line_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderActivityCardWidget extends ConsumerWidget {
  final String title;
  final String icon;
  final String date;
  final String amount;
  final Function onTap;
  final Function accept;
  final Function decline;
  final bool? hasTag;
  final bool? hasActionTags;
  final String? tagText;
  final Color? tagBackgroundColor;
  final Color? tagTextColor;

  const OrderActivityCardWidget(
      {required this.title,
      required this.icon,
      required this.date,
      required this.amount,
      required this.accept,
      required this.onTap,
      required this.decline,
      this.hasTag = false,
      this.hasActionTags = false,
      this.tagText,
      this.tagBackgroundColor,
      this.tagTextColor,
      super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: () => onTap(),
      child: Container(
        width: MediaQuery.sizeOf(context).width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            border:
                Border.all(width: 0.6, color: AppColors.gray.withOpacity(0.4))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Visibility(
              visible: hasTag == true ? true : false,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Container(
                  height: 20.h,
                  width: 55.w,
                  decoration: BoxDecoration(
                      color: tagBackgroundColor ??
                          AppColors.secondary.withOpacity(0.2),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(6.r),
                          bottomRight: Radius.circular(6.r))),
                  child: Center(
                    child: SingleTextLineWidget(
                      text: tagText ?? "",
                      size: 9.sp,
                      color: tagTextColor ?? AppColors.secondary,
                      weight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 20.w),
              leading: CircleAvatar(
                radius: 20.r,
                backgroundColor: AppColors.gray.withOpacity(0.2),
                child: const SvgImage(asset: ironIcon),
              ),
              title: SingleTextLineWidget(
                text: title,
                size: 14.sp,
                weight: FontWeight.w300,
              ),
              subtitle: Row(
                children: [
                  const ItemOrderCount(count: "3", icon: shirtIcon),
                  SizedBox(
                    width: 3.h,
                  ),
                  const ItemOrderCount(count: "1", icon: jeansIcon)
                ],
              ),
              trailing: SizedBox(
                width: MediaQuery.sizeOf(context).width / 4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SingleTextLineWidget(
                      text: date,
                      size: 9.sp,
                      weight: FontWeight.w300,
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    SingleTextLineWidget(
                        text: amount, size: 11.sp, weight: FontWeight.w300),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 3.h,
            ),
            Visibility(
              visible: hasActionTags == true ? true : false,
                child: Container(
              height: 36.h,
              width: MediaQuery.sizeOf(context).width,
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppColors.primary,
                ),
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Row(
                children: [
                  InkWell(
                    onTap: () => accept(),
                    child: Container(
                      width: MediaQuery.sizeOf(context).width / 2.4,
                      decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(8.r),
                              bottomLeft: Radius.circular(8.r))),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.done,
                              color: AppColors.white,
                              size: 15.w,
                            ),
                            SizedBox(
                              width: 4.h,
                            ),
                            SingleTextLineWidget(
                              text: "Accept",
                              color: AppColors.white,
                              size: 13.sp,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () => decline(),
                    child: Container(
                      width: MediaQuery.sizeOf(context).width / 2.4,
                      decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(8.r),
                              bottomRight: Radius.circular(8.r))),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.close,
                              color: AppColors.primary,
                              size: 15.w,
                            ),
                            SizedBox(
                              width: 4.h,
                            ),
                            SingleTextLineWidget(
                              text: "Decline",
                              color: AppColors.primary,
                              size: 13.sp,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}

class ItemOrderCount extends ConsumerWidget {
  final String count;
  final String icon;
  const ItemOrderCount({required this.count, required this.icon, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        ImageWidget(asset: icon, width: 12.w,height: 12.w,),
        SingleTextLineWidget(
          text: count,
          size: 11.sp,
          weight: FontWeight.w300,
        ),
      ],
    );
  }
}
