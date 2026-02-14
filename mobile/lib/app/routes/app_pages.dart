import 'package:get/get.dart';
import 'package:foodly/screens/home/home/_.dart';
import 'package:foodly/screens/scan/_.dart';
import 'package:foodly/screens/search/_.dart';
import 'package:foodly/screens/product_detail/_.dart';

class AppPages {
  AppPages._();

  static String get initial => HomeView.routeName;

  static final List<GetPage> routes = [
    GetPage(
      name: HomeView.routeName,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: ScanView.routeName,
      page: () => const ScanView(),
      binding: ScanBinding(),
    ),
    GetPage(
      name: SearchView.routeName,
      page: () => const SearchView(),
      binding: SearchBinding(),
    ),
    GetPage(
      name: ProductDetailView.routeName,
      page: () => const ProductDetailView(),
      binding: ProductDetailBinding(),
    ),
  ];
}
