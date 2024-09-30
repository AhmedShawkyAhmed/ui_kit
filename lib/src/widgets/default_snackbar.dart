import 'package:elegant_notification/elegant_notification.dart';
import 'package:elegant_notification/resources/arrays.dart';
import 'package:elegant_notification/resources/stacked_options.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:navigation_service/navigation_service.dart';
import 'package:ui_kit/src/styles/core_colors.dart';

class DefaultSnackbar {
  DefaultSnackbar._();

  static const double _defaultWidth = 400;
  static const TextStyle _titleStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: CoreColors.black,
  );
  static const TextStyle _messageStyle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: CoreColors.black,
  );
  static const AnimationType _animationType = AnimationType.fromBottom;
  static final StackedOptions _stackedOptions = StackedOptions(
    key: 'top',
    scaleFactor: 0.1,
    type: StackedType.above,
  );
  static final BoxShadow _boxShadow = BoxShadow(
    color: Colors.grey.shade300,
    offset: const Offset(0, 0),
    blurRadius: 5,
  );

  static const Alignment _position = Alignment.bottomCenter;

  static void showError(
    String? body, {
    String? title,
    int? statusCode,
    Widget? actionWidget,
    dynamic Function()? onActionPressed,
    Duration? duration,
    TextAlign? titleTextAlign,
    TextAlign? messageTextAlign,
  }) async {
    duration ??= getDurationFromLength(body);
    ElegantNotification.error(
      width: _defaultWidth,
      height: _getHeightFromLength(body?.length ?? 0),
      progressBarHeight: 5,
      title: _titleBuilder(
        title: title ?? 'Error ${kDebugMode ? (statusCode ?? '') : ''}',
        titleTextAlign: titleTextAlign,
      ),
      description: _descriptionBuilder(
        body: body ?? '',
        messageTextAlign: messageTextAlign,
      ),
      action: _actionBuilder(
        onActionPressed: onActionPressed,
        actionWidget: actionWidget,
      ),
      stackedOptions: _stackedOptions,
      shadow: _boxShadow,
      toastDuration: duration,
      animation: _animationType,
      position: _position,
      icon: const Icon(
        CupertinoIcons.clear_circled_solid,
        color: CoreColors.red,
        size: 24,
      ),
    ).show(NavigationService.context);
  }

  static void showWarning(
    String? body, {
    int? statusCode,
    Widget? action,
    String? title,
    dynamic Function()? onActionPressed,
    Duration? duration,
    TextAlign? titleTextAlign,
    TextAlign? messageTextAlign,
  }) async {
    duration ??= getDurationFromLength(body);
    ElegantNotification(
      width: _defaultWidth,
      height: _getHeightFromLength(body?.length ?? 0),
      title: _titleBuilder(
        title: title ?? "Attention",
        titleTextAlign: titleTextAlign,
      ),
      description: _descriptionBuilder(
        body: body ?? '',
        messageTextAlign: messageTextAlign,
      ),
      action: _actionBuilder(
        onActionPressed: onActionPressed,
        actionWidget: action,
      ),
      stackedOptions: _stackedOptions,
      shadow: _boxShadow,
      toastDuration: duration,
      icon: const Icon(
        CupertinoIcons.exclamationmark_circle_fill,
        color: CoreColors.lightOrange,
        size: 24,
      ),
      progressIndicatorColor: CoreColors.lightOrange,
      animation: _animationType,
      position: _position,
    ).show(NavigationService.context);
  }

  static void showInfo(
    String? body, {
    int? statusCode,
    Widget? action,
    String? title,
    dynamic Function()? onActionPressed,
    Duration? duration,
    TextAlign? titleTextAlign,
    TextAlign? messageTextAlign,
  }) async {
    duration ??= getDurationFromLength(body);
    ElegantNotification.info(
      width: _defaultWidth,
      height: _getHeightFromLength(body?.length ?? 0),
      title: _titleBuilder(
        title: title ?? "Note",
        titleTextAlign: titleTextAlign,
      ),
      description: _descriptionBuilder(
        body: body ?? '',
        messageTextAlign: messageTextAlign,
      ),
      action: _actionBuilder(
        onActionPressed: onActionPressed,
        actionWidget: action,
      ),
      stackedOptions: _stackedOptions,
      shadow: _boxShadow,
      toastDuration: duration,
      animation: _animationType,
      position: _position,
    ).show(NavigationService.context);
  }

  static void showSuccess(
    String? body, {
    Widget? action,
    String? title,
    dynamic Function()? onActionPressed,
    Duration? duration,
    TextAlign? titleTextAlign,
    TextAlign? messageTextAlign,
  }) async {
    duration ??= getDurationFromLength(body);
    ElegantNotification.success(
      width: _defaultWidth,
      height: _getHeightFromLength(body?.length ?? 0),
      title: _titleBuilder(
        title: title ?? "Success",
        titleTextAlign: titleTextAlign,
      ),
      description: _descriptionBuilder(
        body: body ?? "Success",
        messageTextAlign: messageTextAlign,
      ),
      action: _actionBuilder(
        onActionPressed: onActionPressed,
        actionWidget: action,
      ),
      stackedOptions: _stackedOptions,
      shadow: _boxShadow,
      toastDuration: duration,
      animation: _animationType,
      position: _position,
    ).show(NavigationService.context);
  }

  static Widget _titleBuilder({
    required String title,
    required TextAlign? titleTextAlign,
  }) {
    return Text(
      title,
      style: _titleStyle,
      textAlign: titleTextAlign,
    );
  }

  static Widget _descriptionBuilder({
    required String body,
    required TextAlign? messageTextAlign,
  }) {
    return Text(
      body,
      style: _messageStyle,
      textAlign: messageTextAlign,
    );
  }

  static InkWell? _actionBuilder({
    dynamic Function()? onActionPressed,
    Widget? actionWidget,
  }) {
    if (actionWidget == null) {
      return null;
    }
    return InkWell(
      onTap: onActionPressed,
      child: actionWidget,
    );
  }

  static Duration getDurationFromLength(String? text) {
    text ??= '';
    if (text.length < 50) return const Duration(seconds: 3);
    if (text.length < 100) return const Duration(seconds: 5);
    if (text.length < 150) return const Duration(seconds: 6);
    return const Duration(seconds: 7);
  }

  static double _getHeightFromLength(int length) {
    if (length < 50) return 100;
    if (length < 100) return 130;
    if (length < 150) return 160;
    return 220;
  }
}
