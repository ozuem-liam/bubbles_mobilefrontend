import 'package:bubbles/style/appColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ActionCustomButton extends StatelessWidget {
  final String title;
  final Function onclick;
  final Color? btnColor;
  final Color? titleColor;
  final bool? borderColor;
  final Color? loadingColor;
  final bool isLoading;
  final double? shadow;

  const ActionCustomButton(
      {Key? key,
      required this.title,
      required this.onclick,
      this.btnColor,
      this.titleColor,
      this.borderColor,
      this.loadingColor,
      this.shadow,
      this.isLoading = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onclick(),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 50.h,
        child: Card(
          elevation: shadow?? 0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(7.r)),
          color: btnColor ?? AppColors.primary,
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
                    style: Theme.of(context)
                        .primaryTextTheme
                        .headlineMedium
                        ?.copyWith(
                            color: titleColor ?? AppColors.black,
                            fontWeight: FontWeight.bold,

                            fontSize: 12.sp),
                  ),
          ),
        ),
      ),
    );
  }
}
