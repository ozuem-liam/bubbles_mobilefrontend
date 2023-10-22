import 'package:bubbles/style/appColors.dart';
import 'package:bubbles/utils/constvalues.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({super.key});

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  @override
  Widget build(BuildContext context) {
    final styleTheme = Theme.of(context).primaryTextTheme.headlineMedium!;
    return Scaffold(
      body: SafeArea(
          minimum: EdgeInsets.symmetric(horizontal: generalHorizontalPadding.w),
          child: Column(
            children: [
              Container(
                height: 45,
                decoration: BoxDecoration(
                  color: AppColors.gray,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Expanded(
                        child: Container(
                      child: Center(
                        child: Text(
                          "Orders",
                          style: styleTheme,
                        ),
                      ),
                    )),
                    Expanded(
                        child: Container(
                      child: Center(
                        child: Text(
                          "History",
                          style: styleTheme,
                        ),
                      ),
                    ))
                  ],
                ),
              )
            ],
          )),
    );
  }
}
