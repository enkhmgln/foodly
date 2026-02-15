import 'package:get/get.dart';
import '/core/shared/user_manager.dart';
import '/screens/splash/_.dart';
import '/screens/auth/onboarding/_.dart';
import '/screens/auth/login/_.dart';
import '/screens/auth/signup/_.dart';
import '/screens/home/home/_.dart';
import '/screens/scan/_.dart';
import '/screens/search/_.dart';
import '/screens/product_detail/_.dart';

class AppPages {
  AppPages._();

  /// First screen shown (splash).
  static String get splash => SplashView.routeName;

  static String get initial => !UserManager.isOnboardingCompleted
      ? OnboardingView.routeName
      : !UserManager.isLogged
      ? LoginView.routeName
      : HomeView.routeName;

  static final List<GetPage> routes = [
    GetPage(
      name: SplashView.routeName,
      page: () => const SplashView(),
      binding: SplashBinding(),
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
