import 'package:bubbles/providers/home_navigation_provider.dart';
import 'package:bubbles/style/appColors.dart';
import 'package:bubbles/utils/constvalues.dart';
import 'package:bubbles/utils/user_db.dart';
import 'package:bubbles/viewModels/home_vm.dart';
import 'package:bubbles/widgets/image_widgets.dart';
// import 'package:bubbles/features/customer/views/home/home_page/widget/installation_card_widget.dart';
// import 'package:bubbles/features/customer/views/home/home_page/widget/next_payment_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    final styleTheme = Theme.of(context).primaryTextTheme.headlineMedium!;
    final viewModel = ref.watch(homeViewModel);

    return Scaffold(
        body: mainComponent(viewModel: viewModel, styleTheme: styleTheme));
  }

  Widget mainComponent(
      {required HomeViewModel viewModel, TextStyle? styleTheme}) {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: generalHorizontalPadding.w),
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      children: [
        const SizedBox(height: 70),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Hi, ${UserDB.getUser()?.firstName.toString().capitalizeFirst ?? "User"}',
              textAlign: TextAlign.start,
              style: Theme.of(context)
                  .primaryTextTheme
                  .headlineMedium!
                  .copyWith(fontWeight: FontWeight.w500, fontSize: 16.sp),
            ),
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(10),
              ),
            )
          ],
        ),
        const SizedBox(height: 10),
        Text(
          "Find laundry shops closeby",
          style: Theme.of(context)
              .primaryTextTheme
              .headlineMedium!
              .copyWith(fontWeight: FontWeight.bold, fontSize: 20.sp),
        ),
        SizedBox(height: 10.sp),

        Container(
          height: 100,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            // ,
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                spreadRadius: -7,
                blurRadius: 10,
                offset: Offset(-10, 1), // changes position of shadow
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const SvgImage(asset: "assets/svgs/Basket.svg"),
                        const SizedBox(width: 10),
                        Text(
                          "Hurray! It’s a success!",
                          style: styleTheme!.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 18.sp,
                          ),
                        )
                      ],
                    ),
                    // ignore: deprecated_member_use
                    const Icon(FontAwesomeIcons.times),
                  ],
                ),
                const SizedBox(height: 20),
                Text(
                  "Thanks for joining bubbles, a laundry bag will be delivered to you on your first order.",
                  style: styleTheme.copyWith(),
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),
        Text(
          "Services",
          style: styleTheme.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: 18.sp,
          ),
        )
        // const Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //   children: [
        //     InstallationCardWidget(
        //       hasItem: true,
        //     ),
        //     NextPaymentCardWidget(hasItem: true)
        //   ],
        // ),
        // SizedBox(
        //   height: 30.h,
        // ),
      ],
    );
  }
}
