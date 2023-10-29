import 'package:bubbles/style/appColors.dart';
import 'package:bubbles/utils/images.dart';
import 'package:bubbles/utils/svgs.dart';
import 'package:bubbles/widgets/image_widgets.dart';
import 'package:bubbles/widgets/single_text_line_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationCardWidget extends ConsumerWidget {
  final String title;
  final String icon;
  final String date;
  final String subtitle;
  final Function accept;
  final Function decline;
  final bool? isActionCards;

  const NotificationCardWidget(
      {required this.title,
      required this.icon,
      required this.date,
      required this.subtitle,
      required this.accept,
      required this.decline,
      this.isActionCards = false,
      super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          border:
              Border.all(width: 0.6, color: AppColors.gray.withOpacity(0.4))),
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 20.w, vertical: 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ListTile(
              minVerticalPadding: 0,
              //horizontalTitleGap: 0,
              isThreeLine: true,
              contentPadding:const EdgeInsets.only(bottom:  0),
              // visualDensity: VisualDensity(
              //   vertical: -4
              // ),
              leading: CircleAvatar(
                radius: 16.r,
                backgroundColor: AppColors.gray.withOpacity(0.2),
                child: const SvgImage(asset: ironIcon),
              ),
              title: SingleTextLineWidget(
                text: title,
                size: 14.sp,
                weight: FontWeight.w300,
              ),
              subtitle: SingleTextLineWidget(
                text: subtitle,
                size: 9.sp,
                weight: FontWeight.w300,
              ),
              trailing: SingleTextLineWidget(
                text: date,
                size: 9.sp,
                weight: FontWeight.w300,
              ),
            ),
            // Visibility(
            //     visible: isActionCards == true ? true : false,
            //     child: Column(
            //       children: [
            //         SizedBox(
            //           height: 3.h,
            //         ),
            //         Container(
            //           height: 36.h,
            //           width: MediaQuery.sizeOf(context).width,
            //           decoration: BoxDecoration(
            //             border: Border.all(
            //               color: AppColors.primary,
            //             ),
            //             borderRadius: BorderRadius.circular(10.r),
            //           ),
            //           child: Row(
            //             children: [
            //               InkWell(
            //                 onTap: () => accept(),
            //                 child: Container(
            //                   width: MediaQuery.sizeOf(context).width / 2.4,
            //                   decoration: BoxDecoration(
            //                       color: AppColors.primary,
            //                       borderRadius: BorderRadius.only(
            //                           topLeft: Radius.circular(8.r),
            //                           bottomLeft: Radius.circular(8.r))),
            //                   child: Center(
            //                     child: Row(
            //                       mainAxisAlignment: MainAxisAlignment.center,
            //                       children: [
            //                         Icon(
            //                           Icons.done,
            //                           color: AppColors.white,
            //                           size: 15.w,
            //                         ),
            //                         SizedBox(
            //                           width: 4.h,
            //                         ),
            //                         SingleTextLineWidget(
            //                           text: "Accept",
            //                           color: AppColors.white,
            //                           size: 13.sp,
            //                         )
            //                       ],
            //                     ),
            //                   ),
            //                 ),
            //               ),
            //               InkWell(
            //                 onTap: () => decline(),
            //                 child: Container(
            //                   width: MediaQuery.sizeOf(context).width / 2.4,
            //                   decoration: BoxDecoration(
            //                       color: AppColors.white,
            //                       borderRadius: BorderRadius.only(
            //                           topRight: Radius.circular(8.r),
            //                           bottomRight: Radius.circular(8.r))),
            //                   child: Center(
            //                     child: Row(
            //                       mainAxisAlignment: MainAxisAlignment.center,
            //                       children: [
            //                         Icon(
            //                           Icons.close,
            //                           color: AppColors.primary,
            //                           size: 15.w,
            //                         ),
            //                         SizedBox(
            //                           width: 4.h,
            //                         ),
            //                         SingleTextLineWidget(
            //                           text: "Decline",
            //                           color: AppColors.primary,
            //                           size: 13.sp,
            //                         )
            //                       ],
            //                     ),
            //                   ),
            //                 ),
            //               ),
            //             ],
            //           ),
            //         )
            //       ],
            //     ))
         
         
         
          ],
        ),
      ),
    );
  }
}
