import 'package:freezed_annotation/freezed_annotation.dart';
part 'services.freezed.dart';
part 'services.g.dart';

@freezed
class ServicesData with _$ServicesData {
  const factory ServicesData({
    required String name,
    required String descrip,
    required String icon,
  }) = _ServicesData;

  factory ServicesData.fromJson(Map<String, dynamic> json) =>
      _$ServicesDataFromJson(json);
}
