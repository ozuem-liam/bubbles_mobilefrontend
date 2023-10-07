import 'package:bubbles/style/appColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShopeNearYou extends StatelessWidget {
  final ({String name, double rate, String address}) shopNearYouParams;
  const ShopeNearYou({super.key, required this.shopNearYouParams});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        side: BorderSide(
          width: 1.w,
          color: AppColors.lightGrey.withOpacity(0.3),
        ),
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: SizedBox(
        height: 280,
        width: double.infinity,
        child: Column(children: [
          Expanded(
              child: Image.asset(
            "assets/png/Wash.png",
            fit: BoxFit.fill,
          )),
          Container(
            height: 90,
            decoration: const BoxDecoration(color: Colors.white),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      shopNearYouParams.name,
                      style: Theme.of(context)
                          .primaryTextTheme
                          .headlineMedium!
                          .copyWith(
                              fontWeight: FontWeight.bold, fontSize: 16.sp),
                    ),
                    Row(
                      children: [
                        Text(
                          "${shopNearYouParams.rate}",
                          style: Theme.of(context)
                              .primaryTextTheme
                              .headlineMedium!
                              .copyWith(
                                  fontWeight: FontWeight.bold, fontSize: 16.sp),
                        ),
                        const Icon(
                          Icons.star,
                          color: Colors.red,
                        )
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                Row(
                  children: [
                    const Icon(
                      Icons.location_on_outlined,
                      color: Colors.black,
                    ),
                    Text(
                      shopNearYouParams.address,
                      style: Theme.of(context)
                          .primaryTextTheme
                          .headlineMedium!
                          .copyWith(
                              fontWeight: FontWeight.w600, fontSize: 13.sp),
                    )
                  ],
                )
              ]),
            ),
          )
        ]),
      ),
    );
  }
}
