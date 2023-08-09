import 'package:bubbles/style/appColors.dart';
import 'package:bubbles/utils/constvalues.dart';
import 'package:bubbles/views/home/quotes/widgets/quotes_card.dart';
import 'package:bubbles/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class QuotesPage extends ConsumerWidget {
  const QuotesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        body: Column(
      children: [
        SizedBox(
          height: 50.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: generalHorizontalPadding.w),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Quotes',
                      textAlign: TextAlign.start,
                      style: Theme.of(context)
                          .primaryTextTheme
                          .headlineMedium!
                          .copyWith(
                              fontWeight: FontWeight.w500, fontSize: 20.sp)),
                  IconTextButton(
                    title: "New quote",
                    icon: Icons.add,
                    iconColor: AppColors.black,
                    itemSpace: 6.w,
                    textSize: 12.sp,
                    onTap: () {},
                    swapPosition: true,
                  )
                ],
              ),
              SizedBox(
                height: 30.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    //width: 200.w,
                    child: Text('PACKAGE',
                        textAlign: TextAlign.start,
                        style: Theme.of(context)
                            .primaryTextTheme
                            .headlineMedium!
                            .copyWith(
                                fontWeight: FontWeight.w500, fontSize: 8.sp)),
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 100.w,
                        child: Text('AMOUNT',
                            textAlign: TextAlign.start,
                            style: Theme.of(context)
                                .primaryTextTheme
                                .headlineMedium!
                                .copyWith(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 8.sp)),
                      ),
                      Text('STATUS',
                          textAlign: TextAlign.start,
                          style: Theme.of(context)
                              .primaryTextTheme
                              .headlineMedium!
                              .copyWith(
                                  fontWeight: FontWeight.w500, fontSize: 8.sp)),
                      SizedBox(
                        width: 7.h,
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
        Expanded(
          child: ListView(
            padding:
                EdgeInsets.symmetric(horizontal: generalHorizontalPadding.w),
            children: [
              const QuotesCardWidget(
                  title: "Barbing Salon",
                  kv: "1kWh",
                  amount: "N240,000",
                  isPaid: true),
              SizedBox(
                height: 20.h,
              ),
              const QuotesCardWidget(
                  title: "Mobile Money Agent",
                  kv: "5kWh",
                  amount: "N370,000",
                  isPaid: false),
              SizedBox(
                height: 20.h,
              ),
              const QuotesCardWidget(
                  title: "Pharmacy",
                  kv: "10kWh",
                  amount: "N2,340,000",
                  isPaid: false),
              SizedBox(
                height: 20.h,
              ),
              const QuotesCardWidget(
                  title: "Poultry Farm",
                  kv: "100kWh",
                  amount: "N25,740,000",
                  isPaid: true),
              SizedBox(
                height: 20.h,
              ),
            ],
          ),
        )
      ],
    ));
  }
}
