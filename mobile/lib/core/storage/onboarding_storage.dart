import 'package:shared_preferences/shared_preferences.dart';
import '/core/constants/constant.dart';

class OnboardingStorage {
  static const String _key = kOnboardingDone;

  Future<bool> hasSeenOnboarding() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_key) ?? false;
  }

  Future<void> setOnboardingDone() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_key, true);
  }
}
