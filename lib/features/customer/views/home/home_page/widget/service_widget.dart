import 'package:bubbles/style/appColors.dart';
import 'package:bubbles/widgets/image_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ServiceWidget extends StatelessWidget {
  final ({String image, String title, String discrip}) serviceParam;
  const ServiceWidget({super.key, required this.serviceParam});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          width: 1.w,
          color: AppColors.lightGrey.withOpacity(0.3),
        ),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 20.w),
        child: SizedBox(
          height: 60,
          width: 170,
          child: Row(
            children: [
              SvgImage(
                asset: serviceParam.image,
                height: 50.w,
                width: 50.w,
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(serviceParam.title,
                      style:
                          Theme.of(context).primaryTextTheme.headlineMedium!),
                  const SizedBox(height: 10),
                  Text(
                    serviceParam.discrip,
                    style: Theme.of(context)
                        .primaryTextTheme
                        .headlineMedium!
                        .copyWith(fontSize: 14.sp),
                  )
                ],
              )
              // SizedBox(height: 10.h),
              // Text(
              //   userType,
              //   textAlign: TextAlign.start,
              //   style: Theme.of(context)
              //       .primaryTextTheme
              //       .headlineMedium!
              //       .copyWith(fontWeight: FontWeight.bold, fontSize: 12.sp),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
