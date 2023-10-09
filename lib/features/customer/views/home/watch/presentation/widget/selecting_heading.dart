import 'package:bubbles/style/appColors.dart';
import 'package:flutter/material.dart';

class SelectHeader extends StatelessWidget {
  final ({
    int i,
    String name,
    int selected,
  }) selectedWidget;
  const SelectHeader({super.key, required this.selectedWidget});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: selectedWidget.selected == selectedWidget.i
              ? Colors.white
              : Colors.transparent),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Center(
          child: Text(
            selectedWidget.name,
            style: Theme.of(context)
                .primaryTextTheme
                .headlineMedium!
                .copyWith(color: AppColors.black),
          ),
        ),
      ),
    );
  }
}
