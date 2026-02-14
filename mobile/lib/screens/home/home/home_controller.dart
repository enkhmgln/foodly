import 'package:get/get.dart';
import 'package:foodly/screens/scan/_.dart';
import 'package:foodly/screens/search/_.dart';

class HomeController extends GetxController {
  void onScanTap() {
    Get.toNamed(ScanView.routeName);
  }

  void onSearchTap() {
    Get.toNamed(SearchView.routeName);
  }
}
