import 'package:bubbles/features/customer/views/home/checkout/payment_succ.dart';
import 'package:bubbles/utils/constvalues.dart';
import 'package:bubbles/widgets/custom_button.dart';
import 'package:bubbles/widgets/image_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart' as getx;

class OrdersCashout extends StatelessWidget {
  const OrdersCashout({super.key});

  @override
  Widget build(BuildContext context) {
    final styleTheme = Theme.of(context).primaryTextTheme.headlineMedium!;
    return Scaffold(
      body: SafeArea(
        minimum: EdgeInsets.symmetric(horizontal: generalHorizontalPadding.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                      color: const Color(0xff525355).withAlpha(40),
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
                  "Checkout",
                  style: styleTheme.copyWith(
                      fontWeight: FontWeight.bold, fontSize: 23),
                ),
                Gap(20.h),
              ],
            ),
            const Gap(30),
            Text(
              "Order Summary",
              style: styleTheme.copyWith(
                  fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const Gap(20),
            Container(
              height: 270,
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
                          style:
                              styleTheme.copyWith(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "#287393720",
                          style:
                              styleTheme.copyWith(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Order date",
                          style:
                              styleTheme.copyWith(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "13/07/23",
                          style:
                              styleTheme.copyWith(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Estimated pickup time",
                          style:
                              styleTheme.copyWith(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "12:00 pm",
                          style:
                              styleTheme.copyWith(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Estimated dropoff date",
                          style:
                              styleTheme.copyWith(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "13/07/23",
                          style:
                              styleTheme.copyWith(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Delivery method",
                          style:
                              styleTheme.copyWith(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Dispatch",
                          style:
                              styleTheme.copyWith(fontWeight: FontWeight.bold),
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
                            const SvgImage(asset: "assets/svgs/wash.svg"),
                            const Gap(10),
                            Text(
                              "3",
                              style: styleTheme.copyWith(
                                  fontWeight: FontWeight.bold),
                            ),
                            const Gap(10),
                            const SvgImage(asset: "assets/svgs/wash.svg"),
                            const Gap(10),
                            Text(
                              "2",
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
            ),
            const Gap(20),
            Text(
              "Payment Summary",
              style: styleTheme.copyWith(
                  fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const Gap(10),
            Container(
              height: 150,
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
                          "Cost (4)",
                          style:
                              styleTheme.copyWith(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "N1,600",
                          style:
                              styleTheme.copyWith(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Delivery",
                          style:
                              styleTheme.copyWith(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "N1,000",
                          style:
                              styleTheme.copyWith(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total",
                          style:
                              styleTheme.copyWith(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "N2,600",
                          style:
                              styleTheme.copyWith(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(),
            ActionCustomButton(
                title: "Pay N2,600",
                isLoading: false,
                onclick: () {
                  getx.Get.to(() => const PaymentSuccessfull());
                }),
          ],
        ),
      ),
    );
  }
}
