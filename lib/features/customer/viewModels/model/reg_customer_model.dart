import 'package:freezed_annotation/freezed_annotation.dart';
part 'reg_customer_model.freezed.dart';
part 'reg_customer_model.g.dart';

@freezed
class CustomerRegData with _$CustomerRegData {
  const factory CustomerRegData({
    String? id,
    String? first_name,
    String? last_name,
    String? email,
    String? phone,
    String? user_type,
    @Default(false) bool biometric_login,
    @Default(false) bool is_profile_complete,
    Addressdata? address,
    String? token,
  }) = _CustomerRegData;

  factory CustomerRegData.fromJson(Map<String, Object?> json) =>
      _$CustomerRegDataFromJson(json);
}

@freezed
class Addressdata with _$Addressdata {
  const factory Addressdata({
    String? street_address,
    double? longitude,
    double? latitude,
  }) = _Addressdata;

  factory Addressdata.fromJson(Map<String, Object?> json) =>
      _$AddressdataFromJson(json);
}
