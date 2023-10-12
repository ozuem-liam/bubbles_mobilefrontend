import 'package:bubbles/style/appColors.dart';
import 'package:bubbles/utils/constvalues.dart';
import 'package:bubbles/widgets/customfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart' as getx;

class AddItemWash extends StatelessWidget {
  const AddItemWash({super.key});

  @override
  Widget build(BuildContext context) {
    final styleTheme = Theme.of(context).primaryTextTheme.headlineMedium!;
    return Scaffold(
      body: SafeArea(
        minimum: EdgeInsets.all(generalHorizontalPadding.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Gap(10),
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
                    "Add item",
                    style: styleTheme.copyWith(
                        fontWeight: FontWeight.bold, fontSize: 23),
                  )
                ],
              ),
              Gap(15.h),
              GestureDetector(
                // onTap: () => Get.to(() => const HomeSearch()),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1.5.w,
                      color: AppColors.lightGrey.withOpacity(0.6),
                    ),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: const CustomField(
                    headtext: "search",
                    pIcon: Icon(Icons.search),
                    allowTypeing: false,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
