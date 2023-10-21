import 'package:bubbles/features/customer/views/home/checkout/checkout.dart';
import 'package:bubbles/widgets/custom_button.dart';
import 'package:bubbles/widgets/image_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart' as getx;

class SelectedSelfWash extends StatefulWidget {
  const SelectedSelfWash({super.key});

  @override
  State<SelectedSelfWash> createState() => _SelectedSelfWashState();
}

class _SelectedSelfWashState extends State<SelectedSelfWash> {
  final selectedIndex = ValueNotifier<int?>(null);
  final selectdTime = ValueNotifier<int?>(null);

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).primaryTextTheme.headlineMedium!;
    return AnimatedBuilder(
        animation: Listenable.merge([selectedIndex, selectdTime]),
        builder: (context, _) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 200,
                child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (context, index) => Gap(20.w),
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () => selectedIndex.value = index,
                    child: SelfWashWidget(
                      selectedIndex: selectedIndex,
                      style: style,
                      isUnavailable: index == 1 ? true : false,
                      index: index,
                    ),
                  ),
                  itemCount: 5,
                ),
              ),
              Gap(10.h),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Available time",
                    style: style,
                  ),
                  Gap(5.h),
                  SizedBox(
                    height: 50,
                    child: ListView.separated(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => GestureDetector(
                        onTap: () => selectdTime.value = index,
                        child: Container(
                          width: selectdTime.value != index ? 80 : 100,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: selectdTime.value == index
                                  ? const Color(0xff008080)
                                  : Colors.grey.shade400,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              if (selectdTime.value == index)
                                const Icon(Icons.check),
                              const Gap(5),
                              Text(
                                "10:00 am",
                                style: style.copyWith(
                                    color: selectdTime.value != index
                                        ? Colors.grey.shade400
                                        : Colors.black),
                              )
                            ],
                          ),
                        ),
                      ),
                      separatorBuilder: (context, index) => Gap(15.w),
                      itemCount: 5,
                    ),
                  ),
                  Gap(5.h),
                  Text(
                    "Select as many time slots as you need",
                    style: style,
                  )
                ],
              ),
              Gap(20.h),
              ActionCustomButton(
                  title: "Checkout",
                  isLoading: false,
                  onclick: () {
                    getx.Get.to(() => const CheckOut());
                  }),
            ],
          );
        });
  }
}

class SelfWashWidget extends StatelessWidget {
  const SelfWashWidget(
      {super.key,
      required this.selectedIndex,
      required this.style,
      required this.isUnavailable,
      required this.index});

  final ValueNotifier<int?> selectedIndex;
  final TextStyle style;
  final bool isUnavailable;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 150,
      decoration: BoxDecoration(
        border: Border.all(
          color: selectedIndex.value == index
              ? const Color(0xff008080)
              : Colors.grey.shade400,
        ),
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Column(
        children: [
          isUnavailable
              ? Row(
                  children: [
                    Container(
                      width: 100,
                      height: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15.r),
                          bottomLeft: Radius.circular(5.r),
                          bottomRight: Radius.circular(5.r),
                        ),
                        color: const Color(0xffFFE0E6),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Center(
                          child: Text(
                            "Unavailable",
                            style:
                                style.copyWith(color: const Color(0xffB00020)),
                          ),
                        ),
                      ),
                    )
                  ],
                )
              : const SizedBox(),
          const Spacer(),
          const ImageWidget(
            asset: "assets/images/self_wash_image.png",
          ),
          const Spacer(),
          Text(
            "Manual M1",
            style: style.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const Gap(5),
          Text(
            "N2,000 / hr",
            style: style,
          ),
          const Spacer()
        ],
      ),
    );
  }
}
