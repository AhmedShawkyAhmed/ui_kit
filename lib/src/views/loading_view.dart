import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingView extends StatelessWidget {
  const LoadingView({
    super.key,
    required this.iconColor,
  });

  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return SpinKitFadingCircle(
      color: iconColor,
      duration: const Duration(
        milliseconds: 800,
      ),
    );
  }
}
