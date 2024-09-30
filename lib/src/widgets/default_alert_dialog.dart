import 'package:flutter/material.dart';
import 'package:navigation_service/navigation_service.dart';
import 'package:ui_kit/src/styles/core_colors.dart';

class DefaultAlertDialog {
  final double? verticalPadding;
  final double? horizontalPadding;
  final double? insetPadding;
  final double? borderRadius;
  final double? width;
  final double? height;
  final Color? backgroundColor;
  final Widget? title;
  final EdgeInsetsGeometry? iconPadding;
  final List<Widget> widgets;
  final List<Widget>? actions;

  const DefaultAlertDialog._internal({
    required this.widgets,
    this.verticalPadding,
    this.horizontalPadding,
    this.insetPadding,
    this.borderRadius,
    this.backgroundColor,
    this.width,
    this.height,
    this.actions,
    this.title,
    this.iconPadding,
  });

  static DefaultAlertDialog? _instance;

  factory DefaultAlertDialog({
    required List<Widget> widgets,
    List<Widget>? actions,
    double? verticalPadding,
    double? horizontalPadding,
    double? insetPadding,
    double? borderRadius,
    double? width,
    double? height,
    Color? backgroundColor,
    Widget? title,
    EdgeInsetsGeometry? iconPadding,
  }) {
    _instance ??= DefaultAlertDialog._internal(
      widgets: widgets,
      borderRadius: borderRadius,
      width: width,
      height: height,
      actions: actions,
      horizontalPadding: horizontalPadding,
      insetPadding: insetPadding,
      verticalPadding: verticalPadding,
      backgroundColor: backgroundColor,
      title: title,
      iconPadding: iconPadding,
    );
    return _instance!;
  }

  Future show() async {
    showDialog<void>(
      barrierDismissible: false,
      context: NavigationService.context,
      builder: (BuildContext dialogContext) {
        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding ?? 5,
            vertical: verticalPadding ?? 5,
          ),
          child: AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(borderRadius ?? 24),
              ),
            ),
            insetPadding: EdgeInsets.symmetric(horizontal: insetPadding ?? 20),
            backgroundColor: backgroundColor ?? CoreColors.white,
            title: title,
            actions: actions,
            icon: GestureDetector(
              onTap: () {
                NavigationService.pop();
              },
              child: const Icon(
                Icons.clear,
                color: CoreColors.black,
                size: 25,
              ),
            ),
            iconPadding: iconPadding ??
                const EdgeInsetsDirectional.only(start: 300, top: 10),
            content: SizedBox(
              width: width ?? 300,
              height: height ?? 200,
              child: Align(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: widgets,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
