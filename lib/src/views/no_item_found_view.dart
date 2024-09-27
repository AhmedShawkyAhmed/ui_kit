import 'package:flutter/material.dart';
import 'package:ui_kit/src/styles/core_colors.dart';

class NoItemsFound extends StatelessWidget {
  final String message;
  final EdgeInsetsGeometry? margin;
  final double? maxWidth;
  final AlignmentGeometry? alignment;

  const NoItemsFound(
    this.message, {
    super.key,
    this.margin,
    this.maxWidth,
    this.alignment,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: maxWidth ?? double.infinity),
      alignment: alignment ?? Alignment.topCenter,
      margin: margin ?? const EdgeInsets.only(top: 10.0, bottom: 15),
      child: Text(
        message,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: CoreColors.blue,
          fontSize: 20,
        ),
      ),
    );
  }
}
