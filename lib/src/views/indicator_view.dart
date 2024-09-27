import 'package:flutter/material.dart';
import 'package:ui_kit/src/styles/core_colors.dart';
import 'package:ui_kit/src/views/loading_view.dart';

class IndicatorView {
  static Future show(BuildContext context) async {
    showDialog<void>(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return const Center(
          child: LoadingView(
            iconColor: CoreColors.blue,
          ),
        );
      },
    );
  }
}
