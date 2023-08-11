
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:bubbles/viewmodels/user_type_vm.dart';

final userTypeViewModelProvider = ChangeNotifierProvider<UserTypeViewModel>(
    (ref) => UserTypeViewModel(ref));


