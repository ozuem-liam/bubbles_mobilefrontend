// To parse this JSON data, do
//
//     final vendorUserData = vendorUserDataFromJson(jsonString);

import 'dart:convert';

VendorUserData vendorUserDataFromJson(String str) => VendorUserData.fromJson(json.decode(str));

String vendorUserDataToJson(VendorUserData data) => json.encode(data.toJson());

class VendorUserData {
    int? code;
    String? message;
    VendorData? data;

    VendorUserData({
        this.code,
        this.message,
        this.data,
    });

    factory VendorUserData.fromJson(Map<String, dynamic> json) => VendorUserData(
        code: json["code"],
        message: json["message"],
        data: json["data"] == null ? null : VendorData.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "data": data?.toJson(),
    };
}

class VendorData {
    String? id;
    String? firstName;
    String? lastName;
    String? name;
    String? email;
    String? phone;
    String? businessName;
    String? address;
    String? userType;
    bool? isProfileComplete;
    bool? twoFactorAuth;
    String? token;

    VendorData({
        this.id,
        this.firstName,
        this.lastName,
        this.name,
        this.email,
        this.phone,
        this.businessName,
        this.address,
        this.userType,
        this.isProfileComplete,
        this.twoFactorAuth,
        this.token,
    });

    factory VendorData.fromJson(Map<String, dynamic> json) => VendorData(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        businessName: json["business_name"],
        address: json["address"],
        userType: json["user_type"],
        isProfileComplete: json["is_profile_complete"],
        twoFactorAuth: json["two_factor_auth"],
        token: json["token"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "name": name,
        "email": email,
        "phone": phone,
        "business_name": businessName,
        "address": address,
        "user_type": userType,
        "is_profile_complete": isProfileComplete,
        "two_factor_auth": twoFactorAuth,
        "token": token,
    };
}
