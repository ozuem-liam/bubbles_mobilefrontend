import 'package:bubbles/features/vendor/views/orders/all_orders_page.dart';
import 'package:bubbles/features/vendor/views/orders/completed_orders.dart';
import 'package:bubbles/features/vendor/views/orders/opened_orders.dart';
import 'package:bubbles/features/vendor/views/orders/pending_orders.dart';
import 'package:bubbles/features/vendor/views/setup_shop/laundry/laundry_items.dart';
import 'package:bubbles/style/appColors.dart';
import 'package:bubbles/utils/constvalues.dart';
import 'package:bubbles/utils/svgs.dart';
import 'package:bubbles/widgets/buttons.dart';
import 'package:bubbles/widgets/image_widgets.dart';
import 'package:bubbles/widgets/menu_bar_widget.dart';
import 'package:bubbles/widgets/single_text_line_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainShopPage extends ConsumerWidget {
  MainShopPage({super.key});

  var filterItemProvider =
      StateProvider.autoDispose<String>((ref) => "Monthly");

  final categoryItemProvider = StateProvider.autoDispose<int>((ref) => 0);

  final filterList = ["Daily", "Weekly", "Monthly", "Yearly"];

  final categoryListItems = ["All", "Pending", "Open", "Completed"];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Filter provider

    String filterValue = ref.watch(filterItemProvider);
    var toggleFilterValue = ref.read(filterItemProvider.notifier);

    // Category Items

    var categoryState = ref.watch(categoryItemProvider);
    var changeCatState = ref.read(categoryItemProvider.notifier);
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: generalHorizontalPadding.w),
        shrinkWrap: true,
        children: [
          SizedBox(
            height: 50.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SingleTextLineWidget(
                    text: "Ace Wash",
                    size: 19.sp,
                    weight: FontWeight.w500,
                  ),
                  SizedBox(
                    width: 12.w,
                  ),
                  Row(
                    children: [
                      SingleTextLineWidget(
                        text: "4.5",
                        size: 12.sp,
                        weight: FontWeight.w500,
                      ),
                      SizedBox(
                        width: 3.w,
                      ),
                      SvgImage(
                        asset: starIcon,
                        width: 10.w,
                        height: 10.w,
                      )
                    ],
                  ),
                ],
              ),
              SwitchTextButton(
                title: "Open",
                value: true,
                onTap: () {},
                swapPosition: true,
                activeColor: AppColors.secondary,
              ),
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          Container(
            decoration: BoxDecoration(
              color: AppColors.gray.withOpacity(0.3),
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Padding(
              padding: EdgeInsets.all(10.0.r),
              child: Column(
                children: [
                  shopMiniDetails(
                    context: context,
                    icon: Icons.schedule_outlined,
                    title: "Mon - Thur [8am - 5pm], Fri [9am - 3pm] ",
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  shopMiniDetails(
                    context: context,
                    icon: Icons.call,
                    title: "08037092512",
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  shopMiniDetails(
                    context: context,
                    icon: Icons.pin_drop,
                    title: "23, Faruta street, Balena, Lagos",
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  shopMiniDetails(
                    context: context,
                    icon: Icons.confirmation_num_outlined,
                    title: "123-3648-3738-4848",
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          TextButton(
                              onPressed: () {},
                              child: SingleTextLineWidget(
                                text: "Read reviews",
                                color: AppColors.secondary,
                                size: 12.sp,
                              )),
                          SizedBox(
                            width: 10.h,
                          ),
                          TextButton(
                              onPressed: () {},
                              child: SingleTextLineWidget(
                                text: "Price list",
                                color: AppColors.secondary,
                                size: 12.sp,
                              ))
                        ],
                      ),
                      DecoratedBox(
                        decoration: BoxDecoration(
                            border: Border.all(color: AppColors.primary),
                            borderRadius: BorderRadius.circular(10.r)),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.w, vertical: 6),
                          child: IconTextButton(
                            title: "Edit",
                            icon: Icons.edit,
                            weight: FontWeight.w400,
                            onTap: () {},
                            swapPosition: true,
                            itemSpace: 7.w,
                            iconSize: 14.w,
                            textSize: 13.w,
                            showBorder: true,
                            borderRadiuss: 10.r,
                            textColor: AppColors.primary,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SingleTextLineWidget(
                text: "Orders",
                size: 19.sp,
                weight: FontWeight.bold,
              ),
              const Spacer(),
              CustomPopMenuBarWidget(
                size: 80,
                icon: Card(
                  margin: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.r),
                      side: BorderSide(color: AppColors.gray.withOpacity(0.3))),
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
          Card(
            margin: EdgeInsets.zero,
            color: AppColors.gray.withOpacity(0.2),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.r)),
            child: Padding(
              padding: EdgeInsets.all(5.0.w),
              child: Row(
                  children: List.generate(
                      categoryListItems.length,
                      (index) => Padding(
                            padding: const EdgeInsets.only(left: 0),
                            child: CategoryItemBox(
                                onTap: () {
                                  changeCatState.state = index;
                                },
                                title: categoryListItems[index],
                                isActive: categoryState == index),
                          ))),
            ),
          ),
          switch (categoryState) {
            0 => const AllOrdersPage(),
            1 => const PendingOrders(),
            2 => const OpenedOrdersPage(),
            _ => const CompletedOrdersPage()
          },
          SizedBox(
            height: 20.h,
          ),
        ],
      ),
    );
  }

  Widget shopMiniDetails(
      {required BuildContext context,
      required IconData icon,
      required String title}) {
    return Row(
      children: [
        Icon(
          icon,
          color: Theme.of(context).iconTheme.color?.withOpacity(0.6),
          size: 15.w,
        ),
        SizedBox(
          width: 10.h,
        ),
        SingleTextLineWidget(
          text: title,
          size: 11.sp,
          weight: FontWeight.w400,
        )
      ],
    );
  }
}
