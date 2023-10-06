import 'package:bubbles/features/customer/views/authentication/register_customer.dart';
import 'package:bubbles/features/vendor/views/authentication/register_vendor.dart';
import 'package:bubbles/utils/svgs.dart';
import 'package:bubbles/widgets/app_logo_widget.dart';
import 'package:bubbles/widgets/buttons.dart';
import 'package:bubbles/widgets/user_type_widget.dart';
import 'package:bubbles/style/appColors.dart';
import 'package:bubbles/utils/constvalues.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

var selectAccountTypeProvider = StateProvider.autoDispose<int>((ref) => -1);

class SelectUserType extends ConsumerWidget {
  const SelectUserType({super.key});

  List<Map<String, dynamic>> userType() {
    return [
      {"user": "Customer", "image": customerIcon},
      {"user": "Vendor", "image": vendorIcon}
    ];
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int stateValue = ref.watch(selectAccountTypeProvider);
    var toggleValue = ref.read(selectAccountTypeProvider.notifier);

    Widget selectUserType({required BuildContext context}) {
      var userTypes = userType();
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Select your account type',
            textAlign: TextAlign.start,
            style: Theme.of(context)
                .primaryTextTheme
                .headlineMedium!
                .copyWith(fontWeight: FontWeight.bold, fontSize: 12.sp),
          ),
          SizedBox(height: 10.h),
          SizedBox(
            height: 140.h,
            child: ListView.builder(
                itemCount: userTypes.length,
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                      padding: EdgeInsets.only(
                        right: 30.w,
                      ),
                      child: InkWell(
                        onTap: () {
                          toggleValue.state = index;
                        },
                        child: UserTypeWidget(
                          selected: index == stateValue,
                          image: userTypes[index]['image'],
                          userType: userTypes[index]['user'],
                        ),
                      ));
                }),
          ),
          Visibility(
              visible: stateValue == -1,
              child: Column(
                children: [
                  SizedBox(height: 20.h),
                  WordsButton(
                    secondTextSize: 15.sp,
                    fontWeight2: FontWeight.bold,
                    firstText: 'Have an account?',
                    secondText: 'Log in',
                    secondTextColor: AppColors.secondary,
                    onTap: () {},
                  )
                ],
              ))
        ],
      );
    }

    Widget firstLayer({
      required BuildContext context,
    }) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 50.h),
          const AppLogoWidget(),
          SizedBox(height: 10.h),
          Text(
            'Create account',
            textAlign: TextAlign.start,
            style: Theme.of(context)
                .primaryTextTheme
                .headlineMedium!
                .copyWith(fontWeight: FontWeight.w700, fontSize: 20.sp),
          ),
          SizedBox(height: 10.h),
          Text(
            stateValue == 1
                ? "More patronage is just few steps away."
                : 'The smell of fresh laundry is just few steps away.',
            textAlign: TextAlign.start,
            style: Theme.of(context)
                .primaryTextTheme
                .headlineMedium!
                .copyWith(fontWeight: FontWeight.w300, fontSize: 12.sp),
          ),
          // SizedBox(height: 30.h),
        ],
      );
    }

    return Scaffold(
        body: Padding(
      padding: EdgeInsets.symmetric(horizontal: generalHorizontalPadding.w),
      child: Stack(
        children: [
          firstLayer(context: context),
          Padding(
              padding: EdgeInsets.only(top: 175.h),
              child: ListView(
                padding: EdgeInsets.zero,
                physics: const BouncingScrollPhysics(),
                children: [
                  selectUserType(context: context),
                  stateValue == 0
                      ? ResgisterCustomer()
                      : stateValue == 1
                          ? ResgisterVendor()
                          : const SizedBox()
                ],
              )),
        ],
      ),
    ));
  }
}
