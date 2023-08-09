import 'package:bubbles/utils/images.dart';
import 'package:bubbles/utils/user_db.dart';
import 'package:bubbles/views/home/navigation_page.dart';
import 'package:bubbles/views/onboarding/stepper_screen.dart';
import 'package:bubbles/widgets/image_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// ignore: depend_on_referenced_packages
import 'package:get/get.dart';

class SplashView extends ConsumerStatefulWidget {
  const SplashView({
    Key? key,
  }) : super(key: key);
  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends ConsumerState<SplashView>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  Animation? time;

  @override
  void initState() {
    var user = UserDB.getUser();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    time = Tween(begin: 0.0, end: 20.0).animate(CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 1.0, curve: Curves.easeOut))
      ..addStatusListener((AnimationStatus status) {
        if (status == AnimationStatus.completed) {
          Get.to(() =>
              user == null ? const StepperScreen() : const HomeNavigation());
        }
      }));

    _controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //bool _visible = true;

    return const Scaffold(
        body: Center(
      child: ImageWidget(asset: logoIcon),
    ));
  }
}