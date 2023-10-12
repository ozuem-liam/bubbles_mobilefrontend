import 'package:bubbles/core/application/strings.dart';
import 'package:bubbles/features/customer/views/home/watch/presentation/widget/selected_wash.dart';
import 'package:bubbles/style/appColors.dart';
import 'package:bubbles/utils/constvalues.dart';
import 'package:bubbles/widgets/customfield.dart';
import 'package:bubbles/widgets/image_widgets.dart';
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
              ),
              Gap(15.h),
              ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) => Container(
                        decoration: BoxDecoration(
                          color: AppColors.gray.withOpacity(0.5),
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
                              style: Theme.of(context)
                                  .primaryTextTheme
                                  .headlineMedium!,
                            ),
                            childrenPadding:
                                const EdgeInsets.symmetric(horizontal: 10),
                            children: List.generate(
                                3,
                                (index) => Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: SelectingAddItemWidget(
                                        checkboxListTile:
                                            CheckboxListTile.adaptive(
                                          value: false,
                                          onChanged: (v) {},
                                        ),
                                      ),
                                    )).toList(),
                          ),
                        ),
                      ),
                  separatorBuilder: (context, index) => const Gap(20),
                  itemCount: 4)
            ],
          ),
        ),
      ),
    );
  }
}

class SelectingAddItemWidget extends StatelessWidget {
  final CheckboxListTile checkboxListTile;
  const SelectingAddItemWidget({super.key, required this.checkboxListTile});

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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Gap(20),
            const ImageWidget(
              asset: "assets/images/Shirt.png",
            ),
            const Gap(30),
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
            Expanded(
              child: SizedBox(
                height: 40,
                width: 40,
                child: checkboxListTile,
              ),
            )
          ],
        ),
      ),
    );
  }
}
