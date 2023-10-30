// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reg_customer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CustomerRegDataImpl _$$CustomerRegDataImplFromJson(
        Map<String, dynamic> json) =>
    _$CustomerRegDataImpl(
      id: json['id'] as String?,
      first_name: json['first_name'] as String?,
      last_name: json['last_name'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      user_type: json['user_type'] as String?,
      biometric_login: json['biometric_login'] as bool? ?? false,
      is_profile_complete: json['is_profile_complete'] as bool? ?? false,
      address: json['address'] == null
          ? null
          : Addressdata.fromJson(json['address'] as Map<String, dynamic>),
      token: json['token'] as String?,
    );

Map<String, dynamic> _$$CustomerRegDataImplToJson(
        _$CustomerRegDataImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'first_name': instance.first_name,
      'last_name': instance.last_name,
      'email': instance.email,
      'phone': instance.phone,
      'user_type': instance.user_type,
      'biometric_login': instance.biometric_login,
      'is_profile_complete': instance.is_profile_complete,
      'address': instance.address,
      'token': instance.token,
    };

_$AddressdataImpl _$$AddressdataImplFromJson(Map<String, dynamic> json) =>
    _$AddressdataImpl(
      street_address: json['street_address'] as String?,
      longitude: (json['longitude'] as num?)?.toDouble(),
      latitude: (json['latitude'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$AddressdataImplToJson(_$AddressdataImpl instance) =>
    <String, dynamic>{
      'street_address': instance.street_address,
      'longitude': instance.longitude,
      'latitude': instance.latitude,
    };
