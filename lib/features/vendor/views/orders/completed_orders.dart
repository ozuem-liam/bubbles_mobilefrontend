import 'package:bubbles/features/vendor/views/orders/widgets/completed_order_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CompletedOrdersPage extends ConsumerWidget {
  const CompletedOrdersPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        SizedBox(
          height: 20.h,
        ),
        CompletedOrderCardWidget(
          onTap: () {

          },
          title: "Shirt (2), Trouser (1), Socks (1)",
          serviceType: "Wash",
          quantity: "4",
          amount: "N2,600",
          date: "12/06/23",
        ),
        SizedBox(
          height: 20.h,
        ),
        CompletedOrderCardWidget(
          onTap: () {
            
          },
          title: "Shirt (2), Trouser (1), Socks (1)",
          serviceType: "Wash",
          quantity: "4",
          amount: "N2,600",
          date: "12/06/23",
        ),
        SizedBox(
          height: 20.h,
        ),
        CompletedOrderCardWidget(
          onTap: () {
            
          },
          title: "Shirt (2), Trouser (1), Socks (1)",
          serviceType: "Wash",
          quantity: "4",
          amount: "N2,600",
          date: "12/06/23",
        )
      ],
    );
  }
}
