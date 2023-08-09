
import 'package:bubbles/utils/constvalues.dart';
import 'package:bubbles/utils/images.dart';
import 'package:bubbles/utils/svgs.dart';
import 'package:bubbles/widgets/image_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';



class CustomLogoLoadingIndicator extends StatelessWidget {
  final double padding;
  const CustomLogoLoadingIndicator({Key? key, this.padding = ySpaceMid})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(
      padding: EdgeInsets.symmetric(vertical: padding),
      child: SpinKitPumpingHeart(
        size: 200,
        itemBuilder: (context, index) => const SvgImage(
          asset: bubbleIcon,
        ),
      ),
    ));
  }
}
