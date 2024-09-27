import 'package:flutter/material.dart';
import 'package:ui_kit/src/styles/core_colors.dart';

class DefaultButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final Color? textColor;
  final Color? buttonColor;
  final Color? shadowColor;
  final double? fontSize;
  final double? width;
  final double? height;
  final double? radius;
  final double? spreadRadius;
  final double? blurRadius;
  final Offset? offset;
  final FontWeight? fontWeight;
  final TextDecoration? textDecoration;
  final AlignmentGeometry? begin;
  final AlignmentGeometry? end;
  final List<Color>? gradientColors;
  final bool isGradient;
  final bool haveShadow;
  final double? marginHorizontal;
  final double? marginVertical;

  const DefaultButton({
    required this.title,
    required this.onTap,
    this.buttonColor,
    this.textColor,
    this.width,
    this.height,
    this.radius,
    this.fontSize,
    this.fontWeight,
    this.textDecoration,
    this.begin,
    this.end,
    this.offset,
    this.gradientColors,
    this.shadowColor,
    this.spreadRadius,
    this.blurRadius,
    this.marginHorizontal,
    this.marginVertical,
    this.isGradient = false,
    this.haveShadow = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width ?? 250,
        height: height ?? 40,
        margin: EdgeInsets.symmetric(
          horizontal: marginHorizontal ?? 0,
          vertical: marginVertical ?? 0,
        ),
        decoration: BoxDecoration(
          gradient: isGradient
              ? LinearGradient(
                  begin: begin ?? Alignment.centerLeft,
                  end: end ?? Alignment.centerRight,
                  colors: gradientColors ??
                      [
                        CoreColors.lightBlue,
                        CoreColors.darkBlue,
                      ],
                )
              : null,
          boxShadow: [
            haveShadow
                ? BoxShadow(
                    color: shadowColor ?? CoreColors.white.withOpacity(0.2),
                    spreadRadius: spreadRadius ?? 2,
                    blurRadius: blurRadius ?? 2,
                    offset: offset ?? const Offset(1, 1),
                  )
                : const BoxShadow(),
          ],
          borderRadius: BorderRadius.circular(radius ?? 50),
          color: buttonColor ?? CoreColors.blue,
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: textColor ?? CoreColors.white,
              fontSize: fontSize ?? 15,
              fontWeight: fontWeight ?? FontWeight.w400,
              decoration: textDecoration ?? TextDecoration.none,
            ),
          ),
        ),
      ),
    );
  }
}
