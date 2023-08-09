import 'package:bubbles/style/appColors.dart';
import 'package:bubbles/utils/svgs.dart';
import 'package:bubbles/widgets/image_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HelpIcon extends ConsumerWidget {
  const HelpIcon({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 45.h, 30.w, 0),
      child: Align(
          alignment: Alignment.topRight,
          child: InkWell(
            onTap: () {},
            child: SvgImage(
              asset: helpIcon,
              color: AppColors.white,
              height: 27.w,
              width: 27.w,
            ),
          )),
    );
  }
}
