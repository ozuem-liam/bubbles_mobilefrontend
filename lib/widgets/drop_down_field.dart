
import 'package:bubbles/style/appColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DropDownFeild extends ConsumerWidget {
  final String? valuePlaceHolder;
  final String? value;
  final List<PopupMenuItem<String>> item;

  const DropDownFeild(
      {this.valuePlaceHolder,
      required this.item,
      required this.value,
      super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PopupMenuButton<String>(
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
      position: PopupMenuPosition.under,
      constraints: BoxConstraints(
        minWidth: MediaQuery.sizeOf(context).width - 50.w,
        maxWidth: MediaQuery.sizeOf(context).width - 50.w,
      ),
      child: Container(
          height: 40.h,
          width: MediaQuery.sizeOf(context).width,
          decoration: BoxDecoration(
              //border: Border.all(color: AppColors.gray, width: 1),
              borderRadius: BorderRadius.circular(10)),
          child: InputDecorator(
            decoration: InputDecoration(
              labelText: switch (value) {
                      '' => '',
                      null => '',
                      _ => valuePlaceHolder.toString()
                    },
                    labelStyle: Theme.of(context)
                                .primaryTextTheme
                                .headlineMedium
                                ?.copyWith(
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w400,
                                    color: Theme.of(context)
                                        .primaryTextTheme
                                        .headlineMedium
                                        ?.color!
                                        .withOpacity(0.7)),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: AppColors.termsTextColor.withOpacity(0.4),
                      width: 1),
                  borderRadius: BorderRadius.circular(10)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: AppColors.termsTextColor.withOpacity(0.4),
                      width: 1),
                  borderRadius: BorderRadius.circular(10)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  switch (value) {
                    '' => valuePlaceHolder.toString(),
                    null => valuePlaceHolder.toString(),
                    _ => value.toString()
                  },
                  style: value == '' || value == null
                      ? Theme.of(context)
                          .primaryTextTheme
                          .headlineMedium
                          ?.copyWith(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w400,
                             color: Theme.of(context)
                                      .primaryTextTheme
                                      .headlineMedium
                                      ?.color!
                                      .withOpacity(0.7)
                          )
                      : Theme.of(context)
                          .primaryTextTheme
                          .headlineMedium!
                          .copyWith(
                              fontSize: 10.sp, fontWeight: FontWeight.w400),
                ),
                 Icon(
                  Icons.arrow_drop_down,
                  size: 14.w,
                  color: AppColors.gray,
                )
              ],
            ),
          )),
      onSelected: (String result) {},
      itemBuilder: (BuildContext context) => item,
    );
  }
}
