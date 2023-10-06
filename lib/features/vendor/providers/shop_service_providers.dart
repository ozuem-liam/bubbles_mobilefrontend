import 'package:bubbles/features/vendor/viewModels/laundry_self_wash_vm.dart';
import 'package:bubbles/features/vendor/viewModels/shop_service_vm.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final shopViewModelProvider = ChangeNotifierProvider<ShopServiceVM>(
    (ref) => ShopServiceVM(ref));


    final selfWashViewModelProvider = ChangeNotifierProvider<LaundrySelfWashVM>(
    (ref) => LaundrySelfWashVM(ref));