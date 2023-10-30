import 'package:bubbles/features/vendor/model/shop_service_response_model.dart';
import 'package:bubbles/http/api_manager.dart';
import 'package:bubbles/model/customer_response_model.dart';
import 'package:bubbles/model/file_upload_response_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class VendorShopService extends ApiManager {
  final Ref reader;

  final setupShopStageOneRoute = '/shop/setup/stage-one';

  final getServicesRoute = '/service';
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

  VendorShopService(this.reader) : super(reader);

  //Login with email and password
  Future<VendorUserData> setUpShopStageOne(
    String email,
    String password,
  ) async {
    final body = {
      {
        "vendor_banner": "venurl",
        "business_name": "lee store",
        "business_address": "12 Bode",
        "business_state": "Lagos",
        "business_city": "Kosofe",
        "cac_certificate": "29837882990",
        "services": [
          "64cf48df90cffb2245f3046b",
          "64cf490590cffb2245f3046d",
          "6515e801ff794f6c18446e8c"
        ]
      }
    };

    final response = await postHttp(setupShopStageOneRoute, body);

    var data = response.data;

    if (response.statusCode == 200) {
      return VendorUserData.fromJson(response.data);
    } else {
      return VendorUserData(message: data['message'].toString());
    }
  }


  Future<ShopServiceResponseModel> getServices() async {
    final response = await getHttp(
      getServicesRoute,
    );
    var data = response.data;

    if (response.statusCode == 200) {
      return ShopServiceResponseModel.fromJson(response.data);
    } else {
      return ShopServiceResponseModel(message: data['message'].toString());
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
