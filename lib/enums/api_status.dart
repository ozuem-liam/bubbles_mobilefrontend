import 'package:flutter/foundation.dart';

enum StatusCode {
  success,
  badRequest,
  notFound,
  serverError,
}

extension GetStatusCodeValue on StatusCode {
  String get _name => describeEnum(this);
  int get name {
    switch (_name) {
      case "success":
        return 200;
      case "badRequest":
        return 400;
      case "notFound":
        return 404;
      default:
        return 500;
    }
  }
}
