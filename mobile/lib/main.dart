import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/app/routes/app_pages.dart';
import '/app/theme/app_theme.dart';
import '/client/api/api_client.dart';
import '/client/api/auth_api.dart';
import '/core/services/auth_service.dart';
import '/core/storage/onboarding_storage.dart';
import '/core/storage/secure_storage_service.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put<SecureStorageService>(SecureStorageService());
  Get.put<AuthService>(AuthService());
  Get.put<ApiClient>(ApiClient());
  Get.put<AuthApi>(AuthApi());
  Get.put<OnboardingStorage>(OnboardingStorage());
  runApp(const FoodlyApp());
}

class FoodlyApp extends StatelessWidget {
  const FoodlyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Foodly',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme,
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
    );
  }
}
