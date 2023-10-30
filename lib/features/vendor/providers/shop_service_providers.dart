import 'package:bubbles/features/vendor/services/shop_services.dart';
import 'package:bubbles/features/vendor/viewModels/laundry_opening_hours_vm.dart';
import 'package:bubbles/features/vendor/viewModels/laundry_self_wash_vm.dart';
import 'package:bubbles/features/vendor/viewModels/shop_service_vm.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final shopViewModelProvider = ChangeNotifierProvider<ShopServiceVM>(
    (ref) => ShopServiceVM(ref));


    final selfWashViewModelProvider = ChangeNotifierProvider<LaundrySelfWashVM>(
    (ref) => LaundrySelfWashVM(ref));


      final openingHoursViewModelProvider = ChangeNotifierProvider<LaundryOpeningHoursVM>(
    (ref) => LaundryOpeningHoursVM(ref));


    final shopAuthServiceProvider =
    Provider.autoDispose<VendorShopService>((ref) => VendorShopService(ref));