import 'package:bubbles/features/vendor/model/shop_service_response_model.dart';
import 'package:bubbles/features/vendor/providers/shop_service_providers.dart';
import 'package:bubbles/features/vendor/services/shop_services.dart';
import 'package:bubbles/utils/notify_me.dart';
import 'package:bubbles/utils/svgs.dart';
import 'package:bubbles/viewmodels/base_vm.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

// ignore: depend_on_referenced_packages
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dio/dio.dart' as dio;
// ignore: depend_on_referenced_packages
import 'package:http_parser/http_parser.dart';

class ShopServiceVM extends BaseViewModel {
  final Ref ref;

  VendorShopService? vendorShopService;
  ShopServiceVM(this.ref) : super(ref) {
    vendorShopService = ref.read(shopAuthServiceProvider);

    getShopServices();
  }

  int setUpIndex = 0;
  List<String> serviceList = [];
  final imagePicker = ImagePicker();

  List<ServiceData>? servicesList = [];

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

  // GET ALL SERVICES

  bool fetchServices = false;

  Future getShopServices() async {
    fetchServices = true;
    notifyListeners();

    var res = await vendorShopService?.getServices();

    if (res?.code == 200 || res?.code == 201) {
      servicesList = [];
      servicesList = res?.data?.services;
      fetchServices = false;
      notifyListeners();
    }
    fetchServices = false;
    notifyListeners();
  }

  bool isUploading = false;
  String businessImageUrl = '';
  uploadbubblesPicture() async {
    isUploading = true;
    notifyListeners();
    try {
      XFile? pickedImage =
          await imagePicker.pickImage(source: ImageSource.gallery);
      if (pickedImage == null) {
        isUploading = false;
        notifyListeners();
      } else {
        String fileName = pickedImage.path.split('/').last;
        final res = await vendorShopService!.uploadFiles(
            file: await dio.MultipartFile.fromFile(pickedImage.path,
                filename: fileName, contentType: MediaType('image', 'jpg')));

        if (res.code == 200) {
          NotifyMe.showAlert(res.message!);
          businessImageUrl = res.data!.fileUrl!;
          //imageurlController.text = res.data!.fileUrl!;
          isUploading = false;

          notifyListeners();
        } else {
          isUploading = false;
          notifyListeners();
          NotifyMe.showAlert(res.message!);
        }
      }
    } catch (_) {}
  }
}
