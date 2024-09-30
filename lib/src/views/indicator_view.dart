import 'package:flutter/material.dart';
import 'package:navigation_service/navigation_service.dart';
import 'package:ui_kit/src/styles/core_colors.dart';
import 'package:ui_kit/src/views/loading_view.dart';

class IndicatorView {
  IndicatorView._();

  static Future show() async {
    showDialog<void>(
      barrierDismissible: false,
      context: NavigationService.context,
      builder: (BuildContext context) {
        return Center(
          child: LoadingView(
            iconColor: CoreColors.blue,
          ),
        );
      },
    );
  }
}
