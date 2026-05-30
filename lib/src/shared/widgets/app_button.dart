import 'package:shop_z/src/extensions/spAdabt.dart';

import '../../imports/imports.dart';

/// A fully themed button supporting all [ButtonVariant]s and [ButtonSize]s.
//
/// Usage:
/// ```dart
/// AppButton(
///   label: 'Save',
///   onPressed: _save,
///   variant: ButtonVariant.primary,
///   size: ButtonSize.large,
///   isLoading: state.isLoading,
/// )
/// ```
class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.label,
    this.onPressed,
    this.variant = ButtonVariant.primary,
    this.color,
    this.textColor,
    this.height = ButtonSize.medium,
    this.width,
    this.isLoading = false,
    this.isFullWidth = false,
    this.prefixIcon,
    this.suffixIcon,
  });

  final String label;
  final VoidCallback? onPressed;
  final ButtonVariant variant;
  final Color? color;
  final Color? textColor;
  final ButtonSize height;
  final ButtonSize? width;
  final bool isLoading;
  final bool isFullWidth;
  final Widget? prefixIcon;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    final appColors = context.theme.extension<AppColorsExtension>()!;
    final cs = context.theme.colorScheme;
    final isDisabled = onPressed == null || isLoading;

    final double buttonHeight = switch (height) {
      ButtonSize.small => 25.spAdaptive(context),
      ButtonSize.medium => 30.spAdaptive(context),
      ButtonSize.large => 40.spAdaptive(context),
    };

    final double? buttonWidth = switch (width) {
      ButtonSize.small => 50.spAdaptive(context),
      ButtonSize.medium => 100.spAdaptive(context),
      ButtonSize.large => 150.spAdaptive(context),
      null => null,
    };

    final double horizontalPadding = switch (height) {
      ButtonSize.small => 12,
      ButtonSize.medium => 20,
      ButtonSize.large => 28,
    };

    final double fontSize = switch (height) {
      ButtonSize.small => 7.spAdaptive(context),
      ButtonSize.medium => 9.spAdaptive(context),
      ButtonSize.large => 10.spAdaptive(context),
    };

    final (bg, fg, border) = switch (variant) {
      ButtonVariant.primary => (
          color ?? cs.primary,
          color ?? Colors.white,
          null
        ),
      ButtonVariant.secondary => (
          color ?? cs.primary.withValues(alpha: 0.1),
          color ?? cs.onPrimary,
          null
        ),
      ButtonVariant.outline => (
          Colors.transparent,
          cs.onSurface,
          BorderSide(color: cs.secondary, width: 1.5)
        ),
      ButtonVariant.ghost => (
          Colors.transparent,
          context.theme.colorScheme.primary,
          null
        ),
      ButtonVariant.danger => (
          context.appColors.info,
          context.appColors.warning,
          null
        ),
      ButtonVariant.success => (appColors.success, appColors.onSuccess, null),
    };

    final child = AnimatedSwitcher(
      duration: AppDurations.fast,
      switchInCurve: AppCurves.decelerate,
      child: isLoading
          ? SizedBox(
              key: const ValueKey('loader'),
              width: 20.spAdaptive(context),
              height: 20.spAdaptive(context),
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: fg,
              ),
            )
          : Row(
              key: const ValueKey('content'),
              mainAxisSize: MainAxisSize.min,
              children: [
                if (prefixIcon != null) ...[
                  prefixIcon!,
                  const SizedBox(width: 8),
                ],
                Text(
                  label,
                  style: TextStyle(
                    fontSize: fontSize,
                    fontWeight: FontWeight.normal,
                    color: isDisabled
                        ? fg.withValues(alpha: 0.5)
                        : textColor ?? fg,
                  ),
                ),
                if (suffixIcon != null) ...[
                  const SizedBox(width: 8),
                  suffixIcon!,
                ],
              ],
            ),
    );

    return AnimatedOpacity(
      duration: AppDurations.fast,
      opacity: isDisabled ? 0.6 : 1.0,
      child: SizedBox(
        width: isFullWidth ? double.infinity : buttonWidth,
        height: buttonHeight,
        child: TextButton(
          onPressed: isDisabled ? null : onPressed,
          style: TextButton.styleFrom(
            backgroundColor: bg,
            foregroundColor: fg,
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
            shape: border != null
                ? RoundedRectangleBorder(
                    borderRadius: AppBorders.button,
                    side: border,
                  )
                : const RoundedRectangleBorder(borderRadius: AppBorders.button),
          ),
          child: child,
        ),
      ),
    );
  }
}
