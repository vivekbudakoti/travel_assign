import 'package:flutter/material.dart';
import 'package:travel_assign/core/utils/extension.dart';

class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? color;
  final double borderRadius;
  final EdgeInsetsGeometry padding;
  final double? width;
  final double? height;
  final bool isDisabled;

  const AppButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.color,
    this.borderRadius = 100.0,
    this.padding = const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
    this.width,
    this.height = 52,
    this.isDisabled = false,
  });

  @override
  Widget build(BuildContext context) {
    final buttonColor = color ?? context.colorScheme.primaryContainer;

    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: isDisabled ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor,
          foregroundColor: Colors.white,
          padding: padding,
          elevation: 2,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRadius)),
          disabledBackgroundColor: context.colorScheme.onSurface.withValues(alpha: 0.12),
          disabledForegroundColor: Colors.white.withValues(alpha: 0.38),
        ),
        child: Text(
          text,
          style: context.textTheme.labelLarge?.copyWith(color: Colors.white, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
