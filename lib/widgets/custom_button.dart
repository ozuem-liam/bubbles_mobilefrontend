import 'package:bubbles/style/appColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ActionCustomButton extends StatelessWidget {
  final String title;
  final Function onclick;
  final Color? btnColor;
  final Color? titleColor;
  final Color? borderColor;
  final Color? loadingColor;
  final bool? isOutline;
  final bool isLoading;
  final double? shadow;
  final bool? disabeled;
  final TextStyle? style;

  const ActionCustomButton(
      {Key? key,
      required this.title,
      required this.onclick,
      this.btnColor,
      this.titleColor,
      this.borderColor,
      this.loadingColor,
      this.disabeled = false,
      this.isOutline,
      this.shadow,
      this.style,
      this.isLoading = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: disabeled!
          ? null
          : () {
              FocusScope.of(context).unfocus();
              onclick();
            },
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 50.h,
        child: Card(
          elevation: shadow ?? 0,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(7.r),
              side: isOutline == true
                  ? BorderSide(
                      width: 1.w, color: borderColor ?? AppColors.primary)
                  : BorderSide.none),
          color: disabeled!
              ? btnColor?.withOpacity(0.2) ?? AppColors.primary.withOpacity(0.2)
              : btnColor ?? AppColors.primary,
          child: Center(
            child: isLoading
                ? SizedBox(
                    height: 20.w,
                    width: 20.w,
                    child: CircularProgressIndicator(
                      color: loadingColor ?? AppColors.black,
                    ),
                  )
                : Text(
                    title,
                    style: style ??
                        Theme.of(context)
                            .primaryTextTheme
                            .headlineMedium
                            ?.copyWith(
                                color: titleColor ?? AppColors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 13.sp),
                  ),
          ),
        ),
      ),
    );
  }
}
