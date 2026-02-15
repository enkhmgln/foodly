import 'package:flutter/material.dart';

class AppTextFieldModel {
  AppTextFieldModel({
    this.label,
    this.hint,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.enabled = true,
    this.readOnly = false,
    this.autofocus = false,
    this.maxLength,
    this.maxLines = 1,
  })  : controller = TextEditingController(),
        focusNode = FocusNode();

  final String? label;
  final String? hint;
  final TextInputType keyboardType;
  bool obscureText;
  bool enabled;
  final bool readOnly;
  final bool autofocus;
  final int? maxLength;
  final int maxLines;

  final TextEditingController controller;
  final FocusNode focusNode;

  String get value => controller.text;

  void setText(String text) {
    controller.text = text;
  }

  void dispose() {
    controller.dispose();
    focusNode.dispose();
  }
}
