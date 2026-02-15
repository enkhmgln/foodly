import 'package:get/get.dart';
import 'package:foodly/core/services/auth_service.dart';
import 'package:foodly/screens/scan/_.dart';
import 'package:foodly/screens/search/_.dart';

class HomeController extends GetxController {
  final AuthService _authService = Get.find<AuthService>();

  void onScanTap() {
    Get.toNamed(ScanView.routeName);
  }

  void onSearchTap() {
    Get.toNamed(SearchView.routeName);
  }

  Future<void> logout() async {
    await _authService.logout();
  }
}
