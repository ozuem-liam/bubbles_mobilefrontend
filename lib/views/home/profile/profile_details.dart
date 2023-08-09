import 'package:bubbles/providers/auth_providrs/auth_providers.dart';
import 'package:bubbles/utils/images.dart';
import 'package:bubbles/viewmodels/auth/auth_vm.dart';
import 'package:bubbles/views/authentication/widgets/custom_top_widget.dart';
import 'package:bubbles/widgets/image_widgets.dart';
import 'package:flutter/services.dart';
import 'package:bubbles/style/appColors.dart';
import 'package:bubbles/utils/constvalues.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bubbles/widgets/custom_button.dart';
import 'package:bubbles/widgets/customfield.dart';

class UserProfileDetails extends ConsumerStatefulWidget {
  const UserProfileDetails({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _UserProfileDetailsState();
}

class _UserProfileDetailsState extends ConsumerState<UserProfileDetails> {
  @override
  Widget build(BuildContext context) {
    var viewModel = ref.watch(userAuthViewModelProvider);
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Stack(
        children: [
          SecondCustomTopWidget(
              bgColor: AppColors.white,
              textColor: AppColors.black.withOpacity(0.8),
              iconColor: AppColors.black,
              height: 120.h,
              title: "My profile",
              isBack: true),
          Padding(
            padding: EdgeInsets.only(top: customTopBarPadding.h - 20),
            child: mainComponent(viewModel: viewModel),
          ),
        ],
      ),
    );
  }

  Widget mainComponent({required UserAuthViewModel viewModel}) {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r),
                  side: BorderSide(color: AppColors.primary, width: 1.w)),
              clipBehavior: Clip.hardEdge,
              child: SizedBox(
                height: 100.w,
                width: 100.w,
                child: const ImageWidget(
                  asset: augustusPic,
                  fit: BoxFit.contain,
                ),  
              ),
            ),
            SizedBox(
              width: 100.w,
              child: InkWell(
                onTap: (){
                  viewModel.uploadbubblesPicture();
                },
                child: Column(
                  children: [
                    Icon(
                      Icons.refresh_rounded,
                      size: 20.w,
                    ),
                    Text(
                      "Change \nprofile image",
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .primaryTextTheme
                          .headlineMedium!
                          .copyWith(fontSize: 12.sp, fontWeight: FontWeight.w600),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
        SizedBox(
          height: 30.h,
        ),
        CustomField(
          headtext: "First name (legal name)",
          validate: true,
          controller: viewModel.firtNameController,
        ),
        SizedBox(
          height: 20.h,
        ),
        CustomField(
          headtext: "Last name",
          validate: true,
          controller:  viewModel.lastNameController,
          textInputFormatters: [
            FilteringTextInputFormatter.deny(RegExp('[ ]')),
          ],
        ),
        SizedBox(
          height: 20.h,
        ),
        CustomField(
          headtext: "Email",
          validate: true,
          controller:  viewModel.emailController,
          textInputFormatters: [
            FilteringTextInputFormatter.deny(RegExp('[ ]')),
          ],
        ),
        SizedBox(
          height: 20.h,
        ),
        CustomField(
          headtext: "Phone Number",
          validate: true,
          controller:  viewModel.phoneController,
          textInputFormatters: [
            FilteringTextInputFormatter.deny(RegExp('[ ]')),
            FilteringTextInputFormatter.digitsOnly,
            FilteringTextInputFormatter.deny(RegExp('^0+')),
            LengthLimitingTextInputFormatter(11)
          ],
        ),
        SizedBox(
          height: 20.h,
        ),
        CustomField(
          headtext: "Address",
          validate: true,
          controller: TextEditingController(
              text: "34, Banana Island Way, Ikoyi, Lagos."),
          textInputFormatters: [
            FilteringTextInputFormatter.deny(RegExp('[ ]')),
          ],
        ),
        SizedBox(
          height: 20.h,
        ),
        CustomField(
          headtext: "Gender",
          validate: true,
          controller: TextEditingController(text: "Male"),
          textInputFormatters: [
            FilteringTextInputFormatter.deny(RegExp('[ ]')),
          ],
        ),
        SizedBox(
          height: 20.h,
        ),
        ActionCustomButton(
            btnColor: AppColors.primary,
            title: "Save changes",
            isLoading: false,
            onclick: () async {}),
      ],
    );
  }
}
