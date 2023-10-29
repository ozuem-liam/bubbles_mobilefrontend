import 'package:bubbles/utils/constvalues.dart';
import 'package:bubbles/widgets/image_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart' as getx;

class HistorySelectedDetailsCheckout extends StatelessWidget {
  const HistorySelectedDetailsCheckout({super.key});

  @override
  Widget build(BuildContext context) {
    final styleTheme = Theme.of(context).primaryTextTheme.headlineMedium!;
    return Scaffold(
      body: SafeArea(
          minimum: EdgeInsets.symmetric(horizontal: generalHorizontalPadding.w),
          child: Column(
            children: [
              const Gap(20),
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
                    "Order details",
                    style: styleTheme.copyWith(
                        fontWeight: FontWeight.bold, fontSize: 23),
                  ),
                ],
              ),
              const Gap(20),
              Container(
                height: 200,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color(0xff525355).withAlpha(60),
                  ),
                  borderRadius: BorderRadius.circular(15.r),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Transaction ID",
                            style: styleTheme.copyWith(
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "#287393720",
                            style: styleTheme,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Order date",
                            style: styleTheme.copyWith(
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "9/06/23 - 12/06/23",
                            style: styleTheme,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Shop",
                            style: styleTheme.copyWith(
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Blazing glory",
                            style: styleTheme,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Total cost",
                            style: styleTheme.copyWith(
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "N2,600",
                            style: styleTheme.copyWith(
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const SvgImage(asset: "assets/svgs/wash.svg"),
                              const Gap(10),
                              Text(
                                "Wash",
                                style: styleTheme.copyWith(
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              const SvgImage(asset: "assets/svgs/shirt.svg"),
                              const Gap(10),
                              Text(
                                "1",
                                style: styleTheme.copyWith(
                                    fontWeight: FontWeight.bold),
                              ),
                              const Gap(10),
                              const SvgImage(asset: "assets/svgs/pant.svg"),
                              const Gap(10),
                              Text(
                                "1",
                                style: styleTheme.copyWith(
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }
}
