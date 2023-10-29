import 'package:bubbles/style/appColors.dart';
import 'package:bubbles/utils/svgs.dart';
import 'package:bubbles/widgets/image_widgets.dart';
import 'package:bubbles/widgets/single_text_line_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StatisticsCardWidget extends ConsumerWidget {
  final String title;
  final String amount;
  final String icon;
  const StatisticsCardWidget(
      {required this.title,
      required this.amount,
      required this.icon,
      super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width / 2.5,
      child: Card(
        color: AppColors.gray.withOpacity(0.2),
        margin: EdgeInsets.zero,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
        child: Padding(
          padding: EdgeInsets.all(10.0.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 10.r,
                    backgroundColor: AppColors.gray.withOpacity(0.3),
                    child: Center(
                      child: SvgImage(
                        asset: icon,
                        width: 10.w,
                        height: 10.w,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10.h,
                  ),
                  SingleTextLineWidget(
                    text: title,
                    size: 11.sp,
                  )
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              SingleTextLineWidget(
                text: amount,
                size: 18.sp,
                weight: FontWeight.w300,
              )
            ],
          ),
        ),
      ),
    );
  }
}
