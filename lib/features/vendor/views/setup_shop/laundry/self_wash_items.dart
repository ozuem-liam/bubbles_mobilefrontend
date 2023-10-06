import 'package:bubbles/features/vendor/model/laundry_washing_machine_model.dart';
import 'package:bubbles/features/vendor/providers/shop_service_providers.dart';
import 'package:bubbles/features/vendor/views/setup_shop/widgets/shop_category_widgets.dart';
import 'package:bubbles/style/appColors.dart';
import 'package:bubbles/utils/app_helpers.dart';
import 'package:bubbles/utils/images.dart';
import 'package:bubbles/utils/svgs.dart';
import 'package:bubbles/widgets/drop_down_field.dart';
import 'package:bubbles/widgets/image_widgets.dart';
import 'package:bubbles/widgets/single_text_line_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SelfWashItemPage extends ConsumerStatefulWidget {
  const SelfWashItemPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SelfWashItemPageState();
}

class _SelfWashItemPageState extends ConsumerState<SelfWashItemPage> {
  //String machineTypeValue = 'Manual';
  List machineTypes = ["Manual", "Automatic"];
  @override
  Widget build(BuildContext context) {
    var viewModel = ref.watch(selfWashViewModelProvider);
    return Card(
      margin: EdgeInsets.only(top: 20.h),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
      color: AppColors.gray.withOpacity(0.1),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 5.h,
            ),
            SingleTextLineWidget(
              text: "Number of machines",
              size: 11.sp,
            ),
            SizedBox(
              height: 13.h,
            ),
            ShopItemWidget(
              padding: EdgeInsets.zero,
              amount: viewModel.localMachines.length.toString(),
              icon: apparelsIcon,
              increase: () {
                LaundryWashingMachineModel data = LaundryWashingMachineModel(
                    amount: 1500,
                    id: AppHelpers.get11DigitNumber(),
                    image: manualWashingMachineIcon,
                    machinType: "Manual");
                viewModel.addMachineToList(data: data);
              },
              decrease: () {
                viewModel.removeMachine();
              },
              title: "Washing machine",
              titleSize: 12.sp,
            ),
            SizedBox(
              height: 20.h,
            ),
            Row(
              children: [
                SingleTextLineWidget(
                  text: "Machine settings",
                  size: 11.sp,
                ),
                SizedBox(
                  width: 10.h,
                ),
                Tooltip(
                    decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(5.r)),
                    textStyle: Theme.of(context)
                        .primaryTextTheme
                        .headlineMedium!
                        .copyWith(fontSize: 12.sp),
                    message: "Machine charges are billed hourly.",
                    preferBelow: false,
                    waitDuration: Duration.zero,
                    showDuration: const Duration(seconds: 4),
                    child: const SvgImage(asset: infoCircleIcon)),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            Column(
              children: viewModel.localMachines.isEmpty
                  ? []
                  : List.generate(viewModel.localMachines.length, (index) {
                      var data = viewModel.localMachines[index];
                      return Padding(
                        padding: EdgeInsets.only(bottom: 15.h),
                        child: SelfWashItemWidget(
                          amount: AppHelpers.largerNumberFormatter
                              .format(data.amount),
                          icon: AppHelpers.getMachineTypeImage(
                              machineType: data.machinType!),
                          increase: () {
                            viewModel.increaseMachinePrice(id: data.id);
                          },
                          decrease: () {
                             viewModel.decreaseMachinePrice(id: data.id);
                          },
                          machineType: Padding(
                            padding: const EdgeInsets.only(
                              top: 4,
                            ),
                            child: DropDownFeild(
                              value: data.machinType,
                              valuePlaceHolder: "Type",
                              item: List.generate(
                                machineTypes.length,
                                (index) => PopupMenuItem<String>(
                                  value: data.machinType,
                                  onTap: () {
                                    viewModel.updateMachineType(
                                        type: machineTypes[index], id: data.id);
                                    // viewModel.selectMonthlyEnergyConsumption(
                                    //     value: viewModel.monthlyEnergy[index]);
                                  },
                                  child: Text(
                                    "${machineTypes[index]}",
                                    style: Theme.of(context)
                                        .primaryTextTheme
                                        .headlineMedium,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
            )
          ],
        ),
      ),
    );
  }
}
