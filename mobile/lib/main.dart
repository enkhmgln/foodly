import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:foodly/app/routes/app_pages.dart';
import 'package:foodly/app/theme/app_theme.dart';
import 'package:foodly/client/api/api_client.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put<ApiClient>(ApiClient());
  runApp(const FoodlyApp());
}

class FoodlyApp extends StatelessWidget {
  const FoodlyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Foodly',
      theme: AppTheme.theme,
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
    );
  }
}
