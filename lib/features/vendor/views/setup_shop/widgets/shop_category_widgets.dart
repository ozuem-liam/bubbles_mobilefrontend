import 'package:bubbles/style/appColors.dart';
import 'package:bubbles/utils/svgs.dart';
import 'package:bubbles/widgets/image_widgets.dart';
import 'package:bubbles/widgets/single_text_line_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShopCategoryWidget extends ConsumerStatefulWidget {
  final String title;
  final String icon;
  final Widget widget;
  const ShopCategoryWidget(
      {required this.title,
      required this.icon,
      required this.widget,
      super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ShopCategoryWidgetState();
}

class _ShopCategoryWidgetState extends ConsumerState<ShopCategoryWidget> {
  bool hide = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: () {
            setState(() {
              hide = !hide;
            });
          },
          dense: true,
          minLeadingWidth: 0.w,
          leading: SvgImage(asset: widget.icon),
          title: SingleTextLineWidget(text: widget.title),
          trailing:
              Icon(hide ? Icons.keyboard_arrow_down : Icons.keyboard_arrow_up),
        ),
        Visibility(visible: hide, child: widget.widget)
      ],
    );
  }
}

class ShopItemWidget extends ConsumerWidget {
  final String amount;
  final String icon;
  final Function increase;
  final Function decrease;
  final String title;
  const ShopItemWidget(
      {required this.amount,
      required this.icon,
      required this.increase,
      required this.decrease,
      required this.title,
      super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      color: AppColors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.r)),
      child: ListTile(
        minLeadingWidth: 0,
        dense: true,
        leading:  SvgImage(asset: icon),
        title:  SingleTextLineWidget(text: title),
        trailing: SizedBox(
          width: MediaQuery.sizeOf(context).width / 2.3,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                onTap: (){
                  increase();
                },
                child: const SvgImage(asset: minusIcon)),
              SizedBox(
                width: 15.h,
              ),
               SingleTextLineWidget(text: amount),
              SizedBox(
                width: 15.h,
              ),
              InkWell(
                onTap: (){
                  decrease();
                },
                child: const SvgImage(asset: plusIcon))
            ],
          ),
        ),
      ),
    );
  }
}