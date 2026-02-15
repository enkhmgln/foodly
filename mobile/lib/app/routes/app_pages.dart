import 'package:get/get.dart';
import 'package:foodly/screens/init/_.dart';
import 'package:foodly/screens/auth/onboarding/_.dart';
import 'package:foodly/screens/auth/login/_.dart';
import 'package:foodly/screens/auth/signup/_.dart';
import 'package:foodly/screens/home/home/_.dart';
import 'package:foodly/screens/scan/_.dart';
import 'package:foodly/screens/search/_.dart';
import 'package:foodly/screens/product_detail/_.dart';

class AppPages {
  AppPages._();

  static String get initial => InitView.routeName;

  static final List<GetPage> routes = [
    GetPage(
      name: InitView.routeName,
      page: () => const InitView(),
      binding: InitBinding(),
    ),
    GetPage(
      name: OnboardingView.routeName,
      page: () => const OnboardingView(),
      binding: OnboardingBinding(),
    ),
    GetPage(
      name: LoginView.routeName,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: SignupView.routeName,
      page: () => const SignupView(),
      binding: SignupBinding(),
    ),
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
