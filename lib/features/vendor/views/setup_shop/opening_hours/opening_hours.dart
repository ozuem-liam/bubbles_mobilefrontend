import 'package:bubbles/features/vendor/providers/shop_service_providers.dart';
import 'package:bubbles/features/vendor/views/setup_shop/setup_completion.dart';
import 'package:bubbles/features/vendor/views/setup_shop/widgets/opening_hours_widget.dart';
import 'package:bubbles/style/appColors.dart';
import 'package:bubbles/utils/constvalues.dart';
import 'package:bubbles/widgets/custom_button.dart';
import 'package:bubbles/widgets/single_text_line_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// ignore: depend_on_referenced_packages
import 'package:get/get.dart';

class OpeningHoursPage extends ConsumerWidget {
  const OpeningHoursPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var viewModel = ref.watch(openingHoursViewModelProvider);
    return Scaffold(
      body: ListView(
          padding:
              const EdgeInsets.symmetric(horizontal: generalHorizontalPadding),
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          children: [
            SizedBox(
              height: 20.h,
            ),
            Row(
              children: [
                Checkbox(
                  value: viewModel.selectAll,
                  onChanged: (val) {
                    viewModel.updateAllDayValue();
                  },
                  activeColor: AppColors.secondary,
                  checkColor: AppColors.white,
                  side: MaterialStateBorderSide.resolveWith((states) {
                    if (states.contains(MaterialState.selected)) {
                      return const BorderSide(
                          color: AppColors.secondary, width: 2);
                    }
                    return null;
                  }),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(2.0),
                  ),
                ),
                SingleTextLineWidget(
                    text: switch (viewModel.selectAll) {
                  true => "Deselect all",
                  false => "Select all"
                }),
              ],
            ),
            Column(
              children: List.generate(viewModel.openingTime.length, (index) {
                var data = viewModel.openingTime[index];
                return OpeningHoursWidget(
                    title: data.name.toString(),
                    onTap: () {
                      viewModel.updateValue(id: data.id);
                    },
                    value: data.value!,
                    trailing: data.value! == true
                        ? Row(
                            children: [
                              OpeningHourDropDown(
                                  item: List.generate(
                                      viewModel.openingHours.length, (index) {
                                    var hours = viewModel.openingHours[index];
                                    return PopupMenuItem<String>(
                                      value: data.openingTime,
                                      onTap: () {
                                        viewModel.updateOpeningTime(
                                            id: data.id, time: hours);
                                      },
                                      child: Text(
                                        "$hours:00 am",
                                        style: Theme.of(context)
                                            .primaryTextTheme
                                            .headlineMedium,
                                      ),
                                    );
                                  }),
                                  value: "${data.openingTime}:00 am"),
                              SizedBox(
                                width: 10.h,
                              ),
                              SingleTextLineWidget(size: 10.sp, text: "to"),
                              SizedBox(
                                width: 10.h,
                              ),
                              OpeningHourDropDown(
                                  item: List.generate(
                                      viewModel.openingHours.length, (index) {
                                    var hours = viewModel.openingHours[index];
                                    return PopupMenuItem<String>(
                                      value: data.closingTime,
                                      onTap: () {
                                        viewModel.updateClosingTime(
                                            id: data.id, time: hours);
                                      },
                                      child: Text(
                                        "$hours:00 pm",
                                        style: Theme.of(context)
                                            .primaryTextTheme
                                            .headlineMedium,
                                      ),
                                    );
                                  }),
                                  value: "${data.closingTime}:00 pm"),
                            ],
                          )
                        : const CLosedHoursWidget());
              }),
            ),
            SizedBox(
              height: 30.h,
            ),
            ActionCustomButton(
                btnColor: AppColors.primary,
                title: "Finish setup",
                isLoading: false,
                onclick: () async {
                  Get.to(() => SetupCompletionPage());
                }),
            SizedBox(
              height: 20.h,
            ),
          ]),
    );
  }
}
