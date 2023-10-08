import 'package:bubbles/core/application/strings.dart';
import 'package:bubbles/features/customer/views/home/home_page/widget/shop_near_widget.dart';
import 'package:bubbles/utils/constvalues.dart';
import 'package:bubbles/widgets/customfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart' as getx;

class HomeSearch extends StatefulWidget {
  const HomeSearch({super.key});

  @override
  State<HomeSearch> createState() => _HomeSearchState();
}

class _HomeSearchState extends State<HomeSearch> {
  @override
  Widget build(BuildContext context) {
    final styleTheme = Theme.of(context).primaryTextTheme.headlineMedium!;
    return Scaffold(
      body: SafeArea(
        minimum: EdgeInsets.symmetric(horizontal: generalHorizontalPadding.w),
        child: Column(
          children: [
            SizedBox(height: 20.h),
            Row(
              children: [
                GestureDetector(
                  onTap: () => getx.Get.back(),
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.chevron_left,
                        size: 35,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                const HomeTextFieldSearch()
              ],
            ),
            SizedBox(height: 20.h),
            Row(
              children: [
                Text(
                  "Shops",
                  style: styleTheme,
                ),
                const SizedBox(width: 3),
                Container(
                  height: 20,
                  width: 20,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xffCCE6E6),
                  ),
                  child: Center(
                      child: Text(
                    "4",
                    style: styleTheme,
                  )),
                )
              ],
            ),
            SizedBox(height: 20.h),
            ListView.builder(
              itemCount: 2,
              shrinkWrap: true,
              itemBuilder: (context, index) => const ShopeNearYou(
                shopNearYouParams: (
                  address: "47, Tarate street, Agege, Lagos",
                  name: "Blazing Glory Laundr",
                  rate: 4.5
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OverlayWidgetEntery extends StatefulWidget {
  final ({
    Size size,
    Offset offset,
    LayerLink layerLink,
    OverlayEntry? entry
  }) overlayParams;
  const OverlayWidgetEntery({super.key, required this.overlayParams});

  @override
  State<OverlayWidgetEntery> createState() => _OverlayWidgetEnteryState();
}

class _OverlayWidgetEnteryState extends State<OverlayWidgetEntery> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      width: widget.overlayParams.size.width,
      left: widget.overlayParams.offset.dy,
      top:
          widget.overlayParams.offset.dx + widget.overlayParams.size.height + 8,
      child: CompositedTransformFollower(
        link: widget.overlayParams.layerLink,
        showWhenUnlinked: false,
        offset: Offset(0.0, widget.overlayParams.size.height + 5.0),
        child: Material(
          elevation: 4.0,
          color: Colors.white,
          child: Column(
            // padding: EdgeInsets.zero,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Recent search",
                      style: Theme.of(context).primaryTextTheme.headlineMedium!,
                    ),
                    const Icon(
                      FontAwesomeIcons.xmark,
                      size: 20,
                    )
                  ],
                ),
              ),
              const SizedBox(height: 10),
              ListTile(
                onTap: () {
                  if (widget.overlayParams.entry != null) {
                    widget.overlayParams.entry?.remove();
                  }
                },
                leading: Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: const DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage("assets/png/Wash.png"),
                      )),
                ),
                title: Text(
                  "Ace Wash",
                  style: Theme.of(context)
                      .primaryTextTheme
                      .headlineMedium!
                      .copyWith(fontWeight: FontWeight.bold, fontSize: 14.sp),
                ),
                subtitle: Text("47, Tarate street, Agege, Lagos",
                    style: Theme.of(context).primaryTextTheme.headlineMedium!),
              ),
              ListTile(
                leading: Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: const DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage("assets/png/Wash.png"),
                      )),
                ),
                onTap: () {
                  if (widget.overlayParams.entry != null) {
                    widget.overlayParams.entry?.remove();
                  }
                },
                title: Text(
                  "Ace Wash",
                  style: Theme.of(context)
                      .primaryTextTheme
                      .headlineMedium!
                      .copyWith(fontWeight: FontWeight.bold, fontSize: 14.sp),
                ),
                subtitle: Text("47, Tarate street, Agege, Lagos",
                    style: Theme.of(context).primaryTextTheme.headlineMedium!),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HomeTextFieldSearch extends StatefulWidget {
  const HomeTextFieldSearch({super.key});

  @override
  State<HomeTextFieldSearch> createState() => _HomeTextFieldSearchState();
}

class _HomeTextFieldSearchState extends State<HomeTextFieldSearch> {
  late OverlayEntry? overlayEntry;
  late TextEditingController _controller;
  final LayerLink layerLink = LayerLink();
  final FocusNode focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CompositedTransformTarget(
        link: layerLink,
        child: CustomField(
          controller: _controller,
          focusNode: focusNode,
          headtext: "search",
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.black, width: 1),
              borderRadius: BorderRadius.circular(10)),
          pIcon: const Icon(Icons.search),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      // overlay();
    });
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        overlay();
      } else {
        if (overlayEntry != null) {
          overlayEntry?.remove();
          overlayEntry = null;
        }
      }
    });
  }

  overlay() {
    RenderBox renderBox = context.findRenderObject() as RenderBox;
    final size = renderBox.size;
    final offset = renderBox.localToGlobal(Offset.zero);

    overlayEntry = OverlayEntry(
      builder: (context) => OverlayWidgetEntery(
        overlayParams: (
          size: size,
          offset: offset,
          layerLink: layerLink,
          entry: overlayEntry
        ),
      ),
    );
    if (overlayEntry != null) Overlay.of(context).insert(overlayEntry!);
  }
}
