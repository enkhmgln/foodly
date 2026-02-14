import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:foodly/client/api/api_client.dart';
import 'package:foodly/main.dart';

void main() {
  setUpAll(() {
    Get.testMode = true;
    Get.put<ApiClient>(ApiClient());
  });

  testWidgets('App starts and shows Foodly home', (WidgetTester tester) async {
    await tester.pumpWidget(const FoodlyApp());
    await tester.pumpAndSettle();

    expect(find.text('Foodly'), findsOneWidget);
  });
}
