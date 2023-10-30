
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomPopMenuBarWidget extends ConsumerWidget {
 
  final Function(String) onSelected;
  final Widget icon;
  final double? size;
   final List<PopupMenuItem<String>> item;
  const   CustomPopMenuBarWidget( 
      { this.size, required this.icon, required this.onSelected, required this.item, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    
    return PopupMenuButton<String>(
      padding: EdgeInsets.zero,
      iconSize: size?? 50.w,
      icon: icon,
      onSelected: onSelected,
      itemBuilder: (BuildContext context) => item,
    );
  }
}


