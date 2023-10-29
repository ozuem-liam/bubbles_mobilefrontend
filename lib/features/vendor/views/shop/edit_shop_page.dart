import 'package:bubbles/features/customer/views/authentication/widgets/custom_top_widget.dart';
import 'package:bubbles/features/vendor/views/shop/business_details.dart';
import 'package:bubbles/style/appColors.dart';
import 'package:bubbles/utils/constvalues.dart';
import 'package:bubbles/utils/svgs.dart';
import 'package:bubbles/widgets/custom_appbar.dart';
import 'package:bubbles/widgets/image_widgets.dart';
import 'package:bubbles/widgets/single_text_line_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: depend_on_referenced_packages
import 'package:get/get.dart';

class EditShopPage extends ConsumerWidget {
  const EditShopPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: customAppBar(),
        body: Stack(
          children: [
            const HorizontalTopWidget(
              title: "Edit shop",
            ),
            Padding(
              padding: EdgeInsets.only(top: customTopBarPadding.h - 40),
              child: mainComponent(),
            ),
          ],
        ));
  }

  Widget mainComponent() {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: generalHorizontalPadding.w),
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      children: [
        SizedBox(
          height: 10.h,
        ),
        actionCard(
            title: "Business details", icon: businessDetailsIcon, onTap: () {
              Get.to(()=> BusinessDetailsPage());
            }),
        SizedBox(
          height: 15.h,
        ),
        actionCard(title: "Laundry items", icon: laundryItemcon, onTap: () {}),
        SizedBox(
          height: 15.h,
        ),
        actionCard(title: "Opening hours", icon: clockIcon, onTap: () {}),
      ],
    );
  }

  
  
  Widget actionCard(
      {required String title, required String icon, required Function onTap}) {
    return Card(
      color: AppColors.gray.withOpacity(0.2),
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.r),
      ),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: ListTile(
          onTap: () => onTap(),
          dense: true,
          minLeadingWidth: 1,
          leading: SvgImage(
            asset: icon,
          ),
          title: SingleTextLineWidget(
            text: title,
            size: 14.sp,
          ),
          trailing: Icon(
            Icons.arrow_forward_ios_outlined,
            size: 13.w,
          ),
        ),
      ),
    );
  }
}
