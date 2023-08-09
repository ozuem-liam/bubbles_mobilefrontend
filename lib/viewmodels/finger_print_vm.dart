
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_storage/get_storage.dart';

class FingerPrintViewModel extends ChangeNotifier {
   final Ref ref;
  FingerPrintViewModel(this.ref) {
    isFingerPrint = false;
    _loadFromPrefs();
  }

  final String key = "fingerPrint";
  GetStorage privacyBox = GetStorage();

  bool? isFingerPrint;
  bool get modeP => isFingerPrint!;

  toggleFingerPrintMode() {
    isFingerPrint = !isFingerPrint!;
    _saveToPrefs();
    notifyListeners();
  }

  _loadFromPrefs() async {
    isFingerPrint = privacyBox.read(key) ?? false;
    notifyListeners();
  }

  _saveToPrefs() async {
    privacyBox.write(key, isFingerPrint!);
  }
}
