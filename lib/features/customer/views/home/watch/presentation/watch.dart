import 'package:bubbles/core/application/share.dart';
import 'package:bubbles/features/customer/views/home/watch/domain/seleted_extension.dart';
import 'package:bubbles/features/customer/views/home/watch/presentation/widget/selected_dryclean.dart';
import 'package:bubbles/features/customer/views/home/watch/presentation/widget/selected_iron.dart';
import 'package:bubbles/features/customer/views/home/watch/presentation/widget/selected_selfwash.dart';
import 'package:bubbles/features/customer/views/home/watch/presentation/widget/selected_wash.dart';
import 'package:bubbles/features/customer/views/home/watch/presentation/widget/selecting_heading.dart';
import 'package:bubbles/utils/constvalues.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart' as getx;
import 'package:bubbles/style/appColors.dart';
import 'package:bubbles/widgets/image_widgets.dart';

class WashPage extends StatefulWidget {
  const WashPage({super.key});

  @override
  State<WashPage> createState() => _WashPageState();
}

class _WashPageState extends State<WashPage> {
  final intNotifier = GenericValueNotifier(0);
  @override
  Widget build(BuildContext context) {
    final styleTheme = Theme.of(context).primaryTextTheme.headlineMedium!;
    return Scaffold(
      body: ValueListenableBuilder(
          valueListenable: intNotifier,
          builder: (context, value, _) {
            return SafeArea(
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
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14.sp),
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
                                    .copyWith(fontSize: 10.sp),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Container(
                            height: 50,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: AppColors.gray.withOpacity(0.4),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      intNotifier.value =
                                          HeaderStatus.wash.name;
                                    },
                                    child: SelectHeader(
                                      selectedWidget: (
                                        i: 0,
                                        selected: intNotifier.value,
                                        name: "Wash"
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      intNotifier.value =
                                          HeaderStatus.dryclean.name;
                                    },
                                    child: SelectHeader(
                                      selectedWidget: (
                                        i: 1,
                                        selected: intNotifier.value,
                                        name: "Dry clean"
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      intNotifier.value =
                                          HeaderStatus.iron.name;
                                    },
                                    child: SelectHeader(
                                      selectedWidget: (
                                        i: 2,
                                        selected: intNotifier.value,
                                        name: "Iron"
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      intNotifier.value =
                                          HeaderStatus.selfwash.name;
                                    },
                                    child: SelectHeader(
                                      selectedWidget: (
                                        i: 3,
                                        selected: intNotifier.value,
                                        name: "Self wash"
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            child: [
                              const SelectedWash(),
                              const SelectedDryClean(),
                              const SlectedIron(),
                              const SelectedSelfWash()
                            ][intNotifier.value],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }

  @override
  void dispose() {
    intNotifier.dispose();
    super.dispose();
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
