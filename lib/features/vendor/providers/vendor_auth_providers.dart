import 'package:bubbles/features/vendor/services/auth_services.dart';
import 'package:bubbles/features/vendor/viewModels/vendor_auth_vm.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final customerAuthViewModelProvider = ChangeNotifierProvider<VendorAuthViewModel>(
    (ref) => VendorAuthViewModel(ref));



final vendorAuthServiceProvider =
    Provider.autoDispose<VendorAuthService>((ref) => VendorAuthService(ref));