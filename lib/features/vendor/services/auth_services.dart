import 'package:bubbles/http/api_manager.dart';
import 'package:bubbles/model/customer_notification_model.dart';
import 'package:bubbles/model/customer_response_model.dart';
import 'package:bubbles/model/file_upload_response_model.dart';
import 'package:bubbles/utils/logger.dart';
import 'package:bubbles/core/application/strings.dart';
import 'package:bubbles/utils/temporary_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class VendorAuthService extends ApiManager {
  final Ref reader;

  final loginRoute = '/vendor/login';

  final registerRoute = '/vendor/register';
  final verifyEmailOTPRoute = '/vendor/verify-otp';
  final resendVerifyEmailOTPRoute = '/vendor/send-verification-code';

  final intiateResetPasswordRoute = '/vendor/initiate-password-reset';
  final verifyResetOTPRoute = '/vendor/verify-reset-otp';
  final resetPasswordRoute = '/vendor/reset-password';
  final changePasswordRoute = '/vendor/change-password/';
  final customerDashboardRoute = '/vendor/dashboard/';
  final customerNotificationRoute = '/notification/vendor/';
  final getOneSiteRoute = '/siting/get-siting/';
  final updateProfileImageRoute = '/vendor/update/';
  final uploadFileRoute = '/upload';

  VendorAuthService(this.reader) : super(reader);

  //Login with email and password
  Future<VendorUserData> loginVendor(
    String email,
    String password,
  ) async {
    final signInBody = {
      "email": email,
      "password": password,
    };

    final response = await postHttp(loginRoute, signInBody);

    var data = response.data;

    if (response.statusCode == 200) {
      return VendorUserData.fromJson(response.data);
    } else {
      return VendorUserData(message: data['message'].toString());
    }
  }

  //Register vendor
  Future<VendorUserData> registerVendor({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    required String phone,
    required String address,
  }) async {
    final signInBody = {
      "first_name": firstName,
      "last_name": lastName,
      "email": email,
      "password": password,
      "phone": phone,
      "address": address,
      "user_type": "vendor"
    };

    final response = await postHttp(registerRoute, signInBody);

    var data = response.data;

    if (response.statusCode == 200) {
      return VendorUserData.fromJson(response.data);
    } else {
      return VendorUserData(message: data['message'].toString());
    }
  }

  //verify email otp
  Future verifyEmailOTP({
    required dynamic email,
    required dynamic otp,
    required dynamic token,
  }) async {
    final body = {
      "email": email,
      "otp": otp,
      "token": token,
    };

    final response = await postHttp(verifyEmailOTPRoute, body);
    var data = response.data;

    return data;
  }

  //resend verify email otp
  Future<VendorUserData> resendVerifyEmailOTP({
    required dynamic email,
  }) async {
    final body = {"email": email, "user_type": "vendor"};

    final response = await postHttp(resendVerifyEmailOTPRoute, body);
    var data = response.data;

    if (response.statusCode == 200) {
      return VendorUserData.fromJson(response.data);
    } else {
      return VendorUserData(message: data['message'].toString());
    }
  }

  //Initiate reset password
  Future initiateResetPassword(
    String email,
  ) async {
    final body = {"email": email};

    final response = await postHttp(intiateResetPasswordRoute, body);
    var data = response.data;

    return data;
  }

  //verify Reset otp
  Future verifyResetOTP({
    required dynamic token,
  }) async {
    final body = {
      "email": LocalStorageManager.getString(key: 'email'),
      "token": token,
    };

    final response = await postHttp(verifyResetOTPRoute, body);
    var data = response.data;

    return data;
  }

  //reset password
  Future resetPassword(
      {required String password, required String confirmPassword}) async {
    final body = {
      "email": LocalStorageManager.getString(key: 'email').toString().trim(),
      "password": password,
      "confirmPassword": confirmPassword
    };

    AppLogger.logg("body $body");

    final response = await postHttp(resetPasswordRoute, body);
    var data = response.data;

    return data;
  }

  //UPDATE CUSTOMER PROFILE IMAGE
  Future updateProfileImage({required String imageUrl}) async {
    final body = {"profile_image": imageUrl};

    final response = await patchHttp(
        updateProfileImageRoute +
            LocalStorageManager.getString(key: MyStrings.userId),
        body);
    var data = response.data;

    return data;
  }

  //change old password
  Future changePassword(
      {required String password,
      required String confirmPassword,
      required String userId,
      required String token}) async {
    final body = {"password": password, "confirmPassword": confirmPassword};

    final response =
        await postHttp(changePasswordRoute + userId, body, token: token);
    var data = response.data;

    return data;
  }

  Future<VendorUserData> getCustomerDashboard() async {
    final response = await getHttp(
        customerDashboardRoute +
            LocalStorageManager.getString(key: MyStrings.userId),
        token: LocalStorageManager.getString(key: 'token'));

    var data = response.data;

    if (response.statusCode == 200) {
      return VendorUserData.fromJson(response.data);
    } else {
      return VendorUserData(message: data['message'].toString());
    }
  }

  //get notifications
  Future<CustomerNotificationModel> getCustomerNotifications() async {
    final response = await getHttp(customerNotificationRoute,
        token: LocalStorageManager.getString(key: 'token'));

    var data = response.data;

    if (response.statusCode == 200) {
      return CustomerNotificationModel.fromJson(response.data);
    } else {
      return CustomerNotificationModel(message: data['message'].toString());
    }
  }

  // UPLOAD FILES
  Future<FileUploadResponseModel> uploadFiles({required dynamic file}) async {
    final body = {
      "file": file,
    };

    final response = await postHttp(
      uploadFileRoute,
      body,
      formdata: true,
    );
    var data = response.data;

    if (response.statusCode == 200) {
      return FileUploadResponseModel.fromJson(response.data);
    } else {
      return FileUploadResponseModel(message: data['message'].toString());
    }
  }
}
