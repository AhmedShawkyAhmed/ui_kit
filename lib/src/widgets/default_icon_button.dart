import 'package:flutter/material.dart';
import 'package:ui_kit/src/styles/core_colors.dart';

class DefaultIconButton extends StatelessWidget {
  final VoidCallback onPress;
  final IconData? icon;
  final Color? iconColor;
  final double? iconSize;
  final Color? buttonColor;
  final TextStyle? textStyle;
  final double? radius;
  final double? spaceBetween;
  final String? text;
  final double? width;
  final double? height;
  final double? marginHorizontal;
  final double? marginVertical;

  const DefaultIconButton({
    required this.onPress,
    this.iconColor,
    this.buttonColor,
    this.iconSize,
    this.icon,
    this.radius,
    this.height,
    this.spaceBetween,
    this.width,
    this.text,
    this.textStyle,
    this.marginHorizontal,
    this.marginVertical,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        width: width ?? 50,
        height: height ?? 50,
        margin: EdgeInsets.symmetric(
          horizontal: marginHorizontal ?? 0,
          vertical: marginVertical ?? 0,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius ?? 100),
          color: buttonColor ?? CoreColors.blue,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              icon ?? Icons.add,
              color: iconColor ?? CoreColors.white,
              size: iconSize ?? 30,
            ),
            if (text != null) ...[
              SizedBox(width: spaceBetween ?? 10),
              Text(
                text!,
                style: textStyle ??
                    const TextStyle(
                      color: CoreColors.white,
                      fontSize: 25,
                    ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
