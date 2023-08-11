
import 'package:bubbles/features/customer/services/auth_services.dart';
import 'package:bubbles/features/customer/viewModels/customer_auth_vm.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final customerAuthViewModelProvider = ChangeNotifierProvider<CustomerAuthViewModel>(
    (ref) => CustomerAuthViewModel(ref));



final customerAuthServiceProvider =
    Provider.autoDispose<UserAuthService>((ref) => UserAuthService(ref));