import 'package:bubbles/providers/home_navigation_provider.dart';
import 'package:bubbles/style/appColors.dart';
import 'package:bubbles/utils/constvalues.dart';
import 'package:bubbles/utils/images.dart';
import 'package:bubbles/utils/user_db.dart';
import 'package:bubbles/viewModels/home_vm.dart';
import 'package:bubbles/views/home/home_page/widget/installation_card_widget.dart';
import 'package:bubbles/views/home/home_page/widget/next_payment_card_widget.dart';
import 'package:bubbles/widgets/image_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
    final viewModel = ref.watch(homeViewModel);

    return Scaffold(body: mainComponent(viewModel: viewModel));
  }

  Widget mainComponent({required HomeViewModel viewModel}) {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: generalHorizontalPadding.w),
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      children: [
        SizedBox(
          height: 50.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Hi, ${UserDB.getUser()?.firstName.toString().capitalizeFirst}',
                textAlign: TextAlign.start,
                style: Theme.of(context)
                    .primaryTextTheme
                    .headlineMedium!
                    .copyWith(fontWeight: FontWeight.w500, fontSize: 16.sp)),
            CircleAvatar(
              radius: 17.r,
              backgroundColor: AppColors.gray4,
              backgroundImage: const AssetImage(augustusPic),
            ),
          ],
        ),
        SizedBox(
          height: 30.h,
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InstallationCardWidget(
              hasItem: true,
            ),
            NextPaymentCardWidget(hasItem: true)
          ],
        ),
        SizedBox(
          height: 30.h,
        ),
        Column(
          children: [
            Container(
              height: 170.h,
              width: MediaQuery.sizeOf(context).width,
              decoration: BoxDecoration(
                  color: AppColors.black,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.r),
                      topRight: Radius.circular(10.r))),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Stack(
                  children: [
                    const Positioned(
                        top: 20, left: 80, child: ImageWidget(asset: loopIcon)),
                    Positioned(
                      top: 30,
                      left: 30,
                      bottom: 0,
                      child: Text(
                        "Save million\$ in \ngenerator costs \nannually.",
                        style: Theme.of(context)
                            .primaryTextTheme
                            .headlineMedium!
                            .copyWith(
                                fontSize: 24.sp,
                                height: 1.6,
                                fontWeight: FontWeight.w700,
                                color: AppColors.white),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              height: 50.h,
              width: MediaQuery.sizeOf(context).width,
              decoration: BoxDecoration(
                  color: AppColors.secondary,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10.r),
                      bottomRight: Radius.circular(10.r))),
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: generalHorizontalPadding.w, vertical: 8.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Request quote now",
                      style: Theme.of(context)
                          .primaryTextTheme
                          .headlineMedium!
                          .copyWith(
                              fontWeight: FontWeight.w700, fontSize: 14.sp),
                    ),
                    Icon(
                      Icons.arrow_forward_outlined,
                      size: 18.w,
                    )
                  ],
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
