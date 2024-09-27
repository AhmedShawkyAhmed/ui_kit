import 'package:flutter/material.dart';
import 'package:ui_kit/src/styles/core_colors.dart';

class DefaultTextField extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback? onTap;
  final String hintText;
  final double? height;
  final double? width;
  final Color? fillColor;
  final Color? borderColor;
  final Color? errorBorderColor;
  final Color? disabledBorderColor;
  final Color? textColor;
  final Color? cursorColor;
  final Color? hintColor;
  final double? fontSize;
  final bool? password;
  final String? counterText;
  final String? obscuringCharacter;
  final int? maxLine;
  final TextStyle? counterStyle;
  final bool? enabled;
  final Widget? prefix;
  final Widget? suffix;
  final double? bottom;
  final double? radius;
  final double? marginHorizontal;
  final double? marginVertical;
  final int? maxLength;
  final EdgeInsetsDirectional? contentPadding;
  final TextInputType? keyboardType;
  final TextDirection? textDirection;
  final Function(String)? onChange;

  const DefaultTextField({
    required this.controller,
    required this.hintText,
    this.password,
    this.onTap,
    this.height,
    this.maxLength,
    this.fillColor,
    this.textColor,
    this.borderColor,
    this.cursorColor,
    this.fontSize,
    this.obscuringCharacter,
    this.counterStyle,
    this.counterText,
    this.hintColor,
    this.width,
    this.enabled,
    this.maxLine,
    this.disabledBorderColor,
    this.errorBorderColor,
    this.contentPadding,
    this.prefix,
    this.suffix,
    this.bottom,
    this.radius,
    this.keyboardType,
    this.marginHorizontal,
    this.marginVertical,
    this.textDirection,
    this.onChange,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 30,
      width: width ?? 250,
      margin: EdgeInsets.symmetric(
        horizontal: marginHorizontal ?? 10,
        vertical: marginVertical ?? 2,
      ),
      decoration: BoxDecoration(
        color: fillColor ?? CoreColors.transparent,
        borderRadius: BorderRadius.circular(radius ?? 5),
      ),
      child: TextField(
        textInputAction: TextInputAction.go,
        onSubmitted: (value) {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        keyboardType: keyboardType ?? TextInputType.text,
        textAlignVertical: TextAlignVertical.center,
        enabled: enabled ?? true,
        controller: controller,
        obscureText: password ?? false,
        obscuringCharacter: obscuringCharacter ?? "*",
        textDirection: textDirection ?? TextDirection.ltr,
        style: TextStyle(
          color: textColor ?? CoreColors.darkGrey,
          fontSize: fontSize ?? 12,
        ),
        cursorColor: cursorColor ?? CoreColors.blue,
        maxLines: maxLine ?? 1,
        maxLength: maxLength,
        decoration: InputDecoration(
          counterText: counterText ?? "",
          counterStyle: counterStyle ??
              const TextStyle(
                color: CoreColors.lightGrey,
              ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius ?? 5),
            borderSide: BorderSide(
              color: borderColor ?? CoreColors.grey,
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius ?? 5),
            borderSide: BorderSide(
              color: disabledBorderColor ?? CoreColors.grey,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius ?? 5),
            borderSide: BorderSide(
              color: errorBorderColor ?? CoreColors.grey,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius ?? 5),
            borderSide: BorderSide(
              color: borderColor ?? CoreColors.grey,
            ),
          ),
          prefixIcon: prefix,
          suffixIcon: suffix,
          hintText: hintText,
          alignLabelWithHint: true,
          hintStyle: TextStyle(
            color: hintColor ?? CoreColors.darkGrey,
            fontSize: 12,
          ),
          border: InputBorder.none,
          hintTextDirection: textDirection ?? TextDirection.ltr,
          filled: true,
          fillColor: CoreColors.white,
          contentPadding: contentPadding ??
              const EdgeInsetsDirectional.only(
                bottom: 5,
                end: 5,
                start: 5,
              ),
        ),
        onChanged: onChange,
      ),
    );
  }
}
