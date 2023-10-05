import 'package:bubbles/features/vendor/providers/shop_service_providers.dart';
import 'package:bubbles/features/vendor/viewModels/shop_service_vm.dart';
import 'package:bubbles/features/vendor/views/setup_shop/setup_shop.dart';
import 'package:bubbles/features/vendor/views/setup_shop/widgets/multi_card_option_widget.dart';
import 'package:bubbles/style/appColors.dart';
import 'package:bubbles/utils/constvalues.dart';
import 'package:bubbles/utils/logger.dart';
import 'package:bubbles/utils/svgs.dart';
import 'package:bubbles/widgets/custom_appbar.dart';
import 'package:bubbles/widgets/custom_button.dart';
import 'package:bubbles/widgets/customfield.dart';
import 'package:bubbles/widgets/image_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:dotted_border/dotted_border.dart';

class BusinessSetupPage extends ConsumerWidget {
  const BusinessSetupPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<String> serviceList = ref.watch(shopViewModelProvider).serviceList;

    var shopService = ref.read(shopViewModelProvider.notifier);

    List serviceTypes = shopService.serviceType();

    return Scaffold(
      //appBar: customAppBar(),
      body: ListView(
        padding:
            const EdgeInsets.symmetric(horizontal: generalHorizontalPadding),
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        children: [
          SizedBox(
            height: 20.h,
          ),
          DottedBorder(
            borderType: BorderType.RRect,
            radius: Radius.circular(10.r),
            dashPattern: [6.w, 6.w],
            color: Colors.grey,
            strokeWidth: 1,
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.r)),
              child: ListTile(
                visualDensity:
                    const VisualDensity(horizontal: -4, vertical: -2),
                leading: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.r)),
                  color: AppColors.secondary.withOpacity(0.1),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.camera_alt_outlined,
                      size: 14.w,
                      color: AppColors.secondary,
                    ),
                  ),
                ),
                title: Text(
                  "Upload your laundry shop picture",
                  textAlign: TextAlign.start,
                  style: Theme.of(context)
                      .primaryTextTheme
                      .headlineMedium
                      ?.copyWith(
                          //color: AppColors.primary,
                          fontWeight: FontWeight.w500,
                          fontSize: 14.sp),
                ),
                subtitle: Text(
                  "5mb max image size",
                  textAlign: TextAlign.start,
                  style: Theme.of(context)
                      .primaryTextTheme
                      .headlineMedium
                      ?.copyWith(
                          //color: AppColors.primary,
                          fontWeight: FontWeight.w400,
                          fontSize: 10.sp),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          CustomField(
            pIcon: Icon(
              Icons.corporate_fare_outlined,
              size: 16.w,
            ),
            headtext: "Business name",
            validate: true,
            // controller: emailController,
          ),
          SizedBox(
            height: 20.h,
          ),
          CustomField(
            pIcon: Icon(
              Icons.location_on,
              size: 16.w,
            ),
            headtext: "Business street address",
            validate: true,
          ),
          SizedBox(
            height: 20.h,
          ),
          Row(
            children: [
              Expanded(
                child: CustomField(
                  pIcon: Icon(
                    Icons.location_city_outlined,
                    size: 16.w,
                  ),
                  headtext: "State",
                  validate: true,
                  //controller: fullNameController,
                ),
              ),
              SizedBox(
                width: 20.h,
              ),
              Expanded(
                child: CustomField(
                  pIcon: Icon(
                    Icons.location_city_outlined,
                    size: 16.w,
                  ),
                  headtext: "City",
                  validate: true,
                  // controller: userNameController,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          CustomField(
            pIcon: Icon(
              Icons.confirmation_num_outlined,
              size: 16.w,
            ),
            headtext: "CAC number (optional)",
            //controller: referralController,
          ),
          SizedBox(
            height: 20.h,
          ),
          Text(
            "Select all services offered",
            textAlign: TextAlign.start,
            style: Theme.of(context).primaryTextTheme.headlineMedium?.copyWith(
                //color: AppColors.primary,
                fontWeight: FontWeight.bold,
                fontSize: 14.sp),
          ),
          SizedBox(
            height: 20.h,
          ),
          Wrap(
            direction: Axis.horizontal,
            spacing: 10,
            runSpacing: 9,
            children: List.generate(serviceTypes.length, (index) {
              String name = serviceTypes[index]['service'];
              String icon = serviceTypes[index]['icon'];
              return MultiCardOptionWidget(
                isSelected: serviceList.contains(name),
                onTap: () {
                  if (serviceList.contains(name)) {
                    AppLogger.logg("removed");
                    shopService.removeService(name);
                  } else {
                    AppLogger.logg("added");
                    shopService.addService(name);
                  }
                },
                icon: icon,
                title: name,
              );
            }),
          ),
          SizedBox(
            height: 20.h,
          ),
          ActionCustomButton(
              btnColor: AppColors.primary,
              title: "Next",
              isLoading: false,
              onclick: () async {
                shopService.changeSetup(val: 1);
              }),
          SizedBox(
            height: 20.h,
          ),
        ],
      ),
    );
  }
}
