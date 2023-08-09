
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:bubbles/viewModels/home_vm.dart';

final homeViewModel =
    ChangeNotifierProvider<HomeViewModel>((ref) => HomeViewModel(ref));



    
final snackBarKeyProvider = Provider<GlobalKey<ScaffoldMessengerState>>(
    (ref) => GlobalKey<ScaffoldMessengerState>());
