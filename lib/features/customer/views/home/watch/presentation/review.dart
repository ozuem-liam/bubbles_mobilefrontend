import 'package:bubbles/utils/constvalues.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart' as getx;

class WashReview extends StatelessWidget {
  const WashReview({super.key});

  @override
  Widget build(BuildContext context) {
    final styleTheme = Theme.of(context).primaryTextTheme.headlineMedium!;
    return Scaffold(
      body: SafeArea(
          minimum: EdgeInsets.all(generalHorizontalPadding.w),
          child: Column(
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () => getx.Get.back(),
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: const Color(0xff525355).withAlpha(60),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.chevron_left,
                          size: 35,
                        ),
                      ),
                    ),
                  ),
                  const Gap(20),
                  Text(
                    "Read reviews",
                    style: styleTheme.copyWith(
                        fontWeight: FontWeight.bold, fontSize: 23),
                  ),
                  Gap(20.h),
                ],
              ),
              Gap(25.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        "Ace Wash",
                        style: Theme.of(context)
                            .primaryTextTheme
                            .headlineMedium!
                            .copyWith(
                                fontWeight: FontWeight.bold, fontSize: 14.sp),
                      ),
                      const Gap(15),
                      Text(
                        "4.5",
                        style: Theme.of(context)
                            .primaryTextTheme
                            .headlineMedium!
                            .copyWith(
                                color: const Color(0xff525355),
                                fontWeight: FontWeight.bold,
                                fontSize: 14.sp),
                      ),
                      const Gap(5),
                      const Icon(
                        Icons.star,
                        color: Colors.red,
                        size: 20,
                      )
                    ],
                  ),
                  Text(
                    "300 ratings",
                    style: Theme.of(context).primaryTextTheme.headlineMedium!,
                  )
                ],
              ),
              Gap(25.h),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => const ReviewWidget(),
                separatorBuilder: (context, index) => const Gap(20),
                itemCount: 3,
              )
            ],
          )),
    );
  }
}

class ReviewWidget extends StatelessWidget {
  const ReviewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      decoration: BoxDecoration(
        color: const Color(0xff525355).withAlpha(40),
        borderRadius: BorderRadius.circular(7),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Amanda",
                  style: Theme.of(context)
                      .primaryTextTheme
                      .headlineMedium!
                      .copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                RatingBar.builder(
                  itemSize: 20,
                  initialRating: 3,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: EdgeInsets.zero,
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: Colors.red,
                  ),
                  onRatingUpdate: (rating) {},
                ),
              ],
            ),
            Text(
              "This was my best laundry experience, thank you Ace wash!",
              style:
                  Theme.of(context).primaryTextTheme.headlineMedium!.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
            ),
            Text(
              "12/06/23",
              style: Theme.of(context).primaryTextTheme.headlineMedium!,
            )
          ],
        ),
      ),
    );
  }
}
