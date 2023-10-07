import 'package:bubbles/style/appColors.dart';
import 'package:bubbles/widgets/image_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ServiceWidget extends StatelessWidget {
  final ({String image, String title, String discrip, int i}) serviceParam;
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
              Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  color: switch (serviceParam.i) {
                    0 => const Color(0xffCCD7E9),
                    1 => const Color(0xffCCE6E6),
                    2 => const Color(0xffFFE0E6),
                    3 => const Color(0xffFFEDE1),
                    _ => Colors.white,
                  },
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: SvgImage(asset: serviceParam.image),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    serviceParam.title,
                    style: Theme.of(context)
                        .primaryTextTheme
                        .headlineMedium!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    serviceParam.discrip,
                    style: Theme.of(context)
                        .primaryTextTheme
                        .headlineMedium!
                        .copyWith(fontSize: 12.sp),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
