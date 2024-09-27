import 'package:flutter/material.dart';
import 'package:ui_kit/src/styles/core_colors.dart';

class ErrorView extends StatelessWidget {
  final String? errorMessage;
  final VoidCallback? onRetry;
  final EdgeInsetsGeometry? margin;

  const ErrorView(
    this.errorMessage, {
    this.onRetry,
    this.margin,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: margin ?? EdgeInsets.zero,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.warning,
              color: CoreColors.red,
              size: 64,
            ),
            const SizedBox(
              height: 2,
            ),
            Text(
              errorMessage ?? "Error",
              style: const TextStyle(
                fontSize: 15,
                color: CoreColors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            if (onRetry != null)
              SizedBox(
                width: 0.5,
                height: 40,
                child: GestureDetector(
                  onTap: () {
                    onRetry!.call();
                  },
                  child: const Text(
                    "Try Again",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
