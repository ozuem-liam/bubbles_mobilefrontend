import 'package:bubbles/features/customer/views/authentication/register_customer.dart';
import 'package:bubbles/widgets/app_logo_widget.dart';
import 'package:bubbles/widgets/buttons.dart';
import 'package:bubbles/widgets/user_type_widget.dart';
import 'package:bubbles/providers/user_type_providers.dart';
import 'package:bubbles/style/appColors.dart';
import 'package:bubbles/utils/constvalues.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bubbles/viewmodels/user_type_vm.dart';

class SelectUserType extends ConsumerWidget {
 const SelectUserType({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var viewModel = ref.watch(userTypeViewModelProvider);

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
                  selectUserType(
                      context: context, viewModel: viewModel),
                  viewModel.selectedUserType == 0
                      ? ResgisterCustomer()
                      : viewModel.selectedUserType == 1
                          ? Container()
                          : const SizedBox()
                ],
              )),
        ],
      ),
    ));
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
          'The smell of fresh laundry is just few steps away.',
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

  Widget selectUserType(
      {required BuildContext context,
      required UserTypeViewModel viewModel}) {
    var userTypes = viewModel.userType();
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
                    padding: const EdgeInsets.only(
                      right: 30,
                    ),
                    child: InkWell(
                      onTap: () {
                        viewModel.selectUserType(value: index);
                      },
                      child: UserTypeWidget(
                          selected: index == viewModel.selectedUserType,
                          image: userTypes[index]['image'],
                          userType: userTypes[index]['user']),
                    ));
              }),
        ),
        Visibility(
            visible: viewModel.selectedUserType == -1,
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
}
