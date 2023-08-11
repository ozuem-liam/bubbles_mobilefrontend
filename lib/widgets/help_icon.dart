
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
            child: const SizedBox()
          )),
    );
  }
}
