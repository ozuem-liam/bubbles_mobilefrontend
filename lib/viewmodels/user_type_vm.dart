
import 'package:bubbles/utils/svgs.dart';
import 'package:bubbles/viewmodels/base_vm.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserTypeViewModel extends BaseViewModel {
  @override
  final Ref ref;

  UserTypeViewModel(this.ref) : super(ref) {
    // getDeviceId();
  }


  List<Map<String, dynamic>> userType() {
    return [
      {"user": "Customer", "image": customerIcon},
      {"user": "Vendor", "image": vendorIcon}
    ];
  }

  int selectedUserType = -1;
  void selectUserType({required int value}) {
    selectedUserType = value;
    notifyListeners();
  }


}
