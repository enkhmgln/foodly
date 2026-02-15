import 'package:flutter/material.dart';
import '/app/theme/app_colors.dart';

class AppAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AppAppBar({
    super.key,
    this.titleText,
    this.title,
    this.leading,
    this.actions,
    this.bottom,
    this.backgroundColor,
    this.foregroundColor,
    this.showLeading = true,
  });

  final String? titleText;
  final Widget? title;
  final Widget? leading;
  final List<Widget>? actions;
  final PreferredSizeWidget? bottom;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final bool showLeading;

  @override
  Size get preferredSize {
    final bottomHeight = bottom?.preferredSize.height ?? 0;
    return Size.fromHeight(kToolbarHeight + bottomHeight);
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor ?? AppColors.background,
      foregroundColor: foregroundColor ?? AppColors.textPrimary,
      centerTitle: true,
      elevation: 0,
      automaticallyImplyLeading: showLeading,
      leading: showLeading ? leading : const SizedBox.shrink(),
      leadingWidth: showLeading ? null : 0,
      actions: actions,
      bottom: bottom,
      title: title ??
          (titleText != null
              ? Text(
                  titleText!,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: foregroundColor ?? AppColors.textPrimary,
                      ),
                )
              : null),
    );
  }
}
