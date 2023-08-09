
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_storage/get_storage.dart';

class PrivacyModeViewModel extends ChangeNotifier {
   final Ref ref;
  PrivacyModeViewModel(this.ref)  {
    isPrivacyMode = false;
    _loadFromPrefs();
  }

  final String key = "privacy";
  GetStorage privacyBox = GetStorage();

  bool? isPrivacyMode;
  bool get modeP => isPrivacyMode!;

  togglePrivacyMode() {
    isPrivacyMode = !isPrivacyMode!;
    _saveToPrefs();
    notifyListeners();
  }

  _loadFromPrefs() async {
    isPrivacyMode = privacyBox.read(key) ?? false;
    notifyListeners();
  }

  _saveToPrefs() async {
    privacyBox.write(key, isPrivacyMode!);
  }
}
