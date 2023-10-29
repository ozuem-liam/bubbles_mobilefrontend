import 'package:bubbles/features/vendor/providers/vendor_auth_providers.dart';
import 'package:bubbles/features/vendor/views/authentication/OTP/email_otp_verification.dart';
import 'package:bubbles/features/vendor/views/authentication/login.dart';
import 'package:bubbles/features/vendor/views/navigation_page.dart';
import 'package:bubbles/features/vendor/views/setup_shop/setup_shop.dart';
import 'package:bubbles/utils/notify_me.dart';
import 'package:bubbles/utils/svgs.dart';
import 'package:bubbles/utils/temporary_storage.dart';
import 'package:bubbles/utils/user_db.dart';
import 'package:bubbles/viewmodels/base_vm.dart';
import 'package:bubbles/features/customer/views/home/navigation_page.dart';
import 'package:bubbles/onboarding/stepper_screen.dart';
import 'package:bubbles/widgets/confirmation_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// ignore: depend_on_referenced_packages
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dio/dio.dart' as dio;
// ignore: depend_on_referenced_packages
import 'package:http_parser/http_parser.dart';

class VendorAuthViewModel extends BaseViewModel {
  @override
  final Ref ref;

  VendorAuthViewModel(this.ref) : super(ref) {
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

// LOGIN VENDOR USER
  var otpMessage =
      'Email not verified! Please use the otp code sent to your email to verify your account!';
  Future login({required String email, required String password}) async {
    setBusy(true);
    final res = await ref
        .read(vendorAuthServiceProvider)
        .loginVendor(email, password)
        .catchError((onError) {
      setBusy(false);
    });

    if (res.code == 200) {
      if (res.message == otpMessage) {
        NotifyMe.showAlert(res.message!);
        Get.to(() => VendorEmailOTPVerification(
            email: email,
            onTap: () {
              Get.to(() => ConfirmationPage(
                    title: "Verification successful",
                    description: "Your email has been successfully verified",
                    btnTitle: "Continue",
                    onTap: () {
                      Get.to(() => LoginPage());
                    },
                  ));
              //Get.to(() => ResetPasswordPage());
            }));
      } else {
        await UserDB.addProfile(res.data!);
        NotifyMe.showAlert(res.message!);
        Get.to(() => const VendorHomeNavigation());
        Get.to(() => switch (res.data?.isProfileComplete) {
              false => SetupShotPage(),
              _ => VendorHomeNavigation()
            });
      }
    } else {
      NotifyMe.showAlert(res.message!);
    }
    setBusy(false);
  }

  // REGISTER VENDOR USER
  Future registerVendor({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    required String phone,
    required String address,
  }) async {
    setBusy(true);
    final res = await ref
        .read(vendorAuthServiceProvider)
        .registerVendor(
            email: email,
            password: password,
            firstName: firstName,
            lastName: lastName,
            phone: phone,
            address: address)
        .catchError((onError) {
      setBusy(false);
    });

    if (res.code == 200) {
      await UserDB.addProfile(res.data!);
      NotifyMe.showAlert(res.message!);
      Get.to(() => VendorEmailOTPVerification(
          email: email,
          onTap: () {
            Get.to(() => ConfirmationPage(
                  title: "Verification successful",
                  description: "Your email has been successfully verified",
                  btnTitle: "Setup shop",
                  onTap: () {
                    Get.to(() => const SetupShotPage());
                  },
                ));
            //Get.to(() => ResetPasswordPage());
          }));
    } else {
      NotifyMe.showAlert(res.message!);
    }
    setBusy(false);
  }

// VERIFY VENDOR EMAIL OTP
  Future verifyEmailOTP(
      {required dynamic otp, required Function nextAction, required String email}) async {
    var userData = UserDB.getUser();
    setBusy(true);
    final res = await ref.read(vendorAuthServiceProvider).verifyEmailOTP(
        token: userData?.token, email: email, otp: otp);

    if (res['code'] == 200) {
      NotifyMe.showAlert(res['message']!);
      nextAction();
    } else {
      NotifyMe.showAlert(res['message']!);
    }
    setBusy(false);
  }

  // VERIFY VENDOR EMAIL OTP
  Future resendVerifyEmailOTP(
      {required Function nextAction, required String email}) async {
    setBusy(true);
    final res = await ref.read(vendorAuthServiceProvider).resendVerifyEmailOTP(
          email: email,
        );

    if (res.code == 200) {
       await UserDB.addProfile(res.data!);
      NotifyMe.showAlert(res.message!);
      nextAction();
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
    final res =
        await ref.read(vendorAuthServiceProvider).initiateResetPassword(email);

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
    final res =
        await ref.read(vendorAuthServiceProvider).verifyResetOTP(token: token);

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
        .read(vendorAuthServiceProvider)
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
        .read(vendorAuthServiceProvider)
        .updateProfileImage(imageUrl: imageurlController.text);

    if (res['code'] == 200) {
      //UserDB.getUser()!.profileImage = imageurlController.text;
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
    final res = await ref.read(vendorAuthServiceProvider).changePassword(
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
        await ref.read(vendorAuthServiceProvider).getCustomerDashboard();

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
        await ref.read(vendorAuthServiceProvider).getCustomerNotifications();

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
    // imageurlController.text = UserDB.getUser()!.profileImage!;
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
        final res = await ref.read(vendorAuthServiceProvider).uploadFiles(
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
