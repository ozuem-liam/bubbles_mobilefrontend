import 'package:bubbles/utils/constvalues.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart' as getx;

class SelectedOrdersDetails extends StatelessWidget {
  const SelectedOrdersDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final styleTheme = Theme.of(context).primaryTextTheme.headlineMedium!;
    return Scaffold(
      body: SafeArea(
        minimum: EdgeInsets.symmetric(horizontal: generalHorizontalPadding.w),
        child: Column(
          children: [
            Gap(20.h),
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
                  "Order details",
                  style: styleTheme.copyWith(
                      fontWeight: FontWeight.bold, fontSize: 22),
                ),
                Gap(20.h),
              ],
            ),
            const Gap(20),
            Stepper(
              steps: [
                Step(
                    isActive: true,
                    label: Container(
                      height: 40,
                      width: 40,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 212, 19, 5),
                      ),
                    ),
                    title: const Text('Account'),
                    content: const Center(
                      child: Text('Account'),
                    )),
                const Step(
                    title: Text('Address'),
                    content: Center(
                      child: Text('Address'),
                    )),
                const Step(
                    title: Text('Confirm'),
                    content: Center(
                      child: Text('Confirm'),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
