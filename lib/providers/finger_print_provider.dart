
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:bubbles/viewModels/finger_print_vm.dart';

final fingerPrintProvider = ChangeNotifierProvider<FingerPrintViewModel>(
    (ref) => FingerPrintViewModel(ref));

