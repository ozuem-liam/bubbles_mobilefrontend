import 'package:bubbles/features/customer/views/home/order_Navgivation/widgets/history_selected.dart';
import 'package:bubbles/features/customer/views/home/order_Navgivation/widgets/orders_selected.dart';
import 'package:bubbles/style/appColors.dart';
import 'package:bubbles/utils/constvalues.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({super.key});

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  int selected = 0;
  @override
  Widget build(BuildContext context) {
    final styleTheme = Theme.of(context).primaryTextTheme.headlineMedium!;
    return Scaffold(
      body: SafeArea(
          minimum: EdgeInsets.symmetric(horizontal: generalHorizontalPadding.w),
          child: Column(
            children: [
              Gap(20.h),
              Container(
                height: 45,
                decoration: BoxDecoration(
                  color: AppColors.gray.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selected = 0;
                          });
                        },
                        child: SizedBox(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: selected == 0
                                    ? AppColors.white
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Center(
                                child: Text(
                                  "Orders",
                                  style: styleTheme,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                        child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selected = 1;
                        });
                      },
                      child: SizedBox(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: selected == 1
                                  ? AppColors.white
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Center(
                              child: Text(
                                "History",
                                style: styleTheme,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ))
                  ],
                ),
              ),
              Gap(20.h),
              [const OrdersSelected(), const HistorySelected()][selected],
            ],
          )),
    );
  }
}
