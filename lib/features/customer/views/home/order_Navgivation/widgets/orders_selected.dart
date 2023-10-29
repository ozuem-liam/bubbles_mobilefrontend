import 'package:bubbles/features/customer/views/home/order_Navgivation/cashout/selected_oreder_details.dart';
import 'package:bubbles/style/appColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart' as getx;

class OrdersSelected extends StatelessWidget {
  const OrdersSelected({super.key});

  @override
  Widget build(BuildContext context) {
    final styleTheme = Theme.of(context).primaryTextTheme.headlineMedium!;
    return Column(
      children: [
        GestureDetector(
          onTap: () => getx.Get.to(() => const SelectedOrdersDetails()),
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
                      Container(
                        height: 30,
                        width: 100,
                        decoration: BoxDecoration(
                          color: AppColors.gray.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            "Processing",
                            style: styleTheme,
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Delivery",
                        style: styleTheme.copyWith(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "N1,000",
                        style: styleTheme.copyWith(fontWeight: FontWeight.bold),
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
                    Container(
                      height: 30,
                      width: 100,
                      decoration: BoxDecoration(
                        color: AppColors.gray.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          "Processing",
                          style: styleTheme,
                        ),
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Delivery",
                      style: styleTheme.copyWith(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "N1,000",
                      style: styleTheme.copyWith(fontWeight: FontWeight.bold),
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
