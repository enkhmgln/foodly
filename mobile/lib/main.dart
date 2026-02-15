import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/app/routes/app_pages.dart';
import '/app/theme/app_theme.dart';
import '/app_config.dart';

void main() async {
  await AppConfig.init();
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
