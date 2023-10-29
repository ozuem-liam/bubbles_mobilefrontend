// import 'package:bubbles/providers/auth_providrs/auth_providers.dart';
import 'package:bubbles/features/customer/providers/customer_auth_providers.dart';
import 'package:bubbles/utils/notify_me.dart';
import 'package:bubbles/utils/svgs.dart';
import 'package:bubbles/utils/temporary_storage.dart';
import 'package:bubbles/utils/user_db.dart';
import 'package:bubbles/viewmodels/base_vm.dart';
import 'package:bubbles/features/customer/views/home/navigation_page.dart';
import 'package:bubbles/onboarding/stepper_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// ignore: depend_on_referenced_packages
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dio/dio.dart' as dio;
// ignore: depend_on_referenced_packages
import 'package:http_parser/http_parser.dart';

class CustomerAuthViewModel extends BaseViewModel {
  @override
  final Ref ref;

  CustomerAuthViewModel(this.ref) : super(ref) {
    // getDeviceId();
  }
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final loginPinController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final bvnController = TextEditingController();
  final otpController = TextEditingController();
  final dobController = TextEditingController();

  final firtNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final phoneController = TextEditingController();
  final imageurlController = TextEditingController();



  String deviceId = '';
  final imagePicker = ImagePicker();

  bool isBiometric = false;
  switchBiometric() {
    isBiometric = !isBiometric;
    notifyListeners();
    return isBiometric;
  }

  bool obscureText = true;
  isObscure() {
    obscureText = !obscureText;
    notifyListeners();
  }

  bool pinObscureText = true;
  pinObscure() {
    pinObscureText = !pinObscureText;
    notifyListeners();
  }

  bool sentEmailOTP = false;
  swicthEmailOTP() {
    sentEmailOTP = !sentEmailOTP;
    notifyListeners();
  }

  List<Map<String, dynamic>> userType() {
    return [
      {"user": "Customer", "image": customerIcon},
      {"user": "Vendor", "image": vendorIcon}
    ];
  }

  // int selectedUserType = -1;
  // void selectUserType({required int value}) {
  //   selectedUserType = value;
  //   notifyListeners();
  // }

  // void chooseUserField({required String value}) {
  //   userTypeController.text = value;
  //   notifyListeners();
  // }

  Future login({required String email, required String password}) async {
    setBusy(true);
    final res = await ref
        .read(customerAuthServiceProvider)
        .loginCustomer(email, password);

    if (res.code == 200) {
      await UserDB.addProfile(res.data!);
      NotifyMe.showAlert(res.message!);
      Get.to(() => const HomeNavigation());
    } else {
      NotifyMe.showAlert(res.message!);
    }
    setBusy(false);
  }

  logout() async {
    Get.offAll(() => const StepperScreen());
    NotifyMe.showAlert('Logged out successfully');
    await UserDB.deleteUser();
  }

  Future initiateResetPasswords(
      {required String email, required Function nextAction}) async {
    LocalStorageManager.setString(key: 'email', value: email);
    setBusy(true);
    final res = await ref
        .read(customerAuthServiceProvider)
        .initiateResetPassword(email);

    if (res['code'] == 200) {
      NotifyMe.showAlert(res['message']!);
      nextAction();
    } else {
      NotifyMe.showAlert(res['message']!);
    }
    setBusy(false);
  }

  Future verifyResetOTP(
      {required dynamic token, required Function nextAction}) async {
    setBusy(true);
    final res = await ref
        .read(customerAuthServiceProvider)
        .verifyResetOTP(token: token);

    if (res['code'] == 200) {
      NotifyMe.showAlert(res['message']!);
      nextAction();
    } else {
      NotifyMe.showAlert(res['message']!);
    }
    setBusy(false);
  }

  Future resetPassword(
      {required String password,
      required String confirmPassword,
      required Function nextAction}) async {
    setBusy(true);
    final res = await ref
        .read(customerAuthServiceProvider)
        .resetPassword(password: password, confirmPassword: confirmPassword);
    if (res['code'] == 200) {
      NotifyMe.showAlert(res['message']!);
      nextAction();
    } else {
      NotifyMe.showAlert(res['message']!);
    }
    setBusy(false);
  }

  updateProfileImage({required BuildContext context}) async {
    final res = await ref
        .read(customerAuthServiceProvider)
        .updateProfileImage(imageUrl: imageurlController.text);

    if (res['code'] == 200) {
    //  UserDB.getUser()!.profileImage = imageurlController.text;
      notifyListeners();

      NotifyMe.showAlert(res['message']!);
    } else {
      NotifyMe.showAlert(res['message']!);
    }
  }

  // change password
  changePassword(
      {required String password, required String confirmPassword}) async {
    setBusy(true);
    final res = await ref.read(customerAuthServiceProvider).changePassword(
        password: password,
        confirmPassword: confirmPassword,
        userId: "${UserDB.getUser()?.id}",
        token: "${UserDB.getUser()?.token}");

    if (res['code'] == 200) {
      NotifyMe.showAlert(res['message']!);
      Get.back();
    } else {
      NotifyMe.showAlert(res['message']!);
    }
    setBusy(false);
  }

  // Get user profile details
  getbubblesDashboardDetails() async {
    final res =
        await ref.read(customerAuthServiceProvider).getCustomerDashboard();

    if (res.code == 200 || res.code == 201) {
    } else {
      NotifyMe.showAlert(res.message!);
    }
  }

  bool isLoadingNotifications = false;
  getInstallerNotification() async {
    //  final res = ref.read(installerServiceProvider).getInstallerNotifications();
    isLoadingNotifications = true;

    notifyListeners();
    final res =
        await ref.read(customerAuthServiceProvider).getCustomerNotifications();

    if (res.code == 200) {
      isLoadingNotifications = false;
      notifyListeners();
    } else {
      NotifyMe.showAlert(res.message!);
      isLoadingNotifications = false;
      notifyListeners();
    }
  }

  // bubbles PROFILE INFORMATION

  setProfileDetaisl() {
  //  imageurlController.text = UserDB.getUser()!.profileImage!;
    firtNameController.text =
        UserDB.getUser()!.firstName!.toString().capitalizeFirst!;
    lastNameController.text =
        UserDB.getUser()!.lastName!.toString().capitalizeFirst!;

    phoneController.text = UserDB.getUser()!.phone!;
    emailController.text = UserDB.getUser()!.email!;

    notifyListeners();
  }

  bool isUploading = false;
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
        final res = await ref.read(customerAuthServiceProvider).uploadFiles(
            file: await dio.MultipartFile.fromFile(pickedImage.path,
                filename: fileName, contentType: MediaType('image', 'jpg')));

        if (res.code == 200) {
          NotifyMe.showAlert(res.message!);
          imageurlController.text = res.data!.fileUrl!;
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
