
import 'package:bubbles/providers/onboarding_provider.dart';
import 'package:bubbles/style/appColors.dart';
import 'package:bubbles/style/appCustomPaints.dart';
import 'package:bubbles/style/scaffold_overider.dart';
import 'package:bubbles/utils/constvalues.dart';
import 'package:bubbles/views/onboarding/stepper_screen.dart';
import 'package:bubbles/widgets/custom_button.dart';
import 'package:bubbles/widgets/image_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// ignore: depend_on_referenced_packages
import 'package:get/get.dart';

class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    var viewModel = ref.watch(onbaordingProvider);
    var onbaordingData = viewModel.onboardingvalue();

    return ScaffoldOverider(
      child: Scaffold(
        body: Stack(
          clipBehavior: Clip.none,
          fit: StackFit.passthrough,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: CustomPaint(
                size: Size(customPaintSizeValue,
                    (customPaintSizeValue * customPaintTop).toDouble()),
                painter: TopRightRPSCustomPainter(),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: CustomPaint(
                size: Size(customPaintSizeValue,
                    (customPaintSizeValue * customPaintBottom).toDouble()),
                painter: RPSCustomPainterNew(),
              ),
            ),
            Column(
              children: [
                Expanded(
                  flex: 5,
                  child: PageView.builder(
                      itemCount: onbaordingData.length,
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SvgImage(
                                asset: onbaordingData[index]['icon'],
                                height: 100.w,
                                width: 100.w,
                               // color: AppColors.primary,
                              ),
    
                              SizedBox(
                                height: 30.h,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20.w),
                                child: Text(
                                  onbaordingData[index]['title'],
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context)
                                      .primaryTextTheme
                                      .headlineMedium
                                      ?.copyWith(
                                          color: AppColors.primary,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14.sp, height: 1.5),
                                ),
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 30.w),
                                child: Text(
                                  onbaordingData[index]['subtitle'],
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context)
                                      .primaryTextTheme
                                      .headlineMedium
                                      ?.copyWith(
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                ),
                              ),
    
                              SizedBox(
                                height: 70.h,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: List.generate(
                                    onbaordingData.length,
                                    (indicatorIndex) => Container(
                                          margin: EdgeInsets.all(5.w),
                                          height: 5.w,
                                          width: indicatorIndex == index
                                              ? 10.w
                                              : 7.w,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  indicatorIndex == index
                                                      ? BorderRadius.circular(2.w)
                                                      : null,
                                              shape: indicatorIndex == index
                                                  ? BoxShape.rectangle
                                                  : BoxShape.circle,
                                              color: indicatorIndex == index
                                                  ? AppColors.primary
                                                  : AppColors.lightGrey),
                                        )),
                              ),
    
                              // const Spacer(),
                            ],
                          ),
                        );
                      }),
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: buttonPadding.w),
                    child: Column(
                      children: [
                        ActionCustomButton(
                          title: "GET STARTED",
                          onclick: () {
                            Get.to(() => const StepperScreen());
                          },
                          btnColor: AppColors.white,
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
