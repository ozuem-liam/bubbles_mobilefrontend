import 'package:bubbles/features/vendor/views/setup_shop/widgets/shop_category_widgets.dart';
import 'package:bubbles/style/appColors.dart';
import 'package:bubbles/utils/svgs.dart';
import 'package:bubbles/widgets/image_widgets.dart';
import 'package:bubbles/widgets/single_text_line_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SelfWashItemPage extends ConsumerStatefulWidget {
  const SelfWashItemPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SelfWashItemPageState();
}

class _SelfWashItemPageState extends ConsumerState<SelfWashItemPage> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(top: 20.h),
      shape: const RoundedRectangleBorder(),
      color: AppColors.gray.withOpacity(0.1),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 5.h,
            ),
            SingleTextLineWidget(
              text: "Number of machines",
              size: 11.sp,
            ),
            SizedBox(
              height: 13.h,
            ),
            ShopItemWidget(
              padding: EdgeInsets.zero,
              amount: "4",
              icon: apparelsIcon,
              increase: () {},
              decrease: () {},
              title: "Washing machine",
              titleSize: 13.sp,
            ),
            SizedBox(
              height: 20.h,
            ),
            Row(
              children: [
                SingleTextLineWidget(
                  text: "Machine settings",
                  size: 11.sp,
                ),
                SizedBox(
                  width: 10.h,
                ),
                Tooltip(
                    decoration: BoxDecoration(
                      color:  AppColors.white,
                      borderRadius: BorderRadius.circular(5.r)
                    ),
                    textStyle: Theme.of(context)
                        .primaryTextTheme
                        .headlineMedium!
                        .copyWith(fontSize: 12.sp),
                    message: "Machine charges are billed hourly.",
                    preferBelow: false,
                    waitDuration: Duration.zero,
                    showDuration: const Duration(seconds: 4),
                    child: const SvgImage(asset: infoCircleIcon)),
              ],
            )
            //Machine settings
          ],
        ),
      ),
    );
  }
}
