import 'package:flutter/material.dart';
import '/app/theme/app_colors.dart';
import '/components/text_field/app_text_field_model.dart';
import '/core/utils/validator.dart';

class AppTextFieldWidget extends StatefulWidget {
  const AppTextFieldWidget({
    super.key,
    required this.model,
    this.onChanged,
    this.onSubmitted,
  });

  final AppTextFieldModel model;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;

  @override
  State<AppTextFieldWidget> createState() => _AppTextFieldWidgetState();
}

class _AppTextFieldWidgetState extends State<AppTextFieldWidget> {
  @override
  void initState() {
    super.initState();
    final m = widget.model;
    if (m.validators != null && m.validators!.isNotEmpty) {
      Validator(validations: m.validators!).setValidation(
        controller: m.controller,
        errorNotifier: m.errorText,
      );
    }
    m.errorText.addListener(_onErrorChanged);
  }

  @override
  void didUpdateWidget(covariant AppTextFieldWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.model != widget.model) {
      oldWidget.model.errorText.removeListener(_onErrorChanged);
      widget.model.errorText.addListener(_onErrorChanged);
    }
  }

  @override
  void dispose() {
    widget.model.errorText.removeListener(_onErrorChanged);
    super.dispose();
  }

  void _onErrorChanged() {
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final m = widget.model;
    final theme = Theme.of(context);

    return ValueListenableBuilder<String?>(
      valueListenable: m.errorText,
      builder: (context, errorText, _) {
        return TextFormField(
          controller: m.controller,
          focusNode: m.focusNode,
          keyboardType: m.keyboardType,
          obscureText: m.obscureText,
          enabled: m.enabled,
          readOnly: m.readOnly,
          autofocus: m.autofocus,
          maxLength: m.maxLength,
          maxLines: m.maxLines,
          autocorrect: false,
          onChanged: widget.onChanged,
          onFieldSubmitted: widget.onSubmitted,
          style: theme.textTheme.bodyLarge?.copyWith(
            color: m.enabled ? AppColors.textPrimary : AppColors.textSecondary,
          ),
          decoration: InputDecoration(
            labelText: m.label,
            hintText: m.hint,
            errorText: errorText,
            filled: true,
            fillColor: m.enabled
                ? AppColors.surface
                : AppColors.surface.withValues(alpha: 0.6),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                color: AppColors.textSecondary,
                width: 0.5,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: AppColors.primary, width: 1.5),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: AppColors.scoreBad),
            ),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            suffixIcon: m.keyboardType == TextInputType.visiblePassword
                ? IconButton(
                    icon: Icon(
                      m.obscureText
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      color: AppColors.textSecondary,
                    ),
                    onPressed: () {
                      setState(() {
                        m.obscureText = !m.obscureText;
                      });
                    },
                  )
                : null,
          ),
        );
      },
    );
  }
}
