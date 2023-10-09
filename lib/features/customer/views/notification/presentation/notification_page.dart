import 'package:bubbles/core/application/strings.dart';
import 'package:bubbles/features/customer/views/notification/presentation/widget/noti_widget.dart';
import 'package:bubbles/utils/constvalues.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart' as getx;

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: EdgeInsets.symmetric(horizontal: generalHorizontalPadding.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 25.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () => getx.Get.back(),
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
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
                      const SizedBox(width: 20),
                      Text(
                        MyStrings.notification,
                        style: Theme.of(context)
                            .primaryTextTheme
                            .headlineMedium!
                            .copyWith(
                                fontWeight: FontWeight.bold, fontSize: 25),
                      )
                    ],
                  ),
                  const Icon(FontAwesomeIcons.xmark)
                ],
              ),
              SizedBox(height: 30.h),
              Text(
                "Today",
                style: Theme.of(context)
                    .primaryTextTheme
                    .headlineMedium!
                    .copyWith(fontWeight: FontWeight.bold, fontSize: 25),
              ),
              SizedBox(height: 20.h),
              Wrap(
                runSpacing: 15,
                children: List.generate(
                    2,
                    (i) => NotificationWidget(
                          notificationParams: (
                            time: "12:05pm",
                            des:
                                "The dispatch rider has arrived to drop off your clothes",
                            icons: i == 0
                                ? "assets/svgs/bike_noti.svg"
                                : "assets/svgs/noti.svg",
                            title: "Dropoff"
                          ),
                        )),
              ),
              SizedBox(height: 20.h),
              Text(
                "Yesterday",
                style: Theme.of(context)
                    .primaryTextTheme
                    .headlineMedium!
                    .copyWith(fontWeight: FontWeight.bold, fontSize: 25),
              ),
              SizedBox(height: 20.h),
              Wrap(
                runSpacing: 15,
                children: List.generate(
                    2,
                    (i) => NotificationWidget(
                          notificationParams: (
                            time: "12:05pm",
                            des:
                                "The dispatch rider has arrived to drop off your clothes",
                            icons: i == 0
                                ? "assets/svgs/bike_noti.svg"
                                : "assets/svgs/noti.svg",
                            title: "Pickup"
                          ),
                        )),
              ),
              SizedBox(height: 20.h),
              Text(
                "Older",
                style: Theme.of(context)
                    .primaryTextTheme
                    .headlineMedium!
                    .copyWith(fontWeight: FontWeight.bold, fontSize: 25),
              ),
              SizedBox(height: 20.h),
              Wrap(
                runSpacing: 15,
                children: List.generate(
                    1,
                    (i) => const NotificationWidget(
                          notificationParams: (
                            time: "12:05pm",
                            des: "Congrats on your first order! Laundry",
                            icons: "assets/svgs/basket_noti.svg",
                            title: "New laundry bag"
                          ),
                        )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
