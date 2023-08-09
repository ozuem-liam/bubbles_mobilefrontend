import 'package:bubbles/viewModels/onbaording_vm.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final onbaordingProvider = ChangeNotifierProvider<OnBoardingViewModel>(
    (ref) => OnBoardingViewModel(ref));
