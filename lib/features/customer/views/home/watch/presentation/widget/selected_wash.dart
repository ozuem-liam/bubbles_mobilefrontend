import 'package:bubbles/core/application/strings.dart';
import 'package:bubbles/features/customer/views/home/watch/presentation/add_item_wash.dart';
import 'package:bubbles/style/appColors.dart';
import 'package:bubbles/widgets/buttons.dart';
import 'package:bubbles/widgets/custom_button.dart';
import 'package:bubbles/widgets/image_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart' as getx;
import 'package:gap/gap.dart';

class SelectedWash extends StatelessWidget {
  const SelectedWash({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: AppColors.gray.withOpacity(0.5),
            borderRadius: BorderRadius.circular(15.r),
          ),
          child: Theme(
            data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
            child: ExpansionTile(
              leading: const SvgImage(
                asset: MyStrings.washApealIcons,
                color: Colors.black,
              ),
              title: Text(
                MyStrings.washApeal,
                style: Theme.of(context).primaryTextTheme.headlineMedium!,
              ),
              childrenPadding: EdgeInsets.symmetric(horizontal: 10),
              children: List.generate(
                  3,
                  (index) => const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: CartWidget(),
                      )).toList(),
            ),
          ),
        ),
        const Gap(10),
        GestureDetector(
          onTap: () => getx.Get.to(() => const AddItemWash()),
          child: Row(
            children: [
              const Icon(
                Icons.add,
                color: Color(0xff008080),
                size: 30,
              ),
              const Gap(10),
              Text(
                "Add item",
                style: Theme.of(context)
                    .primaryTextTheme
                    .headlineMedium!
                    .copyWith(color: const Color(0xff008080), fontSize: 18),
              )
            ],
          ),
        ),
        const Gap(15),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Total (4)",
              style: Theme.of(context)
                  .primaryTextTheme
                  .headlineMedium!
                  .copyWith(fontSize: 18, fontWeight: FontWeight.w700),
            ),
            Text(
              "N1,600",
              style: Theme.of(context)
                  .primaryTextTheme
                  .headlineMedium!
                  .copyWith(fontSize: 18, fontWeight: FontWeight.w700),
            )
          ],
        ),
        const Gap(15),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Estimated time",
              style: Theme.of(context)
                  .primaryTextTheme
                  .headlineMedium!
                  .copyWith(fontSize: 18, fontWeight: FontWeight.w700),
            ),
            Text(
              "3 - 4 days",
              style: Theme.of(context)
                  .primaryTextTheme
                  .headlineMedium!
                  .copyWith(fontSize: 18, fontWeight: FontWeight.w700),
            )
          ],
        ),
        const Gap(15),
        ActionCustomButton(
            title: "Schedule",
            isLoading: false,
            onclick: () {
              FocusScope.of(context).unfocus();
              // Get.to(() => const HomeNavigation());
            }),
      ],
    );
  }
}

class CartWidget extends StatelessWidget {
  const CartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Container(
        height: 90,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const ImageWidget(
              asset: "assets/images/Shirt.png",
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Top",
                  style: Theme.of(context)
                      .primaryTextTheme
                      .headlineMedium!
                      .copyWith(color: Colors.black),
                ),
                Text(
                  "N1,200",
                  style: Theme.of(context)
                      .primaryTextTheme
                      .headlineMedium!
                      .copyWith(
                          color: Colors.black, fontWeight: FontWeight.bold),
                ),
                Text(
                  "N400 / Item",
                  style: Theme.of(context)
                      .primaryTextTheme
                      .headlineMedium!
                      .copyWith(color: Colors.black),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      border: Border.all(width: 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                      child: Icon(Icons.add),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: Text(
                    "1",
                    style: Theme.of(context)
                        .primaryTextTheme
                        .headlineMedium!
                        .copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 19.sp),
                  ),
                ),
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Center(
                    child: Icon(Icons.add),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
