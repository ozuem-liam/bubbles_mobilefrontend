import 'package:bubbles/style/appColors.dart';
import 'package:bubbles/widgets/image_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationWidget extends StatelessWidget {
  final ({
    String title,
    String des,
    String time,
    String icons
  }) notificationParams;
  const NotificationWidget({super.key, required this.notificationParams});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
          border: Border.all(
            width: 1.w,
            color: AppColors.lightGrey.withOpacity(0.3),
          ),
          borderRadius: BorderRadius.circular(10.r)),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Row(
                children: [
                  Container(
                    height: 60,
                    width: 60,
                    decoration: const BoxDecoration(
                        color: AppColors.lightGrey, shape: BoxShape.circle),
                    child: Center(
                      child: SvgImage(asset: notificationParams.icons),
                    ),
                  ),
                  SizedBox(width: 20.w),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          notificationParams.title,
                          style: Theme.of(context)
                              .primaryTextTheme
                              .headlineMedium!
                              .copyWith(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          notificationParams.des,
                          style: Theme.of(context)
                              .primaryTextTheme
                              .headlineMedium!,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Text(
              notificationParams.time,
              style: Theme.of(context).primaryTextTheme.headlineMedium!,
            )
          ],
        ),
      ),
    );
  }
}
