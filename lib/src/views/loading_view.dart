import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingView extends StatelessWidget {
  final Color iconColor;
  final int? duration;

  const LoadingView._internal({
    required this.iconColor,
    this.duration,
  });

  static LoadingView? _instance;

  factory LoadingView({
    required Color iconColor,
    int? duration,
  }) {
    _instance ??= LoadingView._internal(
      iconColor: iconColor,
      duration: duration,
    );
    return _instance!;
  }

  @override
  Widget build(BuildContext context) {
    return SpinKitFadingCircle(
      color: iconColor,
      duration: Duration(
        milliseconds: duration ?? 800,
      ),
    );
  }
}
