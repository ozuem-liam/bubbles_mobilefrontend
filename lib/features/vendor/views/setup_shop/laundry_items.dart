import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LaundryItemsPage extends ConsumerWidget {
  const LaundryItemsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: ListView(
        physics: const BouncingScrollPhysics(),
        shrinkWrap:  true,
        children: []),
    );
  }
}
