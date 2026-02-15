import 'package:flutter/material.dart';
import '/components/button/app_button_model.dart';

class AppButtonWidget extends StatelessWidget {
  const AppButtonWidget({
    super.key,
    required this.model,
    this.onPressed,
  });

  final AppButtonModel model;
  final VoidCallback? onPressed;

  VoidCallback? get _effectiveOnPressed =>
      (model.isLoading || !model.isEnabled) ? null : onPressed;

  Widget _buildChild() {
    if (model.isLoading) {
      return SizedBox.square(
        dimension: model.size.iconSize,
        child: CircularProgressIndicator(
          strokeWidth: 2,
          valueColor: AlwaysStoppedAnimation<Color>(model.foreColor),
        ),
      );
    }
    final text = Text(
      model.label,
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
      style: TextStyle(
        fontSize: model.size.fontSize,
        fontWeight: FontWeight.w600,
        color: model.foreColor,
      ),
    );
    final hasIcon = model.prefixIcon != null || model.suffixIcon != null;
    if (!hasIcon) return text;
    return Row(
      mainAxisSize: model.isExpanded ? MainAxisSize.max : MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (model.prefixIcon != null) ...[
          Icon(model.prefixIcon, size: model.size.iconSize, color: model.foreColor),
          const SizedBox(width: 12),
        ],
        Flexible(child: text),
        if (model.suffixIcon != null) ...[
          const SizedBox(width: 12),
          Icon(model.suffixIcon, size: model.size.iconSize, color: model.foreColor),
        ],
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final child = _buildChild();
    final height = model.size.height;

    switch (model.type) {
      case AppButtonType.primary:
        return SizedBox(
          height: height,
          width: model.isExpanded ? double.infinity : null,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: model.backColor,
              foregroundColor: model.foreColor,
              disabledBackgroundColor: model.backColor,
              disabledForegroundColor: model.foreColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(model.borderRadius),
              ),
            ),
            onPressed: _effectiveOnPressed,
            child: child,
          ),
        );
      case AppButtonType.outline:
        return SizedBox(
          height: height,
          width: model.isExpanded ? double.infinity : null,
          child: OutlinedButton(
            style: OutlinedButton.styleFrom(
              foregroundColor: model.foreColor,
              backgroundColor: model.backColor,
              disabledForegroundColor: model.foreColor,
              disabledBackgroundColor: model.backColor,
              side: BorderSide(color: model.borderColor),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(model.borderRadius),
              ),
            ),
            onPressed: _effectiveOnPressed,
            child: child,
          ),
        );
      case AppButtonType.text:
        return SizedBox(
          height: height,
          width: model.isExpanded ? double.infinity : null,
          child: TextButton(
            style: TextButton.styleFrom(
              foregroundColor: model.foreColor,
              disabledForegroundColor: model.foreColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(model.borderRadius),
              ),
            ),
            onPressed: _effectiveOnPressed,
            child: child,
          ),
        );
    }
  }
}
