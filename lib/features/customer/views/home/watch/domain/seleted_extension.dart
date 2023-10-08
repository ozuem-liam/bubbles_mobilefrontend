import 'package:flutter/foundation.dart';

enum HeaderStatus {
  wash,
  dryclean,
  iron,
  selfwash,
}

extension GetStatusCodeValue on HeaderStatus {
  String get _name => describeEnum(this);
  int get name {
    switch (_name) {
      case "wash":
        return 0;
      case "dryclean":
        return 1;
      case "iron":
        return 2;
      case "selfwash":
        return 3;
      default:
        return 0;
    }
  }
}
