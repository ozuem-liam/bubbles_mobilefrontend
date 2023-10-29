import 'package:bubbles/features/customer/views/home/order_Navgivation/widgets/history_selected_details.dart';
import 'package:bubbles/widgets/image_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart' as getx;

class HistorySelected extends StatelessWidget {
  const HistorySelected({super.key});

  @override
  Widget build(BuildContext context) {
    final styleTheme = Theme.of(context).primaryTextTheme.headlineMedium!;
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            getx.Get.to(() => const HistorySelectedDetailsCheckout());
          },
          child: Container(
            height: 100,
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
                        "Shirt (2), Trouser (1), Socks (1)",
                        style: styleTheme.copyWith(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "#287393730",
                        style: styleTheme,
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const SvgImage(asset: "assets/svgs/wash.svg"),
                          const Gap(5),
                          Text(
                            "Wash (4) : N2,600",
                            style: styleTheme,
                          ),
                        ],
                      ),
                      Text(
                        "12/06/23",
                        style: styleTheme,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        const Gap(20),
        Container(
          height: 100,
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
                      "Shirt (2), Trouser (1), Socks (1)",
                      style: styleTheme.copyWith(fontWeight: FontWeight.bold),
                    ),
                    Text("#287393720", style: styleTheme)
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const SvgImage(asset: "assets/svgs/self_wash.svg"),
                        const Gap(5),
                        Text(
                          "Self wash (2hrs) : N4,000",
                          style: styleTheme,
                        ),
                      ],
                    ),
                    Text(
                      "12/06/23",
                      style: styleTheme,
                    ),
                  ],
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
