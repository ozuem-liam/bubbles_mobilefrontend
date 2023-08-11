import 'package:bubbles/style/appColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class QuotesCardWidget extends ConsumerWidget {
  final String title;
  final String kv;
  final String amount;
  final bool isPaid;
  const QuotesCardWidget(
      {required this.title,
      required this.kv,
      required this.amount,
      required this.isPaid,
      super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          // width: 200.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  textAlign: TextAlign.start,
                  style: Theme.of(context)
                      .primaryTextTheme
                      .headlineMedium!
                      .copyWith(fontWeight: FontWeight.w500, fontSize: 12.sp)),
              Text(kv,
                  textAlign: TextAlign.start,
                  style: Theme.of(context)
                      .primaryTextTheme
                      .headlineMedium!
                      .copyWith(fontWeight: FontWeight.w500, fontSize: 8.sp)),
            ],
          ),
        ),
        Row(
          children: [
            SizedBox(
              width: 100.w,
              child: Text(amount,
                  textAlign: TextAlign.start,
                  style: Theme.of(context)
                      .primaryTextTheme
                      .headlineMedium!
                      .copyWith(fontWeight: FontWeight.w500, fontSize: 12.sp)),
            ),
            Card(
              color:
                  isPaid ? AppColors.primary : AppColors.gray.withOpacity(0.2),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 13.w, vertical: 8.h),
                child: Center(
                  child: Text(isPaid ? "Paid" : "Draft",
                      style: Theme.of(context)
                          .primaryTextTheme
                          .headlineMedium!
                          .copyWith(
                              fontWeight: FontWeight.w700, fontSize: 6.sp)),
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
