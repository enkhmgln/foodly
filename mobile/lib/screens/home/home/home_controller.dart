import 'package:get/get.dart';
import '/core/shared/session_manager.dart';
import '/screens/scan/_.dart';
import '/screens/search/_.dart';

class HomeController extends GetxController {
  void onScanTap() {
    Get.toNamed(ScanView.routeName);
  }

  void onSearchTap() {
    Get.toNamed(SearchView.routeName);
  }

  Future<void> logout() async {
    await SessionManager.shared.logout();
  }
}
