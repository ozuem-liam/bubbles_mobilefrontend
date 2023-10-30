import 'dart:convert';

import 'package:bubbles/model/customer_response_model.dart';
import 'package:bubbles/utils/temporary_storage.dart';

class UserDB {
  static const _profile = "profile";

  static VendorData? getUser() {
    final data = LocalStorageManager.getString(key: _profile);
    if (data.isNotEmpty) {
      return VendorData.fromJson(jsonDecode(data));
    }

    return null;
  }

  static Future addProfile(VendorData model) async {
    await LocalStorageManager.setString(
        key: _profile, value: jsonEncode(model.toJson()));
  }

  static Future deleteUser() async {
    await LocalStorageManager.eraseData(key: _profile);
  }
}
