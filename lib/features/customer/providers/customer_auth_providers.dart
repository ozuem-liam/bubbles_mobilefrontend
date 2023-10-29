import 'package:bubbles/features/customer/services/auth_services.dart';
import 'package:bubbles/features/customer/viewModels/customer_auth_vm.dart';
import 'package:bubbles/http/api_manager.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// [apiManager] this is the provider if ApiManager and it can inject using [ref.watch(apiManager)]
final apiManager = Provider<ApiManager>((ref) => ApiManager(ref));

final customerAuthViewModelProvider =
    ChangeNotifierProvider<CustomerAuthViewModel>(
        (ref) => CustomerAuthViewModel(ref, ref.watch(apiManager)));

final customerAuthServiceProvider =
    Provider.autoDispose<UserAuthService>((ref) => UserAuthService(ref));
