import 'package:bubbles/style/appColors.dart';
import 'package:bubbles/utils/svgs.dart';
import 'package:bubbles/widgets/image_widgets.dart';
import 'package:bubbles/widgets/single_text_line_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CompletedOrderCardWidget extends ConsumerWidget {
  final String title;
  final String serviceType;
  final String quantity;
  final String amount;
  final String date;
  final Function onTap;
  const CompletedOrderCardWidget(
      {required this.title,
      required this.serviceType,
      required this.quantity,
      required this.amount,
      required this.date,
      required this.onTap,
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
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SingleTextLineWidget(
                text: title,
                size: 15.sp,
                weight: FontWeight.w300,
              ),
              SizedBox(
                height: 15.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const SvgImage(asset: washIcon),
                      SizedBox(
                        width: 5.h,
                      ),
                      Row(
                        children: [
                          SingleTextLineWidget(
                            text: "$serviceType ($quantity) :",
                            size: 11.sp,
                            weight: FontWeight.w300,
                          ),
                          SizedBox(
                            width: 2.h,
                          ),
                          SingleTextLineWidget(
                            text: amount,
                            size: 11.sp,
                            weight: FontWeight.w300,
                          ),
                        ],
                      ),
                    ],
                  ),
                  SingleTextLineWidget(
                    text: date,
                    size: 11.sp,
                    weight: FontWeight.w300,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
