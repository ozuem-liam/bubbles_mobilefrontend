import 'package:bubbles/features/customer/views/authentication/widgets/custom_top_widget.dart';
import 'package:bubbles/features/vendor/views/home/notification/notification_card_widget.dart';
import 'package:bubbles/style/appColors.dart';
import 'package:bubbles/style/appCustomPaints.dart';
import 'package:bubbles/utils/constvalues.dart';
import 'package:bubbles/utils/svgs.dart';
import 'package:bubbles/widgets/custom_appbar.dart';
import 'package:bubbles/widgets/single_text_line_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bubbles/widgets/app_bar.dart';

class VendorNotificationPage extends ConsumerStatefulWidget {
  const VendorNotificationPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _VendorNotificationPageState();
}

class _VendorNotificationPageState
    extends ConsumerState<VendorNotificationPage> {
  @override
  Widget build(BuildContext context) {
    // var keyboardVisible = MediaQuery.of(context).viewInsets.bottom == 0;
    return Scaffold(
        appBar: customAppBar(),
        body: Stack(
          children: [
            const CustomTopWidget(
                title: "Notification", subtitle: "", isBack: true),
            Padding(
              padding: EdgeInsets.only(top: customTopBarPadding.h - 20),
              child: mainComponent(),
            ),
          ],
        ));
  }

  Widget mainComponent() {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: generalHorizontalPadding.w),
      children: [
        SizedBox(
          height: 20.h,
        ),
        SingleTextLineWidget(
          text: "Today",
          weight: FontWeight.bold,
          size: 15.sp,
        ),
        SizedBox(
          height: 20.h,
        ),
        NotificationCardWidget(
            title: "Dropoff",
            icon: ironIcon,
            date: "12:05pm",
            subtitle: 'The customer is on his way to drop off clothes',
            accept: () {},
            decline: () {})
      ],
    );
  }
}
