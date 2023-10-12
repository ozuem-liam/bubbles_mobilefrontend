import 'package:bubbles/core/application/strings.dart';
import 'package:bubbles/features/customer/views/home/watch/presentation/add_item_wash.dart';
import 'package:bubbles/features/customer/views/home/watch/presentation/widget/selected_wash.dart';
import 'package:bubbles/style/appColors.dart';
import 'package:bubbles/widgets/custom_button.dart';
import 'package:bubbles/widgets/image_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart' as getx;

class SlectedIron extends StatelessWidget {
  const SlectedIron({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) => Container(
                  decoration: BoxDecoration(
                    color: AppColors.gray.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(15.r),
                  ),
                  child: Theme(
                    data: Theme.of(context)
                        .copyWith(dividerColor: Colors.transparent),
                    child: ExpansionTile(
                      key: Key(index.toString()), //attention
                      initiallyExpanded: index == index,
                      leading: const SvgImage(
                        asset: MyStrings.washApealIcons,
                        color: Colors.black,
                        height: 20,
                        width: 20,
                      ),
                      title: Text(
                        MyStrings.washApeal,
                        style:
                            Theme.of(context).primaryTextTheme.headlineMedium!,
                      ),
                      childrenPadding:
                          const EdgeInsets.symmetric(horizontal: 10),
                      children: List.generate(
                        2,
                        (index) => const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: CartWidget(),
                        ),
                      ).toList(),
                    ),
                  ),
                ),
            separatorBuilder: (context, index) => const Gap(20),
            itemCount: 1),
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
              "N3,000",
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
              "3 days",
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
              getx.Get.to(() => const AddItemWash());
            }),
      ],
    );
  }
}
