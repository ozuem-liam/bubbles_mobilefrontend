import 'package:bubbles/utils/constvalues.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart' as getx;

import 'package:bubbles/style/appColors.dart';

import 'package:bubbles/widgets/image_widgets.dart';

class WashPage extends StatelessWidget {
  const WashPage({super.key});

  @override
  Widget build(BuildContext context) {
    final styleTheme = Theme.of(context).primaryTextTheme.headlineMedium!;
    return Scaffold(
      body: SafeArea(
        right: false,
        child: SingleChildScrollView(
          child: Column(
            children: [
              WashHeader(style: styleTheme),
              const SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: generalHorizontalPadding.w,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Ace Wash",
                          style: Theme.of(context)
                              .primaryTextTheme
                              .headlineMedium!
                              .copyWith(
                                  fontWeight: FontWeight.bold, fontSize: 14.sp),
                        ),
                        Text(
                          "Read reviews",
                          style: Theme.of(context)
                              .primaryTextTheme
                              .headlineMedium!
                              .copyWith(color: AppColors.closeWashReview),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.location_on_outlined,
                          color: Colors.black45,
                          size: 19,
                        ),
                        const SizedBox(width: 10),
                        Text("47, Tarate street, Agege, Lagos",
                            style: Theme.of(context)
                                .primaryTextTheme
                                .headlineMedium!)
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(
                          FontAwesomeIcons.clock,
                          color: Colors.black45,
                          size: 15,
                        ),
                        const SizedBox(width: 10),
                        Text(
                            "Mon - Fri [8am - 5pm], Sat [8am - 4pm], Sun [12pm - 4pm]",
                            style: Theme.of(context)
                                .primaryTextTheme
                                .headlineMedium!
                                .copyWith(fontSize: 10.sp))
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

//header
class WashHeader extends StatelessWidget {
  final TextStyle style;
  const WashHeader({
    Key? key,
    required this.style,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const SizedBox(
          height: 230,
          width: double.infinity,
          child: ImageWidget(
            asset: "assets/png/Wash.png",
            fit: BoxFit.fill,
          ),
        ),
        Padding(
          padding: EdgeInsets.all(generalHorizontalPadding.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () => getx.Get.back(),
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: const Color(0xff525355).withAlpha(155),
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
              Container(
                width: 70,
                height: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  color: AppColors.closeWashColor,
                ),
                child: Center(
                  child: Text(
                    "closed",
                    style: style.copyWith(color: AppColors.closeWashText),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
