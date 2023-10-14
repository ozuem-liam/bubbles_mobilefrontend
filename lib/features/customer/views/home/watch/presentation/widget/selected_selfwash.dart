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

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).primaryTextTheme.headlineMedium!;
    return ValueListenableBuilder(
        valueListenable: selectedIndex,
        builder: (context, value, _) {
          return Column(
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
              ActionCustomButton(
                  title: "Checkout",
                  isLoading: false,
                  onclick: () {
                    FocusScope.of(context).unfocus();
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
