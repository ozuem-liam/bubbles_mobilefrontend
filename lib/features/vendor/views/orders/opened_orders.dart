import 'package:bubbles/features/vendor/views/orders/widgets/order_activity_card_widget.dart';
import 'package:bubbles/style/appColors.dart';
import 'package:bubbles/utils/svgs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OpenedOrdersPage extends ConsumerWidget {
  const OpenedOrdersPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        SizedBox(
          height: 20.h,
        ),
       OrderActivityCardWidget(
          onTap: (){},
          title: "Iron Order",
          icon: ironIcon,
          date: "Today 12:05pm",
          amount: "N2,600",
          tagText: "Pickup",
          tagBackgroundColor: AppColors.gray.withOpacity(0.1),
          tagTextColor: AppColors.black.withOpacity(0.8),
          hasTag: true,
          hasActionTags: false,
          accept: () {},
          decline: () {},
        ),
        SizedBox(
          height: 20.h,
        ),
         OrderActivityCardWidget(
          onTap: (){},
          title: "Iron Order",
          icon: ironIcon,
          date: "Today 12:05pm",
          amount: "N2,600",
          tagText: "Dropoff",
          tagBackgroundColor: AppColors.gray.withOpacity(0.1),
          tagTextColor: AppColors.black.withOpacity(0.8),
          hasTag: true,
          hasActionTags: false,
          accept: () {},
          decline: () {},
        ),
        SizedBox(
          height: 20.h,
        ),
         OrderActivityCardWidget(
          onTap: (){},
          title: "Iron Order",
          icon: ironIcon,
          date: "Today 12:05pm",
          amount: "N2,600",
          tagText: "Pickup",
          tagBackgroundColor: AppColors.gray.withOpacity(0.1),
          tagTextColor: AppColors.black.withOpacity(0.8),
          hasTag: true,
          hasActionTags: false,
          accept: () {},
          decline: () {},
        ),
        SizedBox(
          height: 20.h,
        ),
        OrderActivityCardWidget(
          onTap: (){},
          title: "Iron Order",
          icon: ironIcon,
          date: "Today 12:05pm",
          amount: "N2,600",
          tagText: "Dropoff",
          tagBackgroundColor: AppColors.gray.withOpacity(0.1),
          tagTextColor: AppColors.black.withOpacity(0.8),
          hasTag: true,
          hasActionTags: false,
          accept: () {},
          decline: () {},
        ),
        SizedBox(
          height: 20.h,
        ),
      ],
    );
  }
}