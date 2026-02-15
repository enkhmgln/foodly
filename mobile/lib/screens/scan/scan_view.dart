import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import '/app/theme/app_colors.dart';
import '/components/_.dart';
import '/screens/scan/scan_controller.dart';

class ScanView extends GetView<ScanController> {
  const ScanView({super.key});

  static const String routeName = '/scan';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppAppBar(
        titleText: 'Бүтээгдэхүүн скан хийх',
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: Stack(
        children: [
          MobileScanner(
            controller: MobileScannerController(
              detectionSpeed: DetectionSpeed.normal,
              facing: CameraFacing.back,
            ),
            onDetect: (capture) {
              final barcodes = capture.barcodes;
              if (barcodes.isNotEmpty) {
                final code = barcodes.first.rawValue;
                if (code != null && code.isNotEmpty) {
                  controller.onBarcodeDetected(code);
                }
              }
            },
          ),
          Center(
            child: Container(
              width: 260,
              height: 260,
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.primary, width: 3),
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
          Obx(() {
            if (!controller.isLoading.value) {
              return const SizedBox.shrink();
            }
            return Container(
              color: Colors.black54,
              child: const AppLoading(color: AppColors.primary),
            );
          }),
        ],
      ),
    );
  }
}
