import 'package:bubbles/style/appColors.dart';
import 'package:bubbles/widgets/image_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MultiCardOptionWidget extends ConsumerWidget {
  final bool isSelected;
  final Function onTap;
  final String icon;
  final String title;

  const MultiCardOptionWidget(
      {required this.isSelected,
      required this.onTap,
      required this.icon,
      required this.title,
      super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      color: isSelected
          ? AppColors.secondary.withOpacity(0.1)
          : Theme.of(context).cardColor,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.r),
          side: BorderSide(
              width: 1.w,
              color: isSelected
                  ? AppColors.secondary
                  : AppColors.termsTextColor.withOpacity(0.4))),
      child: InkWell(
        onTap: () => onTap(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
             mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgImage(
                asset: icon,
              ),
              SizedBox(
                width: 10.h,
              ),
              Text(
                title,
                style: Theme.of(context)
                    .primaryTextTheme
                    .headlineSmall
                    ?.copyWith(fontSize: 12.sp),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
