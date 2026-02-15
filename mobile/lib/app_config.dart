import 'package:flutter/widgets.dart';

import '/core/shared/store_manager.dart';

abstract class AppConfig {
  AppConfig._();

  static Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await UserStoreManager.shared.init();
    await DeviceStoreManager.shared.init();
  }
}
