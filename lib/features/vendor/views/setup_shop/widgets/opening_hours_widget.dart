import 'package:bubbles/style/appColors.dart';
import 'package:bubbles/widgets/buttons.dart';
import 'package:bubbles/widgets/single_text_line_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OpeningHoursWidget extends ConsumerWidget {
  final String title;
  final Function onTap;
  final bool value;
  final Widget trailing;
  const OpeningHoursWidget(
      {required this.title,
      required this.onTap,
      required this.value,
      required this.trailing,
      super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CheckBoxCustomWidget(title: title, value: value, onTap: () => onTap()),
        SizedBox(
          child: trailing,
        )
      ],
    );
  }
}

class CLosedHoursWidget extends ConsumerWidget {
  const CLosedHoursWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      shape: RoundedRectangleBorder(
          side: BorderSide(color: AppColors.gray.withOpacity(0.3)),
          borderRadius: BorderRadius.circular(6.r)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
        child:  SingleTextLineWidget(text: "Closed", size: 10.sp,),
      ),
    );
  }
}

class OpeningHourDropDown extends ConsumerWidget {
  final String? valuePlaceHolder;
  final String? value;
  final List<PopupMenuItem<String>> item;

  const OpeningHourDropDown(
      {this.valuePlaceHolder,
      required this.item,
      required this.value,
      super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PopupMenuButton<String>(
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
      position: PopupMenuPosition.over,
      // constraints: BoxConstraints(
      //   minWidth: MediaQuery.sizeOf(context).width - 50.w,
      //   maxWidth: MediaQuery.sizeOf(context).width - 50.w,
      // ),
      child: Card(
        shape: RoundedRectangleBorder(
            side: BorderSide(color: AppColors.gray.withOpacity(0.3)),
            borderRadius: BorderRadius.circular(6.r)),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
          child: SingleTextLineWidget(size: 10.sp, text: value!),
        ),
      ),

      onSelected: (String result) {},
      itemBuilder: (BuildContext context) => item,
    );
  }
}
