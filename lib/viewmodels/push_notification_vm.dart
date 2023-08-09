
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_storage/get_storage.dart';

class PushNotificationViewModel extends ChangeNotifier {
   final Ref ref;
  PushNotificationViewModel( this.ref)  {
    isPushSet = false;
    _loadFromPrefs();
  }

  final String key = "pushNotify";
  GetStorage privacyBox = GetStorage();

  bool? isPushSet;
  bool get modeP => isPushSet!;

  togglePushMode() {
    isPushSet = !isPushSet!;
    _saveToPrefs();
    notifyListeners();
  }

  _loadFromPrefs() async {
    isPushSet = privacyBox.read(key) ?? false;
    notifyListeners();
  }

  _saveToPrefs() async {
    privacyBox.write(key, isPushSet!);
  }
}
