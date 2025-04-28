
import 'package:buypass_seller/src/core/theme/app_colors.dart';
import 'package:buypass_seller/src/shared/widgets/loading_widget.dart';
import 'package:buypass_seller/src/shared/widgets/text_widget.dart/dm_sns_text.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.onPressed,
    required this.title,
    this.icon,
    this.padding,
    this.buttonSize,
    this.fontSize = 16,
    this.isLoading = false,
    this.color = AppColors.pageColor,
    this.textColor = AppColors.white,
  });

  final VoidCallback onPressed;
  final Widget? icon;
  final String title;
  final Size? buttonSize;
  final EdgeInsetsGeometry? padding;
  final double fontSize;
  final Color color;
  final Color textColor;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        padding: padding,
        minimumSize: buttonSize ?? const Size(50, 40),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        alignment: Alignment.center,

        // Removes extra height
        overlayColor: WidgetStateColor.resolveWith((states) => Colors.white),

        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        backgroundColor: color,
      ),
      onPressed: isLoading ? () {} : onPressed,
      child:
          isLoading
              ? LoadingWidget(height: 20, width: 20, color: textColor)
              : Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MdSnsText(size: fontSize, title, fontWeight: FontWeight.w500, color: textColor),
                  if (icon != null) ...[const SizedBox(width: 12), icon!],
                ],
              ),
    );
  }
}

class AppBorderButton extends StatelessWidget {
  const AppBorderButton({
    super.key,
    required this.onPressed,
    required this.title,
    this.icon,
    this.padding,
    this.buttonSize,
    this.fontSize = 16,
    this.borderRadius = 25,
    this.isLoading = false,
    this.color = AppColors.primaryColor,
    this.textColor = AppColors.primaryColor,
    this.borderColor = AppColors.primaryColor,
    this.fontWeight = FontWeight.w500,
  });

  final VoidCallback onPressed;
  final Widget? icon;
  final String title;
  final Size? buttonSize;
  final EdgeInsetsGeometry? padding;
  final double fontSize;
  final double borderRadius;
  final Color color;
  final Color textColor;
  final Color borderColor;
  final FontWeight fontWeight;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        padding: padding,
        minimumSize: buttonSize ?? const Size(600, 40),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        alignment: Alignment.center,

        // Removes extra height
        overlayColor: WidgetStateColor.resolveWith((states) => Colors.white),
        backgroundBuilder: (context, states, child) {
          return DecoratedBox(
            decoration: BoxDecoration(
              border: Border.all(color: borderColor),
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            child: IntrinsicHeight(child: child),
          );
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRadius)),
        backgroundColor: color,
      ),
      onPressed: isLoading ? () {} : onPressed,
      child:
          isLoading
              ? LoadingWidget(height: 20, width: 20, color: textColor)
              : Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MdSnsText(size: fontSize, title, fontWeight: fontWeight, color: textColor),
                  if (icon != null) ...[const SizedBox(width: 6), icon!],
                ],
              ),
    );
  }
}

class AppIconButton extends StatelessWidget {
  const AppIconButton({
    super.key,
    required this.onPressed,
    required this.title,
    this.icon,
    this.leftIcon,
    this.padding,
    this.buttonSize,
    this.fontSize = 16,
    this.borderRadius = 25,
    this.color = AppColors.primaryColor,
    this.textColor = AppColors.white,
    this.borderColor = AppColors.primaryColor,
    this.fontWeight = FontWeight.w500,
  });

  final VoidCallback onPressed;
  final Widget? icon;
  final Widget? leftIcon;
  final String title;
  final Size? buttonSize;
  final EdgeInsetsGeometry? padding;
  final double fontSize;
  final double borderRadius;
  final Color color;
  final Color textColor;
  final Color borderColor;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,

      child: Container(
        height: buttonSize?.height,
        width: buttonSize?.width,
        decoration: BoxDecoration(
          border: Border.all(color: borderColor),
          color: color,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (leftIcon != null) ...[leftIcon!, SizedBox(width:  8)],
            if (icon != null && leftIcon == null) ...[const SizedBox(width: 6)],

            MdSnsText(size: fontSize, title, fontWeight: fontWeight, color: textColor),
            if (icon == null && leftIcon != null) ...[SizedBox(width:  8)],

            if (icon != null) ...[const SizedBox(width: 6), icon!],
          ],
        ),
      ),
    );
  }
}
