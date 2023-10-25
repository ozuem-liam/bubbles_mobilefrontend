import 'package:bubbles/features/vendor/views/home/home_page/widget/recent_activity_card_widget.dart';
import 'package:bubbles/features/vendor/views/home/home_page/widget/statistics_card_widget.dart';
import 'package:bubbles/providers/home_navigation_provider.dart';
import 'package:bubbles/style/appColors.dart';
import 'package:bubbles/utils/constvalues.dart';
import 'package:bubbles/utils/images.dart';
import 'package:bubbles/utils/logger.dart';
import 'package:bubbles/utils/svgs.dart';
import 'package:bubbles/utils/user_db.dart';
import 'package:bubbles/viewModels/home_vm.dart';
import 'package:bubbles/features/customer/views/home/home_page/widget/installation_card_widget.dart';
import 'package:bubbles/features/customer/views/home/home_page/widget/next_payment_card_widget.dart';
import 'package:bubbles/widgets/image_widgets.dart';
import 'package:bubbles/widgets/menu_bar_widget.dart';
import 'package:bubbles/widgets/single_text_line_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

var approvedShopProvider = StateProvider.autoDispose<bool>((ref) => true);

var filterItemProvider = StateProvider.autoDispose<String>((ref) => "Monthly");

final filterList = ["Daily", "Weekly", "Monthly", "Yearly"];

class VendorHomePage extends ConsumerStatefulWidget {
  const VendorHomePage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _VendorHomePageState();
}

class _VendorHomePageState extends ConsumerState<VendorHomePage> {
  @override
  Widget build(BuildContext context) {
    final viewModel = ref.watch(homeViewModel);

    return Scaffold(
        body: Stack(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: generalHorizontalPadding.w),
          child: Column(
            children: [
              SizedBox(
                height: 50.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Hi, Miracle',
                      textAlign: TextAlign.start,
                      style: Theme.of(context)
                          .primaryTextTheme
                          .headlineMedium!
                          .copyWith(
                              fontWeight: FontWeight.w500, fontSize: 16.sp)),
                  Card(
                    color: AppColors.gray.withOpacity(0.2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: InkWell(
                      onTap: () {},
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 8.w, vertical: 9.h),
                        child: const SvgImage(asset: notificationIcon),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 14.h,
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: customTopBarPadding.h),
          child: mainComponent(viewModel: viewModel),
        ),
      ],
    ));
  }

  Widget mainComponent({required HomeViewModel viewModel}) {
    bool stateValue = ref.watch(approvedShopProvider);
    var toggleValue = ref.read(approvedShopProvider.notifier);

    // Filter provider

    String filterValue = ref.watch(filterItemProvider);
    var toggleFilterValue = ref.read(filterItemProvider.notifier);
    return ListView(
        padding: EdgeInsets.symmetric(horizontal: generalHorizontalPadding.w),
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        children: switch (stateValue) {
          false => [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SingleTextLineWidget(
                    text: "Statistics",
                    size: 18.sp,
                    weight: FontWeight.w600,
                  ),
                  const Spacer(),
                  CustomPopMenuBarWidget(
                    size: 80,
                    icon: Card(
                      margin: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.r),
                          side: BorderSide(
                              color: AppColors.gray.withOpacity(0.3))),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SingleTextLineWidget(
                              text: filterValue,
                              size: 11.sp,
                              weight: FontWeight.w400,
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            Icon(
                              Icons.filter_list,
                              size: 16.w,
                            ),
                          ],
                        ),
                      ),
                    ),
                    onSelected: (value) {
                      switch (value) {
                        case "Daily":
                          toggleFilterValue.state = value;
                        case "Weekly":
                          toggleFilterValue.state = value;
                        case "Monthly":
                          toggleFilterValue.state = value;
                        case "Yearly":
                          toggleFilterValue.state = value;

                          break;
                        default:
                      }
                    },
                    item: List.generate(
                      filterList.length,
                      (index) => PopupMenuItem<String>(
                        padding: EdgeInsets.zero,
                        value: filterList[index],
                        child: Row(
                          children: [
                            SizedBox(
                              width: 20.w,
                            ),
                            Text(
                              filterList[index],
                              style: Theme.of(context)
                                  .primaryTextTheme
                                  .headlineSmall
                                  ?.copyWith(fontSize: 13.sp),
                            ),
                            Visibility(
                                visible: filterValue == filterList[index],
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 5.w,
                                    ),
                                    Icon(
                                      Icons.done,
                                      color: AppColors.secondary,
                                      size: 10.w,
                                    ),
                                  ],
                                ))
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  StatisticsCardWidget(
                      title: "Income", amount: "N40,000", icon: walletIcon),
                  StatisticsCardWidget(
                      title: "Customer", amount: "20", icon: customerSVGIcon),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Container(
                height: 150.h,
                width: MediaQuery.sizeOf(context).width,
                decoration: BoxDecoration(
                    color: AppColors.gray.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(10.r)),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 10.r,
                            backgroundColor: AppColors.gray.withOpacity(0.3),
                            child: Center(
                              child: SvgImage(
                                asset: basketIcon,
                                width: 10.w,
                                height: 10.w,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10.h,
                          ),
                          SingleTextLineWidget(
                            text: "Orders",
                            size: 11.sp,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              RecentActivityCardWidget(
                title: "Iron Order",
                icon: ironIcon,
                date: "Today 12:05pm",
                amount: "N2,600",
                accept: () {},
                decline: () {},
              )
            ],
          true => [
              Card(
                elevation: 3,
                margin: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r)),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        dense: true,
                        minLeadingWidth: 0.h,
                        leading: const SvgImage(asset: checkBoxIcon),
                        title: const SingleTextLineWidget(
                            text: "Hurray! Your shop has been approved"),
                        trailing: InkWell(
                            onTap: () {
                              toggleValue.state = !stateValue;
                            },
                            child: const Icon(Icons.close)),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      SingleTextLineWidget(
                        text:
                            "Your shop is now discoverable on customers timelines",
                        size: 12.sp,
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              SingleTextLineWidget(
                text:
                    "No orders yet. Don’t worry you will get a customer soon!",
                size: 20.sp,
                weight: FontWeight.w600,
              ),
              SizedBox(
                height: 15.h,
              ),
              const SvgImage(asset: noOrderImage)
            ]
        });
  }
}

// switch (stateValue) {
//           false => Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     SingleTextLineWidget(
//                       text: "Statistics",
//                       size: 18.sp,
//                       weight: FontWeight.w600,
//                     ),
//                     const Spacer(),
//                     CustomPopMenuBarWidget(
//                       size: 80,
//                       icon: Card(
//                         margin: EdgeInsets.zero,
//                         shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(4.r),
//                             side: BorderSide(
//                                 color: AppColors.gray.withOpacity(0.3))),
//                         child: Padding(
//                           padding: const EdgeInsets.all(4.0),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               SingleTextLineWidget(
//                                 text: filterValue,
//                                 size: 11.sp,
//                                 weight: FontWeight.w400,
//                               ),
//                               SizedBox(
//                                 width: 5.w,
//                               ),
//                               Icon(
//                                 Icons.filter_list,
//                                 size: 16.w,
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                       onSelected: (value) {
//                         switch (value) {
//                           case "Daily":
//                             () {
//                               toggleFilterValue.state = "Daily";
//                             };
//                             break;
//                           case "Weekly":
//                             () {
//                               toggleFilterValue.state = "Weekly";
//                             };
//                             break;
//                           case "Monthly":
//                             () {
//                               toggleFilterValue.state = "Monthly";
//                             };
//                             break;
//                           default:
//                             () {
//                               toggleFilterValue.state = "Yearly";
//                             };
//                         }
//                       },
//                       item: List.generate(
//                         filterList.length,
//                         (index) => PopupMenuItem<String>(
//                           value: filterList[index],
//                           child: InkWell(
//                             child: Row(
//                               children: [
//                                 SizedBox(
//                                   width: 20.w,
//                                 ),
//                                 Text(
//                                   filterList[index],
//                                   style: Theme.of(context)
//                                       .primaryTextTheme
//                                       .headlineSmall
//                                       ?.copyWith(fontSize: 13.sp),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(
//                   height: 10.h,
//                 ),
//                 const Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     StatisticsCardWidget(
//                         title: "Income", amount: "N40,000", icon: walletIcon),
//                     StatisticsCardWidget(
//                         title: "Customer", amount: "20", icon: customerSVGIcon),
//                   ],
//                 ),
//                 SizedBox(
//                   height: 20.h,
//                 ),
//                 Container(
//                   height: 150.h,
//                   width: MediaQuery.sizeOf(context).width,
//                   decoration: BoxDecoration(
//                       color: AppColors.gray.withOpacity(0.2),
//                       borderRadius: BorderRadius.circular(10.r)),
//                   child: Padding(
//                     padding: const EdgeInsets.all(10.0),
//                     child: Column(
//                       children: [
//                         Row(
//                           children: [
//                             CircleAvatar(
//                               radius: 10.r,
//                               backgroundColor: AppColors.gray.withOpacity(0.3),
//                               child: Center(
//                                 child: SvgImage(
//                                   asset: basketIcon,
//                                   width: 10.w,
//                                   height: 10.w,
//                                 ),
//                               ),
//                             ),
//                             SizedBox(
//                               width: 10.h,
//                             ),
//                             SingleTextLineWidget(
//                               text: "Orders",
//                               size: 11.sp,
//                             )
//                           ],
//                         ),
//                         SizedBox(
//                           height: 10.h,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 20.h,
//                 ),
//                 SingleTextLineWidget(
//                   text: "Recent activities",
//                   size: 18.sp,
//                   weight: FontWeight.w600,
//                 ),
//                 SizedBox(
//                   height: 10.h,
//                 ),
//                 Container(
//                   width: MediaQuery.sizeOf(context).width,
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(10.r),
//                       border: Border.all(
//                           width: 0.6, color: AppColors.gray.withOpacity(0.4))),
//                   child: Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 20.w),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Container(
//                           height: 20.h,
//                           width: 55.w,
//                           decoration: BoxDecoration(
//                               color: AppColors.secondary.withOpacity(0.1),
//                               borderRadius: BorderRadius.only(
//                                   bottomLeft: Radius.circular(6.r),
//                                   bottomRight: Radius.circular(6.r))),
//                           child: Center(
//                             child: SingleTextLineWidget(
//                               text: "New order",
//                               size: 9.sp,
//                               color: AppColors.secondary,
//                               weight: FontWeight.bold,
//                             ),
//                           ),
//                         ),
//                         SizedBox(
//                           height: 5.h,
//                         ),
//                         ListTile(
//                           contentPadding: EdgeInsets.zero,
//                           leading: CircleAvatar(
//                             radius: 20.r,
//                             backgroundColor: AppColors.gray.withOpacity(0.2),
//                             child: const SvgImage(asset: ironIcon),
//                           ),
//                           title: SingleTextLineWidget(
//                             text: "Iron order",
//                             size: 14.sp,
//                             weight: FontWeight.w300,
//                           ),
//                           subtitle: Row(
//                             children: [
//                               Row(
//                                 children: [
//                                   const ImageWidget(asset: shirtIcon),
//                                   SingleTextLineWidget(
//                                     text: "3",
//                                     size: 11.sp,
//                                     weight: FontWeight.w300,
//                                   ),
//                                 ],
//                               ),
//                               SizedBox(
//                                 width: 3.h,
//                               ),
//                               Row(
//                                 children: [
//                                   const ImageWidget(asset: jeansIcon),
//                                   SingleTextLineWidget(
//                                     text: "1",
//                                     size: 11.sp,
//                                     weight: FontWeight.w300,
//                                   ),
//                                 ],
//                               )
//                             ],
//                           ),
//                           trailing: SizedBox(
//                             width: MediaQuery.sizeOf(context).width / 4,
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               crossAxisAlignment: CrossAxisAlignment.end,
//                               children: [
//                                 SingleTextLineWidget(
//                                   text: "Today 12:05pm",
//                                   size: 9.sp,
//                                   weight: FontWeight.w300,
//                                 ),
//                                 SizedBox(
//                                   height: 5.h,
//                                 ),
//                                 SingleTextLineWidget(
//                                     text: "N2,600",
//                                     size: 11.sp,
//                                     weight: FontWeight.w300),
//                               ],
//                             ),
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 10.h,
//                 ),
//                 const RecentActivityCardWidget(
//                   title: "Iron Order",
//                   icon: ironIcon,
//                   date: "Today 12:05pm",
//                   amount: "N2,600",
//                 )
//               ],
//             ),
//           true => Column(
//               children: [
//                 Card(
//                   elevation: 3,
//                   margin: EdgeInsets.zero,
//                   shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10.r)),
//                   child: Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 15.w),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         ListTile(
//                           contentPadding: EdgeInsets.zero,
//                           dense: true,
//                           minLeadingWidth: 0.h,
//                           leading: const SvgImage(asset: checkBoxIcon),
//                           title: const SingleTextLineWidget(
//                               text: "Hurray! Your shop has been approved"),
//                           trailing: InkWell(
//                               onTap: () {
//                                 toggleValue.state = !stateValue;
//                               },
//                               child: const Icon(Icons.close)),
//                         ),
//                         SizedBox(
//                           height: 2.h,
//                         ),
//                         SingleTextLineWidget(
//                           text:
//                               "Your shop is now discoverable on customers timelines",
//                           size: 12.sp,
//                         ),
//                         SizedBox(
//                           height: 15.h,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 30.h,
//                 ),
//                 SingleTextLineWidget(
//                   text:
//                       "No orders yet. Don’t worry you will get a customer soon!",
//                   size: 20.sp,
//                   weight: FontWeight.w600,
//                 ),
//                 SizedBox(
//                   height: 15.h,
//                 ),
//                 const SvgImage(asset: noOrderImage)
//               ],
//             )
//         }



