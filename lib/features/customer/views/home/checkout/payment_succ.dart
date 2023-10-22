import 'package:bubbles/features/customer/views/home/order_Navgivation/cashout/orders_page.dart';
import 'package:bubbles/style/appColors.dart';
import 'package:bubbles/utils/constvalues.dart';
import 'package:bubbles/widgets/custom_button.dart';
import 'package:bubbles/widgets/image_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart' as getx;

class PaymentSuccessfull extends StatelessWidget {
  const PaymentSuccessfull({super.key});

  @override
  Widget build(BuildContext context) {
    final styleTheme = Theme.of(context).primaryTextTheme.headlineMedium!;
    return Scaffold(
      body: SafeArea(
        minimum: EdgeInsets.symmetric(horizontal: generalHorizontalPadding.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(40.h),
            Text(
              "Payment successful",
              style: styleTheme.copyWith(
                  fontWeight: FontWeight.bold, fontSize: 20),
            ),
            const Gap(20),
            Text(
              "N2,600 has been successfully paid to solve all your laundry needs.",
              style: styleTheme,
            ),
            const Gap(20),
            const SvgImage(
              asset: "assets/svgs/pana.svg",
            ),
            const Gap(20),
            ActionCustomButton(
                title: "Track Order",
                isLoading: false,
                onclick: () {
                  getx.Get.to(() => const OrdersPage());
                }),
            const Gap(20),
            ActionCustomButton(
                title: "Home",
                isLoading: false,
                isOutline: true,
                btnColor: Colors.white,
                style: styleTheme.copyWith(
                  color: AppColors.primary,
                  fontWeight: FontWeight.bold,
                ),
                onclick: () {
                  getx.Get.to(() => const PaymentSuccessfull());
                }),
          ],
        ),
      ),
    );
  }
}
