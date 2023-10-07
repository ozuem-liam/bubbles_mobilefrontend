import 'package:bubbles/features/customer/views/home/home_page/domain/services.dart';
import 'package:bubbles/features/customer/views/home/home_page/search/home_search.dart';
import 'package:bubbles/features/customer/views/home/home_page/widget/service_widget.dart';
import 'package:bubbles/features/customer/views/home/home_page/widget/shop_near_widget.dart';
import 'package:bubbles/features/customer/views/notification/presentation/notification_page.dart';
import 'package:bubbles/providers/home_navigation_provider.dart';
import 'package:bubbles/style/appColors.dart';
import 'package:bubbles/utils/constvalues.dart';
import 'package:bubbles/utils/user_db.dart';
import 'package:bubbles/viewModels/home_vm.dart';
import 'package:bubbles/widgets/customfield.dart';
import 'package:bubbles/widgets/image_widgets.dart';
// import 'package:bubbles/features/customer/views/home/home_page/widget/installation_card_widget.dart';
// import 'package:bubbles/features/customer/views/home/home_page/widget/next_payment_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

const List<ServicesData> service = [
  ServicesData(
      name: 'Wash', descrip: "wash | Fold", icon: "assets/svgs/washIcon.svg"),
  ServicesData(
      name: 'Dry clean',
      descrip: "wash | Iron",
      icon: "assets/svgs/dryclean.svg"),
  ServicesData(
      name: 'Iron', descrip: "Iron | Fold", icon: "assets/svgs/ironicons.svg"),
  ServicesData(
      name: 'Self watch',
      descrip: "Use machine",
      icon: "assets/svgs/selfIcon.svg"),
];

class HomePage extends ConsumerStatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    final styleTheme = Theme.of(context).primaryTextTheme.headlineMedium!;
    final viewModel = ref.watch(homeViewModel);

    return Scaffold(
        body: mainComponent(viewModel: viewModel, styleTheme: styleTheme));
  }

  Widget mainComponent(
      {required HomeViewModel viewModel, TextStyle? styleTheme}) {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: generalHorizontalPadding.w),
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      children: [
        const SizedBox(height: 70),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Hi, ${UserDB.getUser()?.firstName.toString().capitalizeFirst ?? "User"}',
              textAlign: TextAlign.start,
              style: Theme.of(context)
                  .primaryTextTheme
                  .headlineMedium!
                  .copyWith(fontWeight: FontWeight.w500, fontSize: 16.sp),
            ),
            GestureDetector(
              onTap: () => Get.to(() => const NotificationPage()),
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(
                  child: SvgImage(asset: "assets/svgs/Notification.svg"),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Text(
          "Find laundry shops closeby",
          style: Theme.of(context)
              .primaryTextTheme
              .headlineMedium!
              .copyWith(fontWeight: FontWeight.bold, fontSize: 20.sp),
        ),
        SizedBox(height: 30.sp),
        GestureDetector(
          onTap: () => Get.to(() => const HomeSearch()),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                width: 1.5.w,
                color: AppColors.lightGrey.withOpacity(0.6),
              ),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: const CustomField(
              headtext: "search",
              pIcon: Icon(Icons.search),
              allowTypeing: false,
            ),
          ),
        ),
        SizedBox(height: 30.sp),
        Container(
          height: 120,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            // ,
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                spreadRadius: -7,
                blurRadius: 10,
                offset: Offset(-10, 1),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                const SizedBox(height: 10),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const SvgImage(asset: "assets/svgs/Basket.svg"),
                        const SizedBox(width: 10),
                        Text(
                          "Hurray! It’s a success!",
                          style: styleTheme!.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 18.sp,
                          ),
                        )
                      ],
                    ),
                    const Icon(FontAwesomeIcons.xmark),
                  ],
                ),
                const SizedBox(height: 20),
                Text(
                  "Thanks for joining bubbles, a laundry bag will be delivered to you on your first order.",
                  style: styleTheme.copyWith(),
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
        const SizedBox(height: 25),
        Text(
          "Services",
          style: styleTheme.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: 18.sp,
          ),
        ),
        const SizedBox(height: 25),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: List.generate(service.length, (i) {
            final data = service[i];
            return ServiceWidget(
              serviceParam: (
                i: i,
                discrip: data.descrip,
                image: data.icon,
                title: data.name
              ),
            );
          }),
        ),
        const SizedBox(height: 25),
        Text(
          "Shops near you",
          style: styleTheme.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: 18.sp,
          ),
        ),
        const SizedBox(height: 25),
        Wrap(
          spacing: 20,
          runSpacing: 20,
          children: List.generate(
            2,
            (index) => const ShopeNearYou(shopNearYouParams: (
              address: "47, Tarate street, Agege, Lagos",
              name: "Blazing Glory Laundr",
              rate: 4.5
            )),
          ),
        )
      ],
    );
  }
}
