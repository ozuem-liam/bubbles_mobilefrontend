import 'dart:io';
import 'package:bubbles/features/customer/views/home/order_Navgivation/cashout/orders_cashout.dart';
import 'package:bubbles/style/appColors.dart';
import 'package:bubbles/utils/constvalues.dart';
import 'package:bubbles/widgets/buttons.dart';
import 'package:bubbles/widgets/custom_button.dart';
import 'package:bubbles/widgets/customfield.dart';
import 'package:bubbles/widgets/image_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart' as getx;

class ScheduleOrdersPage extends StatefulWidget {
  const ScheduleOrdersPage({super.key});

  @override
  State<ScheduleOrdersPage> createState() => _ScheduleOrdersPageState();
}

class _ScheduleOrdersPageState extends State<ScheduleOrdersPage> {
  final now = DateTime.now();
  Duration duration = const Duration(hours: 1, minutes: 23);
  final firstDayOfMonth =
      DateTime(DateTime.now().year, DateTime.now().month, 1);
  final lastDayOfMonth =
      DateTime(DateTime.now().year, DateTime.now().month + 1, 0);

  Future<void> _selectDate(BuildContext context) async {
    if (Platform.isAndroid) {
      final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: now,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101),
      );
    } else {
      showCupertinoModalPopup(
        context: context,
        builder: (_) => Container(
          height: 220,
          color: const Color.fromARGB(255, 255, 255, 255),
          child: Column(
            children: [
              SizedBox(
                height: 180,
                child: CupertinoDatePicker(
                    initialDateTime: DateTime.now(),
                    onDateTimeChanged: (val) {}),
              ),
            ],
          ),
        ),
      );
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    if (Platform.isAndroid) {
      final Timepicked = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
        builder: (context, child) => MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
          child: child!,
        ),
      );
    } else {
      showCupertinoModalPopup(
        context: context,
        builder: (_) => Container(
          height: 220,
          color: const Color.fromARGB(255, 255, 255, 255),
          child: Column(
            children: [
              SizedBox(
                height: 180,
                child: CupertinoTimerPicker(
                    mode: CupertinoTimerPickerMode.hm,
                    initialTimerDuration: duration,
                    onTimerDurationChanged: (Duration newDuration) {
                      setState(() => duration = newDuration);
                    }),
              ),
            ],
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final styleTheme = Theme.of(context).primaryTextTheme.headlineMedium!;
    return Scaffold(
      body: SafeArea(
        minimum: EdgeInsets.symmetric(horizontal: generalHorizontalPadding.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 30.h,
            ),
            Row(
              children: [
                GestureDetector(
                  // onTap: () => getx.Get.back(),
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
                  "Schedule Laundry",
                  style: styleTheme.copyWith(
                      fontWeight: FontWeight.bold, fontSize: 23),
                ),
              ],
            ),
            const Gap(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Date",
                  style: styleTheme.copyWith(fontWeight: FontWeight.bold),
                ),
                IconTextButton(
                  title: "Calendar",
                  textColor: AppColors.accentSucess,
                  icon: Icons.calendar_month,
                  iconColor: AppColors.accentSucess,
                  swapPosition: true,
                  itemSpace: 5,
                  onTap: () {
                    _selectDate(context);
                  },
                )
              ],
            ),
            const Gap(10),
            SizedBox(
              height: 80,
              child: ListView.separated(
                separatorBuilder: (context, index) => const Gap(20),
                scrollDirection: Axis.horizontal,
                itemCount: lastDayOfMonth.day,
                itemBuilder: (context, index) {
                  final currentDate =
                      firstDayOfMonth.add(Duration(days: index));
                  final isCurrentDay = currentDate.day == now.day;

                  return Container(
                    height: 50,
                    width: 60,
                    decoration: BoxDecoration(
                      // color: Colors.red,
                      border: Border.all(
                        color: AppColors.gray,
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          DateFormat('E').format(currentDate),
                          style: styleTheme.copyWith(),
                        ),
                        Text(DateFormat('d').format(currentDate),
                            style: styleTheme.copyWith()),
                      ],
                    ),
                  );
                },
              ),
            ),
            const Gap(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Time",
                  style: styleTheme.copyWith(fontWeight: FontWeight.bold),
                ),
                IconTextButton(
                  title: "Clock",
                  textColor: AppColors.accentSucess,
                  icon: FontAwesomeIcons.clock,
                  iconColor: AppColors.accentSucess,
                  swapPosition: true,
                  itemSpace: 5,
                  onTap: () {
                    _selectTime(context);
                  },
                )
              ],
            ),
            const Gap(20),
            SizedBox(
              height: 50,
              child: ListView.separated(
                separatorBuilder: (context, index) => const Gap(20),
                scrollDirection: Axis.horizontal,
                itemCount: 12,
                itemBuilder: (context, index) {
                  return Container(
                    height: 50,
                    width: 100,
                    decoration: BoxDecoration(
                      // color: Colors.red,
                      border: Border.all(
                        color: AppColors.gray,
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(
                      child: Text(
                        "$index : 00pm",
                        style: styleTheme,
                      ),
                    ),
                  );
                },
              ),
            ),
            const Gap(20),
            Text(
              "Delivery method",
              style: styleTheme.copyWith(fontWeight: FontWeight.bold),
            ),
            const Gap(20),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 60,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColors.gray,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SvgImage(asset: "assets/svgs/deliver_human.svg"),
                        const Gap(10),
                        Text(
                          "Dropoff & Pickup",
                          style: styleTheme,
                        )
                      ],
                    ),
                  ),
                ),
                const Gap(10),
                Expanded(
                  child: Container(
                    height: 60,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColors.gray,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SvgImage(asset: "assets/svgs/deliver_bike.svg"),
                        const Gap(10),
                        Text(
                          "Dispatch",
                          style: styleTheme,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const Gap(20),
            const CustomField(
              headtext: "address",
              allowTypeing: true,
            ),
            const Gap(20),
            ActionCustomButton(
                title: "Checkout",
                isLoading: false,
                onclick: () {
                  getx.Get.to(() => const OrdersCashout());
                })
          ],
        ),
      ),
    );
  }
}
