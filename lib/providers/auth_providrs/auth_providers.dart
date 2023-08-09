
import 'package:bubbles/services/auth_services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:bubbles/viewmodels/auth/auth_vm.dart';

final userAuthViewModelProvider = ChangeNotifierProvider<UserAuthViewModel>(
    (ref) => UserAuthViewModel(ref));


final userAuthServiceProvider =
    Provider.autoDispose<UserAuthService>((ref) => UserAuthService(ref));
