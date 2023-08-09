
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:bubbles/viewModels/privacy_mode_vm.dart';

final privacyProvider = ChangeNotifierProvider<PrivacyModeViewModel>(
    (ref) => PrivacyModeViewModel(ref));