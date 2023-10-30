// To parse this JSON data, do
//
//     final shopServiceResponseModel = shopServiceResponseModelFromJson(jsonString);

import 'dart:convert';

ShopServiceResponseModel shopServiceResponseModelFromJson(String str) => ShopServiceResponseModel.fromJson(json.decode(str));

String shopServiceResponseModelToJson(ShopServiceResponseModel data) => json.encode(data.toJson());

class ShopServiceResponseModel {
    int? code;
    String? message;
    ShopServiceData? data;

    ShopServiceResponseModel({
        this.code,
        this.message,
        this.data,
    });

    factory ShopServiceResponseModel.fromJson(Map<String, dynamic> json) => ShopServiceResponseModel(
        code: json["code"],
        message: json["message"],
        data: json["data"] == null ? null : ShopServiceData.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "data": data?.toJson(),
    };
}

class ShopServiceData {
    List<ServiceData>? services;

    ShopServiceData({
        this.services,
    });

    factory ShopServiceData.fromJson(Map<String, dynamic> json) => ShopServiceData(
        services: json["services"] == null ? [] : List<ServiceData>.from(json["services"]!.map((x) => ServiceData.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "services": services == null ? [] : List<dynamic>.from(services!.map((x) => x.toJson())),
    };
}

class ServiceData {
    String? id;
    String? name;
    String? meta;
    int? v;

    ServiceData({
        this.id,
        this.name,
        this.meta,
        this.v,
    });

    factory ServiceData.fromJson(Map<String, dynamic> json) => ServiceData(
        id: json["_id"],
        name: json["name"],
        meta: json["meta"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "meta": meta,
        "__v": v,
    };
}
