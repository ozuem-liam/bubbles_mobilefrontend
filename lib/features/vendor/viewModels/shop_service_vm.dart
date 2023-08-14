import 'package:bubbles/utils/svgs.dart';
import 'package:bubbles/viewmodels/base_vm.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ShopServiceVM extends BaseViewModel {
  final Ref ref;
  ShopServiceVM(this.ref) : super(ref);

  int setUpIndex = 0;
  List<String> serviceList = [];

  List<String> laundryTypeList = [];

  void changeSetup({required int val}) {
    setUpIndex = val;
    notifyListeners();
  }

  void addService(String service) {
    serviceList.add(service);
    notifyListeners();
  }

  void removeService(String service) {
    serviceList.removeWhere((element) => service == element);
    notifyListeners();
  }

  List<Map<String, dynamic>> serviceType() {
    return [
      {"service": "Wash", "icon": washIcon},
      {"service": "Iron", "icon": ironIcon},
      {"service": "Dry clean", "icon": washIcon},
      {"service": "Self wash", "icon": selfWashIcon}
    ];
  }

  List<Map<String, dynamic>> laundryItems() {
    return [
      {"item": "Apparels", "icon": apparelsIcon},
      {"item": "Bath towels", "icon": bathTowelIcon},
      {"item": "Bed items", "icon": bedIcon},
      {"item": "Outdoor gear", "icon": outDoorGearIcon},
      {"item": "Rugs", "icon": rugIcon},
      {"item": "Foot wear", "icon": footWearIcon}
    ];
  }

  void addLaundryType(String item) {
    laundryTypeList.add(item);
    notifyListeners();
  }

  void removeLaundryType(String item) {
    laundryTypeList.removeWhere((element) => item == element);
    notifyListeners();
  }

  bool selectAll = false;
  void toggleAllLaundryType() {
    if (selectAll) {
      laundryTypeList = [];
      selectAll = false;
      notifyListeners();
    } else {
      for (var item in laundryItems()) {
        if (!laundryTypeList.contains(item['item'])) {
          laundryTypeList.add(item['item']);
        }
      }
      selectAll = true;
      notifyListeners();
    }
  }

  // void addService(String service) {
  //   state = [...state, service];
  // }

  // void removeService(String service) {
  //   state = [
  //     for (final item in state)
  //       if (item != service) item
  //   ];
  // }
}
