
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:bubbles/viewModels/push_notification_vm.dart';

final pushNotificationprovider = ChangeNotifierProvider<PushNotificationViewModel>(
    (ref) => PushNotificationViewModel(ref));
